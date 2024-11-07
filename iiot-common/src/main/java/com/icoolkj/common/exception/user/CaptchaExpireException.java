package com.icoolkj.common.exception.user;

/**
 * 验证码失效异常类
 * 
 * @author:haiwei.yu01
 */
public class CaptchaExpireException extends UserException
{
    private static final long serialVersionUID = 1L;

    public CaptchaExpireException()
    {
        super("user.jcaptcha.expire", null);
    }
}
