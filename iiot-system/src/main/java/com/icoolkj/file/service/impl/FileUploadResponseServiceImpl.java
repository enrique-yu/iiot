package com.icoolkj.file.service.impl;

import com.icoolkj.file.domain.FileUploadResponse;
import com.icoolkj.file.mapper.FileUploadResponseMapper;
import com.icoolkj.file.service.IFileUploadResponseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author icoolkj
 * @version 1.0
 * @description FileUploadResponseServiceImpl
 * @createDate 2023/09/29
 */
@Service
public class FileUploadResponseServiceImpl implements IFileUploadResponseService
{
    @Autowired
    private FileUploadResponseMapper fileUploadResponseMapper;

    @Override
    public List<FileUploadResponse> selectFileByRelationIdAndBizId(String fileCatalogRelationId, String businessRecordId)
    {
        return fileUploadResponseMapper.selectFileByRelationIdAndBizId(fileCatalogRelationId, businessRecordId);
    }
}
