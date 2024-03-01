package com.icoolkj.file.service;

import com.icoolkj.file.domain.FileUploadRequest;

import java.util.List;

/**
 * @author icoolkj
 * @version 1.0
 * @description IFileUploadRequestService
 * @createDate 2023/09/29
 */
public interface IFileUploadRequestService {

    public List<FileUploadRequest> getConfigDataListByCataLogCode(String fileCatalogCode);

}
