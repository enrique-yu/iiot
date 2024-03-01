package com.icoolkj.file.domain;

import java.util.Date;

/**
 * @author icoolkj
 * @version 1.0
 * @description FileUploadResponse
 * @createDate 2023/09/20 20:05
 */
public class FileUploadResponse {

    private String fileId;

    private String fileConfRelId;

    private String fileName;

    private String fileSuffixName;

    public String getFileId() {
        return fileId;
    }

    public void setFileId(String fileId) {
        this.fileId = fileId;
    }

    public String getFileConfRelId() {
        return fileConfRelId;
    }

    public void setFileConfRelId(String fileConfRelId) {
        this.fileConfRelId = fileConfRelId;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileSuffixName() {
        return fileSuffixName;
    }

    public void setFileSuffixName(String fileSuffixName) {
        this.fileSuffixName = fileSuffixName;
    }

}
