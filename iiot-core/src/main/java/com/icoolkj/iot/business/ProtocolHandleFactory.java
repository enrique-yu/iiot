package com.icoolkj.iot.business;

import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.ClassUtil;
import com.icoolkj.iot.*;
import com.icoolkj.iot.handle.proxy.ProtocolHandleProxy;
import com.icoolkj.iot.handle.proxy.ProtocolHandleProxyMatcher;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/**
 * 业务工厂
 * 通过协议类型获取对应的协议业务
 */
public class ProtocolHandleFactory<T extends ProtocolHandle> {

    private Logger logger = LoggerFactory.getLogger(getClass());
    private HashMap<Class<? extends Protocol>, T> mapper = new HashMap<>(64);
    private HashMap<Class<? extends Message>, Set<T>> messageMapper = new HashMap<>(32);
    /**
     * protocolHandle代理器
     */
    private Set<ProtocolHandleProxyMatcher> proxyMatchers;

    public ProtocolHandleFactory(Set<ProtocolHandleProxyMatcher> proxyMatchers) {
        this.proxyMatchers = proxyMatchers;
    }

    /**
     * 通过协议类型获取对应的协议业务
     * @param protocolClazz
     * @return
     */
    public T getHandle(Class<? extends Protocol> protocolClazz){
        return mapper.get(protocolClazz);
    }

    public Set<T> getHandles(Class<? extends Message> messageCla) {
        return messageMapper.get(messageCla);
    }

    /**
     * 移除指定协议的处理器
     * @param protocolCla
     * @return
     */
    public T remove(Class<? extends Protocol> protocolCla) {
        T remove = mapper.remove(protocolCla);
        if(remove != null) {
            Iterator<Set<T>> iterator = messageMapper.values().iterator();
            while (iterator.hasNext()) {
                if(iterator.next().remove(remove)) {
                    break;
                }
            }
        }

        return remove;
    }

    /**
     * 移除指定组件下面的所有处理器
     * @param messageCla
     * @return
     */
    public Set<T> removes(Class<? extends Message> messageCla) {
        Set<T> remove = messageMapper.remove(messageCla);
        if(CollectionUtil.isNotEmpty(remove)) {
            remove.forEach(item -> {
                Class aClass = item.protocolClass();
                mapper.remove(aClass);
            });
        }

        return remove;
    }

    public void register(T handle) {
        this.register(handle.protocolClass(), handle);
    }

    public void register(Class<? extends Protocol> type, T handle) {
        if (null == type) {
            logger.error("注册协议处理器失败 请指定对应的协议类型(泛型)<T> - 业务类型：{}<T> - 说明: 必须指定泛型T", handle.getClass().getSimpleName());
            throw new ProtocolException("["+handle.getClass().getSimpleName()+"]未指定协议业务对应的协议类型<T>, 必须指定泛型T");
        }

        handle = createProtocolProxy(handle);

        Class<?> messageClazz = ClassUtil.getTypeArgument(type);
        if(messageClazz != null) {
            Set<T> handles = messageMapper.get(messageClazz);
            if(handles == null) {
                messageMapper.put((Class<? extends Message>) messageClazz, handles = new HashSet<>());
            }

            handles.add(handle);
        } else {
            throw new FrameworkException("未指定协议对应的泛型参数["+type.getName()+"<M>]");
        }

        // 协议类型不能是抽象类和接口
        int modifiers = type.getModifiers();
        if(Modifier.isAbstract(modifiers) || Modifier.isInterface(modifiers)) {
            logger.error("注册协议处理器失败 错误的协议类型(不能是抽象类和接口)[{}] - 业务类型：{}<T> 业务对象只能注册到具体的实现协议, 必须指定泛型T "
                    , type.getSimpleName(), handle.getClass().getSimpleName());
            throw new FrameworkException("错误的协议类型(不能是抽象类和接口)["+type.getName()+"]");
        }

        if(mapper.containsKey(type)) {
            T t = mapper.get(type);
            logger.error("注册协议处理器失败 此协议[{}]已经包含了业务[{}] - 一个协议只能对应一个业务对象", type.getName(), t.getClass().getName());
            throw new FrameworkException("此协议["+type.getName()+"]已经包含了业务["+t.getClass().getName()+"], 一个协议只能对应一个业务对象");
        }

        mapper.put(type, handle);
        if(logger.isDebugEnabled()) {
            logger.debug("注册协议处理器 协议类型[{}] -> 业务类型[{}]", type.getSimpleName(), handle.getClass().getSimpleName());
        }
    }

    protected T createProtocolProxy(T handle) {
        Object proxy = handle;
        if(CollectionUtil.isNotEmpty(proxyMatchers)) {
            if(handle instanceof ProtocolHandleProxy) {
                for (ProtocolHandleProxyMatcher matcher : this.proxyMatchers) {
                    if(matcher.matcher(handle)) {
                        proxy = matcher.createProxy(proxy, (ProtocolHandleProxy) handle);
                    }
                }
            }
        }

        return (T) proxy;
    }
}
