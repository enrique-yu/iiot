package com.icoolkj.iot;


/**
 * 协议工厂
 */
public abstract class SocketProtocolFactory<T extends SocketMessage> implements IotProtocolFactory<T> {

    /*报文管理器*/
    private ProtocolTimeoutStorage delegation;

    public SocketProtocolFactory() {

    }

    public SocketProtocolFactory(ProtocolTimeoutStorage delegation) {
        this.delegation = delegation;
    }


    public AbstractProtocol getProtocol(T message) {
        String messageId = message.getHead().getMessageId();

        /**
         * 先移除客户端主动协议<hr>
         *     1. 如果移除成功说明是客户端主动发起的请求协议
         *     2. 如果移除失败有两种情况 <hr>
         *         一、协议超时了 已经被超时管理器移除
         *         二、此请求协议是服务端主动发起的 这种情况需要实例化一个服务端主动请求协议对象
         */
        // 尝试移除客户端协议
        AbstractProtocol protocol = remove(messageId);
        if(protocol != null) {
            return protocol;
        }

        // 实例化一个服务端主动请求协议对象
        ProtocolType type = message.getHead().getType();
        return doGetProtocol(message, type);
    }

    /**
     * 实例化服务端主动协议
     * 如果
     * @param message
     * @return
     */
    protected abstract AbstractProtocol<T> doGetProtocol(T message, ProtocolType type);

    @Override
    public AbstractProtocol get(String key) {
        if(key == null) {
            return null;
        }

        return (AbstractProtocol) delegation.get(key);
    }

    @Override
    public AbstractProtocol add(String key, Protocol val) {
        return (AbstractProtocol) delegation.add(key, val);
    }

    @Override
    public AbstractProtocol add(String key, Protocol protocol, long timeout) {
        return (AbstractProtocol) delegation.add(key, protocol, timeout);
    }

    @Override
    public AbstractProtocol remove(String key) {
        if(key == null) {
            return null;
        }

        return (AbstractProtocol) delegation.remove(key);
    }

    @Override
    public boolean isExists(String key) {
        return delegation.isExists(key);
    }

    @Override
    public Object getStorage() {
        return delegation.getStorage();
    }

    public ProtocolTimeoutStorage getDelegation() {
        return delegation;
    }

    public void setDelegation(ProtocolTimeoutStorage delegation) {
        this.delegation = delegation;
    }
}
