package com.icoolkj.common.exception;

/**
 * @author:haiwei.yu01
 * @version 1.0
 * @description 业务异常封装类
 * @createDate 2023/05/03 11:29
 */
public class BusinessException extends RuntimeException{
    /**
     * 异常码
     */
    private String code;

    /**
     * 异常参数
     */
    private Object[] args;

    public BusinessException(String code) {
        this.code = code;
    }

    public BusinessException(String code, Object[] args) {
        this.code = code;
        this.args = args;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Object[] getArgs() {
        if(args != null) {
            return args.clone();
        }else {
            return null;
        }

    }

    public void setArgs(Object[] args) {
        if(args != null) {
            this.args = args.clone();
        }
    }
}
