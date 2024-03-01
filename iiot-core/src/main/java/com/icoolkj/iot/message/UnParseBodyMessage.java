package com.icoolkj.iot.message;


import com.icoolkj.iot.MessageBody;
import com.icoolkj.iot.MessageHead;
import com.icoolkj.iot.SocketMessage;

/**
 * 未解析报文体
 */
public abstract class UnParseBodyMessage extends SocketMessage {

    public UnParseBodyMessage(byte[] message) {
        super(message);
    }

    public UnParseBodyMessage(MessageHead head) {
        this(head, EMPTY_MESSAGE_BODY);
    }

    public UnParseBodyMessage(MessageHead head, MessageBody body) {
        super(head, body);
    }
}
