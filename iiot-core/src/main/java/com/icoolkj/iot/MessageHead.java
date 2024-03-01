package com.icoolkj.iot;

/**
 * 报文头
 */
public interface MessageHead {
    /**
     * 设备编号
     *
     * @return
     */
    String getEquipCode();

    /**
     * 设置设备编号
     *
     * @param equipCode
     */
    MessageHead setEquipCode(String equipCode);

    /**
     * 报文的唯一编号
     *
     * @return
     */
    String getMessageId();

    /**
     * 设置报文id
     *
     * @param messageId
     * @return
     */
    MessageHead setMessageId(String messageId);

    /**
     * 获取交易类型
     *
     * @return
     */
    <T> T getType();

    byte[] getMessage();

    default int getLength() {
        return getMessage().length;
    }

}
