package com.icoolkj.common.exception;

/**
 * @author:haiwei.yu01
 * @version 1.0
 * @description 异常构建类
 * @createDate 2023/04/29 19:46
 */
public class BusinessExceptionBuilder {

    /**
     * 构建code
     * @param code 异常码
     * @return
     */
    public static BusinessException build(String code){
        return new BusinessException(code);
    }

    /**
     * 构建code和args
     * @param code 异常码
     * @param args 异常参数
     * @return
     */
    public static BusinessException build(String code ,Object... args){
        return new BusinessException(code, args);
    }

}
