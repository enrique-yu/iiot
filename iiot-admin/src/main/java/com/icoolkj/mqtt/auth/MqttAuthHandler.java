package com.icoolkj.mqtt.auth;

import net.dreamlu.iot.mqtt.core.server.auth.IMqttServerAuthHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.tio.core.ChannelContext;

/**
 * mqtt tcp、websocket 认证，
 * 按照需求和业务进行扩展
 *
 * @author icoolkj
 */
@Configuration(proxyBeanMethods = false)
public class MqttAuthHandler implements IMqttServerAuthHandler {

    private static final Logger logger = LoggerFactory.getLogger(MqttAuthHandler.class);

    @Override
    public boolean authenticate(ChannelContext context, String uniqueId, String clientId, String userName, String password) {
        // 客户端认证逻辑实现
        return true;
    }

}
