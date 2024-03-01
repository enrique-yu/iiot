package com.icoolkj.iot.constant;

/**
 * 协议的执行状态
 */
public enum ExecStatus {

    success("成功"), timeout("超时"), offline("无此设备或断线"), fail("失败"), notWritable("不可写");

    public String desc;

    ExecStatus(String desc) {
        this.desc = desc;
    }

}
