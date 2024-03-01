package com.icoolkj.mqtt.auth;

import net.dreamlu.iot.mqtt.codec.ByteBufferUtil;
import net.dreamlu.iot.mqtt.codec.MqttQoS;
import net.dreamlu.iot.mqtt.core.server.auth.IMqttServerSubscribeValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.tio.core.ChannelContext;

/**
 * 订阅校验，
 * 按照求和业务进行扩展
 *
 * @author icoolkj
 */
@Configuration(proxyBeanMethods = false)
public class MqttSubscribeValidator implements IMqttServerSubscribeValidator {

    private static final Logger logger = LoggerFactory.getLogger(MqttSubscribeValidator.class);

    @Override
    public boolean isValid(ChannelContext context, String clientId, String topicFilter, MqttQoS qoS) {
        // 校验客户端订阅的 topic，校验成功返回 true，失败返回 false
        return true;
    }

}

