package com.icoolkj.mqtt.listener;

import net.dreamlu.iot.mqtt.codec.ByteBufferUtil;
import net.dreamlu.iot.mqtt.core.server.event.IMqttMessageListener;
import net.dreamlu.iot.mqtt.core.server.model.Message;
import net.dreamlu.iot.mqtt.spring.server.MqttServerTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.SmartInitializingSingleton;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;
import org.tio.core.ChannelContext;

/**
 * 消息监听
 * 优点：性能损失小
 *
 * @author:haiwei.yu01
 */
@Service
public class MqttServerMessageListener implements IMqttMessageListener , SmartInitializingSingleton {

    private static final Logger logger = LoggerFactory.getLogger(MqttServerMessageListener.class);

    @Autowired
    private ApplicationContext applicationContext;
    private MqttServerTemplate mqttServerTemplate;

    @Override
    public void onMessage(ChannelContext context, String clientId, Message message) {
        logger.info("context:{} clientId:{} message:{} payload:{}", context, clientId, message, ByteBufferUtil.toString(message.getPayload()));
    }

    @Override
    public void afterSingletonsInstantiated() {
        // 单利 bean 初始化完成之后从 ApplicationContext 中获取 bean
        mqttServerTemplate = applicationContext.getBean(MqttServerTemplate.class);
    }

}
