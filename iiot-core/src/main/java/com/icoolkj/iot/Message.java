package com.icoolkj.iot;

public interface Message {

    byte[] EMPTY = new byte[]{};

    /**
     * 返回报文长度
     *
     * @return
     */
    int length();

    /**
     * 返回报文字节数
     *
     * @return
     */
    byte[] getMessage();

    /**
     * 返回报文头
     *
     * @return
     */
    MessageHead getHead();

    /**
     * 返回报文体
     *
     * @return
     */
    MessageBody getBody();

}
