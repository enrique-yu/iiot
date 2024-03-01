package com.icoolkj.file.mapper;

import com.icoolkj.file.domain.FileUploadRequest;

import java.util.List;

/**
 * @author icoolkj
 * @version 1.0
 * @description
 * @createDate 2023/09/29
 */
public interface FileUploadRequestMapper {

    public List<FileUploadRequest> getConfigDataListByCataLogCode(String fileCatalogCode);

}
