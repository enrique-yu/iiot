package com.icoolkj.common.utils.aes;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

/**
 * AES加密工具类
 *
 * @author icoolkj
 **/
public class AESUtils {

    public static final String IV = "2068967686975289";

    public static final String KEY = "88Ic5686589869##";

    /**
     * 编码
     *
     * @param byteArray
     * @return
     */
    public static String encode(byte[] byteArray) {
        return new String(new Base64().encode(byteArray));
    }

    /**
     * 解码
     *
     * @param base64EncodedString
     * @return
     */
    public static byte[] decode(String base64EncodedString) {
        return new Base64().decode(base64EncodedString);
    }

    public static String base_decode(String oldString) {
        return oldString.replace("_a", "/").replace("_b", "+")
                .replace("_c", "=");
    }

    public static String base_encode(String oldString) {
        return oldString.replace("/", "_a").replace("+", "_b")
                .replace("=", "_c");
    }

    /**
     * @param data 密文
     * @param key  密钥，长度16
     * @param iv   偏移量，长度16
     * @return 明文
     * @author icoolkj
     * AES算法解密密文
     */
    public static String decryptAES(String data, String key, String iv) {
        try {
            byte[] encrypted1 = decode(base_decode(data));
            Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");
            SecretKeySpec keyspec = new SecretKeySpec(key.getBytes("UTF-8"),
                    "AES");
            IvParameterSpec ivspec = new IvParameterSpec(iv.getBytes("UTF-8"));
            cipher.init(Cipher.DECRYPT_MODE, keyspec, ivspec);
            byte[] original = cipher.doFinal(encrypted1);
            String originalString = new String(original, "UTF-8");
            return originalString.trim();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * @param data 明文
     * @param key  密钥，长度16
     * @param iv   偏移量，长度16
     * @return 密文
     * @author icoolkj
     * AES算法加密明文
     */
    public static String encryptAES(String data, String key, String iv) {
        try {
            Cipher cipher = Cipher.getInstance("AES/CBC/NoPadding");
            int blockSize = cipher.getBlockSize();
            byte[] dataBytes = data.getBytes("UTF-8");
            int plaintextLength = dataBytes.length;
            if (plaintextLength % blockSize != 0) {
                plaintextLength = plaintextLength
                        + (blockSize - (plaintextLength % blockSize));
            }
            byte[] plaintext = new byte[plaintextLength];
            System.arraycopy(dataBytes, 0, plaintext, 0, dataBytes.length);
            SecretKeySpec keyspec = new SecretKeySpec(key.getBytes("UTF-8"),
                    "AES");
            IvParameterSpec ivspec = new IvParameterSpec(iv.getBytes("UTF-8"));
            cipher.init(Cipher.ENCRYPT_MODE, keyspec, ivspec);
            byte[] encrypted = cipher.doFinal(plaintext);
            return Base64.encodeBase64String(encrypted);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


    public static void main(String[] args) throws Exception {

        String json = "89IC8cool.55%^";
        /** 加密 **/
        System.out.println(encryptAES(json, KEY, IV));

        /** 解密 **/
        System.out.println(decryptAES(base_encode("7t6e+A26rw0VFcgfNq/XeQ=="),KEY, IV));
    }

}
