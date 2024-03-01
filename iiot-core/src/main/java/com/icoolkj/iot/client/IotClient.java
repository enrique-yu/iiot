package com.icoolkj.iot.client;

import java.util.function.Consumer;

public interface IotClient {

    default int getPort() {
        return this.getConfig().getPort();
    }

    default String getHost() {
        return this.getConfig().getHost();
    }

    ClientConnectProperties getConfig();

    void init(Object config);

    /**
     * 连接远程服务器
     * @param consumer 连接回调
     * @param timeout (毫秒) 连接超时时间 0表示不同步
     */
    Object connect(Consumer<?> consumer, long timeout);

    /**
     * 断开连接, 并且移除此客户端
     * @return
     */
    Object disconnect();

    /**
     * 断开连接
     */
    Object close();

    /**
     * 返回此客户端对应的组件
     * @return
     */
    ClientComponent getClientComponent();
}
