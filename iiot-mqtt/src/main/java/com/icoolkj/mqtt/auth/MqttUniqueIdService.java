package com.icoolkj.mqtt.auth;

import net.dreamlu.iot.mqtt.core.server.auth.IMqttServerUniqueIdService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.tio.core.ChannelContext;

/**
 * clientId，
 * 按照需求和业务进行扩展
 *
 * @author:haiwei.yu01
 */
@Configuration(proxyBeanMethods = false)
public class MqttUniqueIdService implements IMqttServerUniqueIdService {

    private static final Logger logger = LoggerFactory.getLogger(MqttUniqueIdService.class);

    @Override
    public String getUniqueId(ChannelContext context, String clientId, String userName, String password) {
        logger.info("Mqtt clientId:{} userName:{}，password:{}。", clientId, userName, password);
        // 返回的 uniqueId 会替代 mqtt client 传过来的 clientId，请保证返回的 uniqueId 唯一。
        return clientId;
    }

}
