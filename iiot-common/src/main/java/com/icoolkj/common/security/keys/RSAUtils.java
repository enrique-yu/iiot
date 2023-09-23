package com.icoolkj.common.security.keys;
import javax.crypto.Cipher;
import java.io.ByteArrayOutputStream;
import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

/**
 * @author icoolkj
 * @version 1.1
 * @description RSAUtils
 * @createDate 2023/09/22
 */
public class RSAUtils {
    /**
     * RSA最大加密明文大小 2048/8-11
     */
    private static final int MAX_ENCRYPT_BLOCK = 245;
    /**
     * RSA最大解密密文大小 2048/8
     */
    private static final int MAX_DECRYPT_BLOCK = 256;
    /**
     * 定义加密方式
     */
    private static final String KEY_RSA = "RSA";
    /**
     * 定义签名算法
     */
    private static final String KEY_RSA_SIGNATURE = "SHA256withRSA";

    private static final Object lock = new Object();

    /**
     * 设置密钥对的bit数，越大越安全，但速度减慢，一般使用512或1024
     */
    public static Map<String, Object> generateKeyPair(int keySize) {
        synchronized (lock) {
            try {
                KeyPairGenerator generator = KeyPairGenerator.getInstance(KEY_RSA);
                generator.initialize(keySize);
                KeyPair keyPair = generator.generateKeyPair();
                Map<String, Object> keyMap = new HashMap<>();
                keyMap.put("publicKey", keyPair.getPublic());
                keyMap.put("privateKey", keyPair.getPrivate());
                return keyMap;
            } catch (Exception e) {
                throw new RuntimeException("Error generating RSA key pair", e);
            }
        }
    }

    /**
     * 获取Base64编码的公钥字符串
     */
    public static String publicKeyToBase64(PublicKey publicKey) {
        return Base64.getEncoder().encodeToString(publicKey.getEncoded());
    }

    /**
     * 获取Base64编码的私钥字符串
     */
    public static String privateKeyToBase64(PrivateKey privateKey) {
        return Base64.getEncoder().encodeToString(privateKey.getEncoded());
    }

    /**
     * Base64编码的公钥字符串转公钥
     */
    public static PublicKey base64ToPublicKey(String publicKeyBase64) {
        try {
            byte[] publicKeyBytes = Base64.getDecoder().decode(publicKeyBase64);
            KeyFactory keyFactory = KeyFactory.getInstance(KEY_RSA);
            X509EncodedKeySpec keySpec = new X509EncodedKeySpec(publicKeyBytes);
            return keyFactory.generatePublic(keySpec);
        } catch (Exception e) {
            throw new RuntimeException("Error decoding public key", e);
        }
    }

    /**
     * Base64编码的私钥字符串转私钥
     */
    public static PrivateKey base64ToPrivateKey(String privateKeyBase64) {
        try {
            byte[] privateKeyBytes = Base64.getDecoder().decode(privateKeyBase64);
            KeyFactory keyFactory = KeyFactory.getInstance(KEY_RSA);
            PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(privateKeyBytes);
            return keyFactory.generatePrivate(keySpec);
        } catch (Exception e) {
            throw new RuntimeException("Error decoding private key", e);
        }
    }

    /**
     * 公钥加密  如果大于245则分段加密
     */
    public static String encrypt(String plainText, PublicKey publicKey) {
        try {
            Cipher cipher = Cipher.getInstance(KEY_RSA);
            cipher.init(Cipher.ENCRYPT_MODE, publicKey);
            byte[] data = plainText.getBytes(StandardCharsets.UTF_8);
            int inputLen = data.length;
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            int offSet = 0;
            byte[] cache;
            int i = 0;
            while (inputLen - offSet > 0) {
                if (inputLen - offSet > MAX_ENCRYPT_BLOCK) {
                    cache = cipher.doFinal(data, offSet, MAX_ENCRYPT_BLOCK);
                } else {
                    cache = cipher.doFinal(data, offSet, inputLen - offSet);
                }
                out.write(cache, 0, cache.length);
                i++;
                offSet = i * MAX_ENCRYPT_BLOCK;
            }
            byte[] encryptedData = out.toByteArray();
            out.close();
            return Base64.getEncoder().encodeToString(encryptedData);
        } catch (Exception e) {
            throw new RuntimeException("Error encrypting data", e);
        }
    }

    /**
     * 公钥解密 如果大于256则分段解密
     */
    public static String decrypt(String encryptedText, PrivateKey privateKey) {
        try {
            Cipher cipher = Cipher.getInstance(KEY_RSA);
            cipher.init(Cipher.DECRYPT_MODE, privateKey);
            byte[] encryptedData = Base64.getDecoder().decode(encryptedText);
            int inputLen = encryptedData.length;
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            int offSet = 0;
            byte[] cache;
            int i = 0;
            while (inputLen - offSet > 0) {
                if (inputLen - offSet > MAX_DECRYPT_BLOCK) {
                    cache = cipher.doFinal(encryptedData, offSet, MAX_DECRYPT_BLOCK);
                } else {
                    cache = cipher.doFinal(encryptedData, offSet, inputLen - offSet);
                }
                out.write(cache, 0, cache.length);
                i++;
                offSet = i * MAX_DECRYPT_BLOCK;
            }
            byte[] decryptedData = out.toByteArray();
            out.close();
            return new String(decryptedData, StandardCharsets.UTF_8);
        } catch (Exception e) {
            throw new RuntimeException("Error decrypting data", e);
        }
    }

    /**
     * 用私钥对加密数据进行签名
     */
    public static String sign(String data, PrivateKey privateKey) {
        try {
            Signature signature = Signature.getInstance(KEY_RSA_SIGNATURE);
            signature.initSign(privateKey);
            signature.update(data.getBytes(StandardCharsets.UTF_8));
            byte[] signBytes = signature.sign();
            return Base64.getEncoder().encodeToString(signBytes);
        } catch (Exception e) {
            throw new RuntimeException("Error signing data", e);
        }
    }

    /**
     * 校验数字签名
     * @return 校验成功返回true，失败返回false
     */
    public static boolean verify(String data, String signature, PublicKey publicKey) {
        try {
            Signature sign = Signature.getInstance(KEY_RSA_SIGNATURE);
            sign.initVerify(publicKey);
            sign.update(data.getBytes(StandardCharsets.UTF_8));
            byte[] signatureBytes = Base64.getDecoder().decode(signature);
            return sign.verify(signatureBytes);
        } catch (Exception e) {
            throw new RuntimeException("Error verifying signature", e);
        }
    }


    /**
     * 测试方法
     */
    public static void main(String[] args) {
        int keySize = 2048; //设置密钥对的bit数，越大越安全，但速度减慢，一般使用512或1024
        Map<String, Object> keyPair = RSAUtils.generateKeyPair(keySize);
        PublicKey publicKey = (PublicKey) keyPair.get("publicKey");
        PrivateKey privateKey = (PrivateKey) keyPair.get("privateKey");
        System.out.println("publicKey = " + publicKeyToBase64(publicKey));
        System.out.println("privateKey = " + privateKeyToBase64(privateKey));

        String originalText  = "大鹏一日同风起，扶摇直上九万里。假令风歇时下来，犹能簸却沧溟水。——李白《上李邕》";
        String encryptedText = RSAUtils.encrypt(originalText, publicKey);
        String decryptedText = RSAUtils.decrypt(encryptedText, privateKey);

        System.out.println("Original Text: " + originalText);
        System.out.println("Encrypted Text: " + encryptedText);
        System.out.println("Decrypted Text: " + decryptedText);

        System.out.println("Encrypted Text: " + encryptedText);
        System.out.println("Decrypted Text: " + decryptedText);

        String dataToSign = "为天地立心，为生民立命，为往圣继绝学，为万世开太平！——张载《横渠语录》";
        String signature = RSAUtils.sign(dataToSign, privateKey);
        boolean isVerified = RSAUtils.verify(dataToSign, signature, publicKey);

        System.out.println("Data to Sign: " + dataToSign);
        System.out.println("Generated Signature: " + signature);
        System.out.println("Signature Verification Result: " + isVerified);
    }

}

