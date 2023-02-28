package com.icoolkj.mqtt.auth;

import net.dreamlu.iot.mqtt.core.server.http.api.code.ResultCode;
import net.dreamlu.iot.mqtt.core.server.http.api.result.Result;
import net.dreamlu.iot.mqtt.core.server.http.handler.HttpFilter;
import net.dreamlu.iot.mqtt.core.server.http.handler.MqttHttpRoutes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.annotation.Configuration;
import org.tio.http.common.HttpRequest;
import org.tio.http.common.HttpResponse;

/**
 * mqtt http 接口认证，
 * 按照需求和业务进行扩展
 *
 * @author icoolkj
 */
@Configuration(proxyBeanMethods = false)
public class MqttHttpAuthFilter implements HttpFilter, InitializingBean {

    private static final Logger logger = LoggerFactory.getLogger(MqttHttpAuthFilter.class);

    @Override
    public boolean filter(HttpRequest request) throws Exception {
        // 自行实现逻辑
        return true;
    }

    @Override
    public HttpResponse response(HttpRequest request) {
        // 认证不通过时的响应
        return Result.fail(request, ResultCode.E103);
    }

    @Override
    public void afterPropertiesSet() throws Exception {
        MqttHttpRoutes.addFilter(this);
    }
}
