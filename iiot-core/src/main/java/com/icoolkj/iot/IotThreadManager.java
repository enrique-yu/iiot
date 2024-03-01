package com.icoolkj.iot;

import io.netty.channel.EventLoopGroup;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.util.NettyRuntime;
import io.netty.util.concurrent.DefaultEventExecutor;
import io.netty.util.concurrent.DefaultThreadFactory;
import io.netty.util.concurrent.EventExecutor;
import io.netty.util.internal.SystemPropertyUtil;

import java.time.Duration;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * 线程管理
 */
public class IotThreadManager implements LifeCycle {

    private EventLoopGroup bossGroup;
    private EventLoopGroup workerGroup;
    private IotCoreProperties properties;
    private EventExecutor deviceManageEventExecutor;
    private ScheduledExecutorService executorService;
    private static IotThreadManager threadManager = new IotThreadManager();

    protected IotThreadManager() { }

    public static IotThreadManager instance() {
        return threadManager;
    }

    public EventLoopGroup getBossGroup() {
        return bossGroup;
    }

    public EventLoopGroup getWorkerGroup() {
        return workerGroup;
    }

    /**
     * 设备管理模块使用的调度执行器
     * @return
     */
    public EventExecutor getDeviceManageEventExecutor() {
        return deviceManageEventExecutor;
    }

    public ScheduledExecutorService getExecutorService() {
        return executorService;
    }

    /**
     * @param config {@link IotCoreProperties}
     */
    @Override
    public synchronized void start(Object config) {
        if(this.properties == null) {
            this.properties = (IotCoreProperties) config;

            // 启用服务端
            if(properties.getBossThreadNum() > 0) {
                // IST = Iot Selector Thread
                bossGroup = new NioEventLoopGroup(properties.getBossThreadNum(), new DefaultThreadFactory("IST"));
            }

            int workerThreadNum = properties.getWorkerThreadNum();
            if(workerThreadNum == 0) { // 工作线程组
                workerThreadNum = Math.max(1, SystemPropertyUtil.getInt(
                        "io.netty.eventLoopThreads", NettyRuntime.availableProcessors() * 2));
            }

            if(workerThreadNum > 0) {
                // IWT = Iot Worker Thread
                workerGroup = new NioEventLoopGroup(workerThreadNum, new DefaultThreadFactory("IWT"));
            }

            // IDM = Iot Device Manager
            this.deviceManageEventExecutor = new DefaultEventExecutor(workerGroup, new DefaultThreadFactory("IDM"));

            // IOT任务执行器
            IotCoreProperties.IotTaskExecutionProperties task = properties.getTask();
            DefaultThreadFactory threadFactory = new DefaultThreadFactory(task.getThreadNamePrefix());
            executorService = Executors.newScheduledThreadPool(task.getCoreSize(), threadFactory);
        }
    }

    @Override
    public void close() {
        if(bossGroup != null && !workerGroup.isShutdown()) {
            bossGroup.shutdownGracefully();
        }

        if(workerGroup != null && !workerGroup.isShutdown()) {
            workerGroup.shutdownGracefully();
        }

        if(!this.deviceManageEventExecutor.isShutdown()) {
            this.deviceManageEventExecutor.shutdownGracefully();
        }

        if(!this.executorService.isShutdown()) {
            this.executorService.shutdown();
            IotCoreProperties.IotTaskExecutionProperties task = properties.getTask();
            if(task.isAwaitTermination()) {
                Duration terminationPeriod = task.getAwaitTerminationPeriod();
                long seconds = terminationPeriod.getSeconds();
                try {
                    boolean termination = this.executorService.awaitTermination(seconds, TimeUnit.SECONDS);
                    if(!termination) {
                        this.executorService.shutdownNow();
                    }
                } catch (InterruptedException e) {
                    this.executorService.shutdownNow();
                }
            }
        }
    }

    public IotCoreProperties getProperties() {
        return properties;
    }
}
