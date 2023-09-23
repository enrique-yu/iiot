package com.icoolkj.common.security.keys;

/**
 * @author icoolkj
 * @version 1.0
 * @description RsaKeyPairHolder
 * @createDate 2023/09/23
 */
import java.security.PrivateKey;
import java.security.PublicKey;
import java.util.Map;


public class RsaKeyPairHolder {
    private static volatile PublicKey publicKey;
    private static volatile PrivateKey privateKey;

    /**
     * 私有构造函数，防止外部实例化
     */
    private RsaKeyPairHolder() {
    }

    /**
     * 获取公钥，使用双重检查锁定确保线程安全
     */
    public static PublicKey getPublicKey() {
        if (publicKey == null) {
            synchronized (RsaKeyPairHolder.class) {
                if (publicKey == null) {
                    generateKeyPair();
                }
            }
        }
        return publicKey;
    }

    /**
     * 获取私钥，使用双重检查锁定确保线程安全
     */
    public static PrivateKey getPrivateKey() {
        if (privateKey == null) {
            synchronized (RsaKeyPairHolder.class) {
                if (privateKey == null) {
                    generateKeyPair();
                }
            }
        }
        return privateKey;
    }

    private static void generateKeyPair() {
        int keySize = 2048; // 设置密钥对的bit数，越大越安全，但速度减慢，一般使用512或1024
        try {
            Map<String, Object> keyPair = RSAUtils.generateKeyPair(keySize);
            publicKey = (PublicKey) keyPair.get("publicKey");
            privateKey = (PrivateKey) keyPair.get("privateKey");
        } catch (Exception e) {
            e.printStackTrace();
            // 处理密钥生成失败的情况，例如记录日志或抛出异常
        }
    }

    /**
     * 使用公钥加密
     */
    public static String encryptByPublicKey(String plainText) {
        try {
            return RSAUtils.encrypt(plainText, getPublicKey());
        } catch (Exception e) {
            e.printStackTrace();
            // 处理加密失败的情况，例如记录日志或抛出异常
            return null;
        }
    }

    /**
     * 使用私钥解密
     */
    public static String decryptByPrivateKey(String encryptedText) {
        try {
            return RSAUtils.decrypt(encryptedText, getPrivateKey());
        } catch (Exception e) {
            e.printStackTrace();
            // 处理解密失败的情况，例如记录日志或抛出异常
            return null;
        }
    }

}
