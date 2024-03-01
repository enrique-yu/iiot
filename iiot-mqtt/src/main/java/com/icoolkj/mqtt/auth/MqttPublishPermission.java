package com.icoolkj.mqtt.auth;

import net.dreamlu.iot.mqtt.codec.MqttQoS;
import net.dreamlu.iot.mqtt.core.server.auth.IMqttServerPublishPermission;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.tio.core.ChannelContext;

@Configuration(proxyBeanMethods = false)
public class MqttPublishPermission implements IMqttServerPublishPermission {

    private static final Logger logger = LoggerFactory.getLogger(MqttPublishPermission.class);

    /**
     * 否有发布权限
     *
     * @param context  ChannelContext
     * @param clientId 客户端 id
     * @param topic    topic
     * @param qoS      MqttQoS
     * @param isRetain 是否保留消息
     * @return 否有发布权限
     */
    @Override
    public boolean hasPermission(ChannelContext context, String clientId, String topic, MqttQoS qoS, boolean isRetain) {
        logger.info("Mqtt client publish permission check clientId:{} topic:{}.", clientId, topic);
        return true;
    }

}
