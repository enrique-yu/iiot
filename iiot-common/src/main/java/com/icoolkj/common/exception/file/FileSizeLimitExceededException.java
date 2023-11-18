package com.icoolkj.common.exception.file;

/**
 * 文件名大小限制异常类
 * 
 * @author icoolkj
 */
public class FileSizeLimitExceededException extends FileException
{
    private static final long serialVersionUID = 1L;

    public FileSizeLimitExceededException(long defaultMaxSize)
    {
        super("upload.filesize.exceed.limit", new Object[] { defaultMaxSize });
    }
}
