package com.icoolkj.iot;


/**
 * 协议类异常
 *
 * @author:haiwei.yu01
 */
public class ProtocolException extends FrameworkException {

    private Object protocol;

    public ProtocolException(Object protocol) {
        this.protocol = protocol;
    }

    public ProtocolException(String message) {
        super(message);
    }

    public ProtocolException(String message, Object protocol) {
        super(message);
        this.protocol = protocol;
    }

    public ProtocolException(String message, Throwable cause) {
        super(message, cause);
    }

    public ProtocolException(Throwable cause) {
        super(cause);
    }

    public ProtocolException(Throwable cause, Object protocol) {
        super(cause);
        this.protocol = protocol;
    }

    public ProtocolException(String message, Throwable cause, Object protocol) {
        super(message, cause);
        this.protocol = protocol;
    }

    public ProtocolException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }

    public Object getProtocol() {
        return protocol;
    }

    public void setProtocol(Object protocol) {
        this.protocol = protocol;
    }
}
