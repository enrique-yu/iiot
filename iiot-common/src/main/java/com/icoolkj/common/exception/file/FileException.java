package com.icoolkj.common.exception.file;

import com.icoolkj.common.exception.base.BaseException;

/**
 * @author icoolkj
 * @version 1.0
 * @description  FileException
 * @createDate 2023/09/23
 */
public class FileException extends BaseException
{
    private static final long serialVersionUID = 1L;

    public FileException(String module, String code, Object[] args, String defaultMessage) { super(module, code, args, defaultMessage); }

    public FileException(String module, String code, Object[] args) {
        super(module, code, args);
    }

    public FileException(String module, String defaultMessage) {
        super(module, defaultMessage);
    }

    public FileException(String code, Object[] args) { super(code, args); }

    public FileException(String defaultMessage) {
        super(defaultMessage);
    }
}
