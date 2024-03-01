package com.icoolkj.iot;

import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.ClassUtil;
import cn.hutool.core.util.ReflectUtil;

import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

/**
 * 协议对应的业务处理器<
 */
public interface ProtocolHandle<T extends Protocol> {

    Method method = ReflectUtil.getMethod(ProtocolHandle.class, "handle", Protocol.class);

    /**
     * 协议的业务处理
     * @param protocol
     */
    Object handle(T protocol);

    default Class<T> protocolClass() {
        ParameterizedType parameterizedType = toParameterizedType(getClass(), ProtocolHandle.class);
        if(parameterizedType != null) {
            return (Class<T>) parameterizedType.getActualTypeArguments()[0];
        }

        return (Class<T>) ClassUtil.getTypeArgument(getClass());
    }

    static ParameterizedType toParameterizedType(Type type, Class cla) {
        ParameterizedType result = null;
        if (type instanceof ParameterizedType) {
            result = (ParameterizedType) type;
        } else if (type instanceof Class) {
            final Class<?> clazz = (Class<?>) type;
            Type genericSuper = clazz.getGenericSuperclass();
            if (null == genericSuper || Object.class.equals(genericSuper)) {
                // 如果类没有父类，而是实现一些定义好的泛型接口，则取接口的Type
                final Type[] genericInterfaces = clazz.getGenericInterfaces();
                if (ArrayUtil.isNotEmpty(genericInterfaces)) {
                    for (int i = 0; i < genericInterfaces.length; i++) {
                        genericSuper = genericInterfaces[i];
                        if(genericSuper instanceof ParameterizedType) {
                            Class<?> rawType = (Class<?>) ( (ParameterizedType)genericSuper).getRawType();
                            if(cla.isAssignableFrom(rawType)) {
                                break;
                            }
                        }
                    }
                }
            }
            result = toParameterizedType(genericSuper, cla);
        }
        return result;
    }
}
