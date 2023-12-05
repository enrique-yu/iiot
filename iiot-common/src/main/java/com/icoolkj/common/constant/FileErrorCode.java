package com.icoolkj.common.constant;

/**
 * @author icoolkj
 * @version 1.0
 * @description FileErrorCode  文件异常代码（枚举类）
 * @createDate 2023/09/23
 */
public enum FileErrorCode
{
    FILE_SIZE_LIMIT_EXCEEDED("upload.filesize.exceed.limit", "文件大小超过限制"),

    FILE_NAME_LENGTH_LIMIT_EXCEEDED("upload.filename.length.exceed.limit", "文件名称长度超过限制"),

    FILE_TYPE_NOT_ALLOWED("upload.filetype.not.allowed", "文件类型不允许上传"),

    FILE_SUFFIX_NAME_NOT_ALLOWED("upload.file.suffixname.not.allowed", "文件后缀名不允许上传"),

    FILE_NUMBER_LIMIT_EXCEEDED("upload.filenumber.exceed.limit", "文件数量超过限制"),

    FILE_UPLOAD_ERROR("upload.file.error", "文件上传异常");

    private final String code;
    private final String message;

    FileErrorCode(String code, String message) {
        this.code = code;
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }
}
