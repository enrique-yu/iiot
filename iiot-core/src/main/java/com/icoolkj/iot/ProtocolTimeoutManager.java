package com.icoolkj.iot;

import cn.hutool.core.collection.ConcurrentHashSet;
import com.icoolkj.iot.business.ProtocolHandleFactory;
import com.icoolkj.iot.constant.ExecStatus;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * 协议请求的超时管理, 主要功能用来做请求的同步和异步回调
 * 放入到此管理器的协议, 在请求返回的时候可以通过此管理获取原先的协议对象
 */
public class ProtocolTimeoutManager implements LifeCycle {

    // 总共还有多少条数据未处理
    private long totalSize = 0;
    private Executor executor;
    private volatile boolean start;
    private ProtocolHandleFactory handleFactory;
    private Set<ProtocolTimeoutStorage> timeoutStorages;
    private Logger logger = LoggerFactory.getLogger(getClass());
    private static final String REMOVE_DESC = "协议超时管理({}) 超时移除({}ms) - 客户端编号: {} - messageId: {} - 协议类型: {}";

    public ProtocolTimeoutManager(ProtocolHandleFactory handleFactory) {
        this(handleFactory, Executors.newFixedThreadPool(1));
    }

    public ProtocolTimeoutManager(ProtocolHandleFactory handleFactory, Executor executor) {
        this.executor = executor;
        this.handleFactory = handleFactory;
        this.timeoutStorages = new ConcurrentHashSet<>();
    }

    public synchronized boolean register(ProtocolTimeoutStorage timeoutStorage) {
        if(timeoutStorage == null) {
            return false;
        }

        if(!this.timeoutStorages.contains(timeoutStorage)) {
            return this.timeoutStorages.add(timeoutStorage);
        }

        return false;
    }

    /**
     * 是否包含指定的{@code timeoutStorage}
     * @param timeoutStorage
     * @return
     */
    public boolean contains(ProtocolTimeoutStorage timeoutStorage) {
        return this.timeoutStorages.contains(timeoutStorage);
    }

    public synchronized void remove(ProtocolTimeoutStorage timeoutStorage) {
        if(timeoutStorage != null) { {
            Iterator<ProtocolTimeoutStorage> iterator = this.timeoutStorages.iterator();
            while (iterator.hasNext()) {
                if(iterator.next() == timeoutStorage) {
                    iterator.remove(); break;
                }
            }
        }}
    }

    @Override
    public synchronized void start(Object config) {
        if(!start) {
            start = true;
            executor.execute(new TimeoutTask());
        }
    }

    @Override
    public void close() {
        if(executor instanceof ExecutorService) {
            if(!((ExecutorService) executor).isShutdown()) {
                ((ExecutorService) executor).shutdownNow();
            }
        }
    }

    /**
     *
     * @param protocol 要移除的协议
     * @return 协议对应的设备编号
     */
    protected String protocolRemoveHandle(Protocol protocol) {
        if(protocol instanceof AbstractProtocol) {
            try {
                ((AbstractProtocol<?>) protocol).setExecStatus(ExecStatus.timeout);

                return protocol.getEquipCode();
            } finally {
                // 同步请求则释放锁 由调用线程继续执行业务
                if(((ProtocolPreservable) protocol).isSyncRequest()) {
                    ((ProtocolPreservable) protocol).releaseLock();
                } else {
                    // 异步请求使用工作线程执行业务
                    IotThreadManager.instance().getExecutorService().execute(() -> {
                        // 执行业务
                        ((BusinessAction) protocol).exec(this.handleFactory);
                    });
                }
            }
        }

        return null;
    }

    /**
     * 超时任务
     */
    class TimeoutTask implements Runnable {

        @Override
        public void run() {
            while (true) {
                try {
                    ProtocolTimeoutManager.this.totalSize = 0;
                    timeoutStorages.forEach(item -> {
                        protocolTimeoutValidate(item);
                    });

                    if(ProtocolTimeoutManager.this.totalSize < 1000) {
                        try {
                            Thread.sleep(100);
                        } catch (InterruptedException e) {

                        }
                    }

                    if(logger.isTraceEnabled()) {
                        logger.trace("协议超时管理 待校验协议数量({})", ProtocolTimeoutManager.this.totalSize);
                    }
                } catch (Exception e) {
                    logger.error("协议超时管理 超时校验异常: {}", e.getMessage(), e);
                }
            }
        }
    }

    /**
     * 协议超时校验
     * @param protocolTimeoutStorage
     */
    protected void protocolTimeoutValidate(ProtocolTimeoutStorage protocolTimeoutStorage) {
        Iterator<Map.Entry<String, Protocol>> iterator =
                protocolTimeoutStorage.getMapper().entrySet().iterator();

        while (iterator.hasNext()){
            Map.Entry<String, Protocol> next = iterator.next();
            ProtocolWrap protocol = (ProtocolWrap)next.getValue();
            if((System.currentTimeMillis() - protocol.getStartTime()) > protocol.getTimeout()){

                // 移除掉超时得协议
                iterator.remove();

                String equipCode = protocolRemoveHandle(protocol.getProtocol());
                if(logger.isWarnEnabled()) {
                    logger.warn(REMOVE_DESC, protocolTimeoutStorage.getDesc(), protocol.getTimeout()
                            , equipCode, next.getKey(), protocol.protocolType());
                }
            }
        }

        ProtocolTimeoutManager.this.totalSize += protocolTimeoutStorage.size();
    }

    public Set<ProtocolTimeoutStorage> getTimeoutStorages() {
        return Collections.unmodifiableSet(timeoutStorages);
    }
}
