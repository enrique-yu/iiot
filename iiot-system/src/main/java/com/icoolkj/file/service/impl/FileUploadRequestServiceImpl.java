package com.icoolkj.file.service.impl;

import com.icoolkj.file.domain.FileUploadRequest;
import com.icoolkj.file.mapper.FileUploadRequestMapper;
import com.icoolkj.file.service.IFileUploadRequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author icoolkj
 * @version 1.0
 * @description FileUploadRequestServiceImpl
 * @createDate 2023/09/29
 */
@Service
public class FileUploadRequestServiceImpl implements IFileUploadRequestService
{
    @Autowired
    private FileUploadRequestMapper fileUploadRequestMapper;

    @Override
    public List<FileUploadRequest> getConfigDataListByCataLogCode(String fileCatalogCode){
        return fileUploadRequestMapper.getConfigDataListByCataLogCode(fileCatalogCode);
    }

}
