package com.icoolkj.file.mapper;

import com.icoolkj.file.domain.FileUploadRequest;

import java.util.List;

/**
 * @author:haiwei.yu01
 * @version 1.0
 * @description
 * @createDate 2023/09/29
 */
public interface FileUploadRequestMapper {

    public List<FileUploadRequest> getConfigDataListByCataLogCode(String fileCatalogCode);

}
