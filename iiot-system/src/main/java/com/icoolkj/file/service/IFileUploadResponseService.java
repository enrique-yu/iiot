package com.icoolkj.file.service;

import com.icoolkj.file.domain.FileUploadResponse;

import java.util.List;

/**
 * @author icoolkj
 * @version 1.0
 * @description IFileUploadResponseService
 * @createDate 2023/09/29
 */
public interface IFileUploadResponseService
{
    public List<FileUploadResponse> selectFileByRelationIdAndBizId(String fileCatalogRelationId, String businessRecordId);
}
