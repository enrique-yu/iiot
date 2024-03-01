package com.icoolkj.file.domain;

/**
 * @author icoolkj
 * @version 1.0
 * @description UpdateFileNameRequest
 * @createDate 2023/09/24
 */
public class UpdateFileNameRequest {
    private String fileId;
    private String newFileName;

    // 构造函数、getter和setter方法

    public UpdateFileNameRequest() {
    }

    public UpdateFileNameRequest(String fileId, String newFileName) {
        this.fileId = fileId;
        this.newFileName = newFileName;
    }

    public String getFileId() {
        return fileId;
    }

    public void setFileId(String fileId) {
        this.fileId = fileId;
    }

    public String getNewFileName() {
        return newFileName;
    }

    public void setNewFileName(String newFileName) {
        this.newFileName = newFileName;
    }
}
