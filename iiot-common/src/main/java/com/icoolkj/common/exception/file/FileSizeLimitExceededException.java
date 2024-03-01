package com.icoolkj.common.exception.file;

import com.icoolkj.common.constant.FileErrorCode;

/**
 * @author icoolkj
 * @version 1.0
 * @description FileSizeLimitExceededException  文件大小限制异常类
 * @createDate 2023/09/23
 */
public class FileSizeLimitExceededException extends FileException
{
    private static final long serialVersionUID = 1L;

    public FileSizeLimitExceededException(long defaultMaxSize)
    {
        super(FileErrorCode.FILE_SIZE_LIMIT_EXCEEDED.getCode(), new Object[] { defaultMaxSize });
    }
}
