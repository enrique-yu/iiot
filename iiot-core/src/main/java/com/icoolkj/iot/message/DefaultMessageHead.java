package com.icoolkj.iot.message;

import com.icoolkj.iot.*;

/**
 * 默认报文头
 * @see MessageHead
 */
public class DefaultMessageHead implements MessageHead {

    private byte[] message;

    /**
     * 设备编号
     */
    private String equipCode;

    /**
     * 报文id
     * @see ProtocolPreservable#relationKey()
     */
    private String messageId;

    /**
     * 协议类型, 用来区分各自的协议
     * @see Protocol#protocolType()
     * @see SocketProtocolFactory#getProtocol(SocketMessage) 通过此类型获取不同的协议
     */
    private ProtocolType type;

    /**
     * 用于报文解码
     * @param message
     */
    public DefaultMessageHead(byte[] message) {
        this.message = message;
    }

    /**
     * 用于报文编码 且头部是空报文
     * @param equipCode
     * @param type
     */
    public DefaultMessageHead(String equipCode, ProtocolType type) {
        this(equipCode, null, type, Message.EMPTY);
    }

    /**
     * 用于报文编码
     * @param equipCode
     * @param type
     * @param message
     */
    public DefaultMessageHead(String equipCode, ProtocolType type, byte[] message) {
        this(equipCode, null, type, message);
    }

    public DefaultMessageHead(String equipCode, String messageId, ProtocolType type) {
        this(equipCode, messageId, type, Message.EMPTY);
    }

    public DefaultMessageHead(String equipCode, String messageId, ProtocolType type, byte[] message) {
        this(message);
        this.type = type;
        this.equipCode = equipCode;
        this.messageId = messageId;
    }

    @Override
    public String getEquipCode() {
        return this.equipCode;
    }

    @Override
    public String getMessageId() {
        return this.messageId;
    }

    @Override
    public ProtocolType getType() {
        return this.type;
    }

    @Override
    public byte[] getMessage() {
        return this.message;
    }

    public void setMessage(byte[] message) {
        this.message = message;
    }

    public void setType(ProtocolType type) {
        this.type = type;
    }

    public DefaultMessageHead setEquipCode(String equipCode) {
        this.equipCode = equipCode; return this;
    }

    public DefaultMessageHead setMessageId(String messageId) {
        this.messageId = messageId; return this;
    }
}
