package com.icoolkj.iot;

import com.icoolkj.iot.message.EmptyMessageBody;
import com.icoolkj.iot.utils.ByteUtil;
import io.netty.channel.Channel;
import io.netty.channel.ChannelId;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.net.SocketAddress;

/**
 * Socket报文
 * <p>此报文未进行报文体解析, 将在如下两个地方解析对应的报文体 包括{@link #readBuild()} 和 {@link #writeBuild()}</p>
 * @see AbstractProtocol#buildRequestMessage() 在协议里面解析对应的报文体
 * @see AbstractProtocol#buildResponseMessage() 在协议里面解析对应的报文体
 * 要求一种设备类型需要对应一种报文 如下：
 * {@code ServerComponentFactory#getByClass(SocketMessage)} 通过不同的报文获取相应的组件
 */
public abstract class SocketMessage implements Message {

    /**
     * 二进制报文
     * -------   -------
     * header  +  body
     * -------   -------
     */
    protected byte[] message;

    /**
     * @see #EMPTY_MESSAGE_BODY 空报文体
     */
    protected MessageBody messageBody;

    /**
     * 报文头必须存在
     */
    protected MessageHead messageHead;

    /** 日志 */
    protected Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * @see Channel#id()
     * @see ChannelId#asShortText()
     */
    private String channelId;

    /**
     * 远程地址
     */
    private SocketAddress remote;

    /**空报文体*/
    public static final EmptyMessageBody EMPTY_MESSAGE_BODY = EmptyMessageBody.getInstance();

    /**
     * 通过报文内容创建一个报文对象(一般用于接受客户端的请求或者响应)
     * @see #doBuild(byte[])
     * @param message
     */
    public SocketMessage(byte[] message) {
        this.message = message;
    }

    /**
     * 通过报文头和报文体构建报文(一般用于平台主动请求或者响应客户端)
     * @see #EMPTY_MESSAGE_BODY 默认是用空报文体
     * @see #writeBuild()
     * @param messageHead
     */
    public SocketMessage(MessageHead messageHead) {
        this(messageHead, EMPTY_MESSAGE_BODY);
    }

    /**
     * 通过报文头和报文体构建报文(一般用于平台主动请求或者响应客户端)
     * @see #writeBuild()
     * @param messageHead
     * @param messageBody
     */
    public SocketMessage(MessageHead messageHead, MessageBody messageBody) {
        this.messageBody = messageBody;
        this.messageHead = messageHead;
    }

    /**
     * 从二进制报文{@link #message}解析出报文头{@link #messageHead}
     */
    public SocketMessage readBuild() {
        this.messageHead = doBuild(this.message);
        this.headValidate(this.messageHead);
        return this;
    }

    /**
     * 将报文头{@link #messageHead}和报文体{@link #messageBody}的内容合并成二进制{@link #message}报文
     * 注：此方法只有在{@link #message} == null的情况下调用, 这意味着可以自己构建报文{@link #setMessage(byte[])}
     */
    public void writeBuild() {
        // 创建报文对象
        int length = this.messageHead.getLength() + this.messageBody.getLength();
        this.message = new byte[length];
        ByteUtil.addBytes(message, this.messageHead.getMessage(), 0);
        ByteUtil.addBytes(message, this.messageBody.getMessage(), this.messageHead.getLength());
    }

    /**
     * 校验报文头, 报文头不能为null
     * @see #doBuild(byte[]) 必须返回报文头对象
     * @param head
     */
    protected void headValidate(MessageHead head) {
        if(head == null) {
            throw new IllegalArgumentException("未解析出报文头对象[#doBuild(byte[])]");
        }
    }

    /**
     * 解析出message里面的报文头对象
     * @see #message {@link #messageHead}
     * @param message
     */
    protected abstract MessageHead doBuild(byte[] message);

    public SocketAddress getRemote() {
        return remote;
    }

    public void setRemote(SocketAddress remote) {
        this.remote = remote;
    }

    @Override
    public int length() {
        return message.length;
    }

    @Override
    public byte[] getMessage() {
        return message;
    }

    @Override
    public MessageHead getHead() {
        return messageHead;
    }

    /**
     * 返回 {@link EmptyMessageBody}
     * @return
     */
    @Override
    public MessageBody getBody() {
        return messageBody;
    }

    public void setBody(MessageBody messageBody) {
        this.messageBody = messageBody;
    }

    public void setHead(MessageHead messageHead) {
        this.messageHead = messageHead;
    }

    public void setMessage(byte[] message) {
        this.message = message;
    }

    public String getChannelId() {
        return channelId;
    }

    public SocketMessage setChannelId(String channelId) {
        this.channelId = channelId;
        return this;
    }

    @Override
    public String toString() {
        return message != null ? ByteUtil.bytesToHexByFormat(message) : null;
    }
}
