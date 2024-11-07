package com.icoolkj.file.service;

import com.icoolkj.file.domain.FileUploadResponse;

import java.util.List;

/**
 * @author:haiwei.yu01
 * @version 1.0
 * @description IFileUploadResponseService
 * @createDate 2023/09/29
 */
public interface IFileUploadResponseService
{
    public List<FileUploadResponse> selectFileByRelationIdAndBizId(String fileCatalogRelationId, String businessRecordId);
}
