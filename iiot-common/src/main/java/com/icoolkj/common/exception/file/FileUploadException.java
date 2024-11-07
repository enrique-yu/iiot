package com.icoolkj.common.exception.file;

import com.icoolkj.common.constant.FileErrorCode;

/**
 * @author:haiwei.yu01
 * @version 1.0
 * @description FileUploadException 文件上传异常类
 * @createDate 2023/09/23 17:55
 */
public class FileUploadException extends FileException
{
    private static final long serialVersionUID = 1L;

    public FileUploadException(String defaultMessage)
    {
        super(FileErrorCode.FILE_UPLOAD_ERROR.getCode(), new Object[] { defaultMessage });
    }
}
