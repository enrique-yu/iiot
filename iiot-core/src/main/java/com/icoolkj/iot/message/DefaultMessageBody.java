package com.icoolkj.iot.message;

import com.icoolkj.iot.MessageBody;

import static com.icoolkj.iot.Message.EMPTY;

/**
 * 默认报文体
 * @see MessageBody
 */
public class DefaultMessageBody implements MessageBody {

    private byte[] message;

    /**
     * 使用空报文
     */
    public DefaultMessageBody() {
        this(EMPTY);
    }

    public DefaultMessageBody(byte[] message) {
        this.message = message;
    }

    @Override
    public byte[] getMessage() {
        return this.message;
    }
}
