package com.icoolkj.common.exception.file;

import com.icoolkj.common.constant.FileErrorCode;

/**
 * @author:haiwei.yu01
 * @version 1.0
 * @description FileNumberExceededException 文件数量限制异常类
 * @createDate 2023/09/23
 */
public class FileNumberExceededException extends FileException
{
    private static final long serialVersionUID = 1L;

    public FileNumberExceededException(long defaultMaxNum)
    {
        super(FileErrorCode.FILE_NUMBER_LIMIT_EXCEEDED.getCode(), new Object[] { defaultMaxNum });
    }
}
