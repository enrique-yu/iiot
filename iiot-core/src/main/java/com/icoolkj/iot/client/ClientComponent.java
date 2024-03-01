package com.icoolkj.iot.client;

import cn.hutool.core.util.ClassUtil;
import com.icoolkj.iot.FrameworkComponent;

public interface ClientComponent<M extends ClientMessage> extends FrameworkComponent, MultiClientManager {

    /**
     * 获取默认客户端配置
     * @return {ClientConnectProperties or null}
     */
    ClientConnectProperties getConfig();

    /**
     * 获取默认客户端
     * @return {IotClient or null}
     */
    IotClient getClient();

    /**
     * 获取指定的客户端
     * @param clientKey 客户端标识
     * @return
     */
    IotClient getClient(Object clientKey);

    /**
     * 移除指定的客户端
     * @param clientKey
     */
    IotClient removeClient(Object clientKey);

    /**
     * 创建一个新客户端
     * @param config
     * @return
     */
    IotClient createNewClient(ClientConnectProperties config);

    @Override
    default Class<M> getMessageClass() {
        return (Class<M>) ClassUtil.getTypeArgument(getClass());
    }

}
