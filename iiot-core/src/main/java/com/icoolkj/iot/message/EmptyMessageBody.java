package com.icoolkj.iot.message;

/**
 * 空的报文体
 */
public class EmptyMessageBody extends DefaultMessageBody {

    private static EmptyMessageBody instance = new EmptyMessageBody();

    protected EmptyMessageBody() { }

    public static EmptyMessageBody getInstance() {
        return instance;
    }
}
