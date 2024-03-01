package com.icoolkj.iot;

import com.icoolkj.iot.business.ProtocolHandleFactory;

public interface BusinessAction {

    /**
     * 业务执行
     * @param factory 业务工厂
     */
    AbstractProtocol exec(ProtocolHandleFactory factory);

    /**
     * 业务执行
     * 执行设备主动请求的协议或者设备响应的协议所需要处理的业务
     * 1.如果是设备主动请求的协议则执行完业务之后需要响应设备, {@link AbstractProtocol}就是响应设备的协议报文
     * @param handle 协议业务
     */
    AbstractProtocol exec(ProtocolHandle handle);

}
