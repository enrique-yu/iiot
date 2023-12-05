package com.icoolkj.common.exception.file;

import com.icoolkj.common.constant.FileErrorCode;

/**
 * @author icoolkj
 * @version 1.0
 * @description FileSuffixNameNotAllowedException  文件后缀名限制异常类
 * @createDate 2023/09/23
 */
public class FileSuffixNameNotAllowedException extends FileException
{
    private static final long serialVersionUID = 1L;

    public FileSuffixNameNotAllowedException(String defaultMessage)
    {
        super(FileErrorCode.FILE_SUFFIX_NAME_NOT_ALLOWED.getCode(), new Object[] { defaultMessage });
    }
}
