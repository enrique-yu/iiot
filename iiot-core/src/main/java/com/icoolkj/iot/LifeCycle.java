package com.icoolkj.iot;

/**
 * 生命周期接口
 */
public interface LifeCycle {

    /**
     * 启动
     */
    void start(Object config);

    /**
     * 关闭
     */
    void close();
}
