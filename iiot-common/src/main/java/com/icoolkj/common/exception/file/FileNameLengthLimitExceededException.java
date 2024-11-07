package com.icoolkj.common.exception.file;

import com.icoolkj.common.constant.FileErrorCode;

/**
 * @author:haiwei.yu01
 * @version 1.0
 * @description FileNameLengthLimitExceededException 文件名称超长限制异常类
 * @createDate 2023/09/23
 */
public class FileNameLengthLimitExceededException extends FileException
{
    private static final long serialVersionUID = 1L;

    public FileNameLengthLimitExceededException(int defaultFileNameLength)
    {
        super(FileErrorCode.FILE_NAME_LENGTH_LIMIT_EXCEEDED.getCode(), new Object[] { defaultFileNameLength });
    }
}
