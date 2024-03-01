package com.icoolkj.iot;

/**
 * 报文体
 */
public interface MessageBody {

    byte[] getMessage();

    default int getLength() {
        return getMessage().length;
    }
}
