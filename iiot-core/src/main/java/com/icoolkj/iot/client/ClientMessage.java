package com.icoolkj.iot.client;

import com.icoolkj.iot.MessageBody;
import com.icoolkj.iot.MessageHead;
import com.icoolkj.iot.message.UnParseBodyMessage;

public abstract class ClientMessage extends UnParseBodyMessage {

    private ClientConnectProperties properties;

    public ClientMessage(byte[] message) {
        super(message);
    }

    public ClientMessage(MessageHead head) {
        super(head);
    }

    public ClientMessage(MessageHead head, MessageBody body) {
        super(head, body);
    }

    /**
     * 解析出message到指定的报文头对象, 主要解析出以下三个字段
     * @see MessageHead#getMessageId() 如果使用异步回调 必须解析
     * @see MessageHead#getEquipCode() 设备编号
     * @see MessageHead#getType() 协议类型, 如果是多协议的设备可以通过此字段标识
     * @param message
     */
    @Override
    protected abstract MessageHead doBuild(byte[] message);

    public String getMessageId() {
        MessageHead head = getHead();
        return head != null ? head.getMessageId() : null;
    }

    /**
     * 返回当前客户端的连接配置信息
     * @return
     */
    public ClientConnectProperties getProperties() {
        return properties;
    }

    public ClientMessage setProperties(ClientConnectProperties properties) {
        this.properties = properties; return this;
    }
}
