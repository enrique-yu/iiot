package com.icoolkj.iot.handle.proxy;

import java.lang.reflect.Proxy;

/**
 * 对处理器进行代理
 * @see com.icoolkj.iot.ProtocolHandle
 */
public interface ProtocolHandleProxyMatcher {

    boolean matcher(Object target);

    default Object createProxy(Object target, ProtocolHandleProxy handle) {
        final Class<?> targetClass = target.getClass();
        return Proxy.newProxyInstance(targetClass.getClassLoader()
                , targetClass.getInterfaces(), invocationHandler(target, handle));
    }

    ProtocolHandleInvocationHandler invocationHandler(Object target, ProtocolHandleProxy handleProxy);
}
