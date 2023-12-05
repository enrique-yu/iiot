package com.icoolkj.common.exception.file;

import com.icoolkj.common.constant.FileErrorCode;

/**
 * @author icoolkj
 * @version 1.0
 * @description FileTypeNotAllowedException 文件类型限制上传异常类
 * @createDate 2023/09/23
 */
public class FileTypeNotAllowedException extends FileException
{
    private static final long serialVersionUID = 1L;

    public FileTypeNotAllowedException(String defaultMessage)
    {
        super(FileErrorCode.FILE_TYPE_NOT_ALLOWED.getCode(), new Object[] { defaultMessage });
    }
}
