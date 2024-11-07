package com.icoolkj.file.service.impl;

import com.github.tobato.fastdfs.domain.conn.FdfsWebServer;
import com.icoolkj.common.config.FastDFSConfig;
import com.icoolkj.common.constant.SysConstants;
import com.icoolkj.common.exception.file.*;
import com.icoolkj.common.utils.StringUtils;
import com.icoolkj.file.domain.*;
import com.icoolkj.file.service.IFileCatalogRelationService;
import com.icoolkj.file.service.IFileDetailService;
import com.icoolkj.file.service.IFileRelationRecordService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

/**
 * @author:haiwei.yu01
 * @version 1.0
 * @description IFileUploadManageServiceImpl
 * @createDate 2023/09/10
 */
@Service
public class FileUploadManageService
{
    @Autowired
    private FdfsWebServer fdfsWebServer;

    @Autowired
    private FastDFSService fastDFSService;

    @Autowired
    private IFileDetailService fileDetailService;

    @Autowired
    private IFileCatalogRelationService fileCatalogRelationService;

    @Autowired
    private IFileRelationRecordService fileRelationRecordService;

    @Autowired
    private FastDFSConfig fastDFSConfig;


    public FileUploadResponse upload(MultipartFile file, String fileConfRelId, String fileDesc){
        FileDetail fileDetail = createFileDetail(file, fileConfRelId, fileDesc);
        FileUploadResponse fileUploadResponse = new FileUploadResponse();
        fileUploadResponse.setFileId(fileDetail.getFileDetailId());
        fileUploadResponse.setFileConfRelId(fileDetail.getFileCatalogRelationId());
        fileUploadResponse.setFileName(fileDetail.getUploadName());
        fileUploadResponse.setFileSuffixName(fileDetail.getUploadSuffixName());
        return fileUploadResponse;
    }

    private FileDetail createFileDetail(MultipartFile file, String fileConfRelId, String fileDesc) {
        if (file.getOriginalFilename().length() > 50) {  // 文件名长度限制
            throw new FileNameLengthLimitExceededException(50);
        }
        FileCatalogRelation fileCatalogRelation = fileCatalogRelationService.selectFileCatalogRelationByFileCatalogRelationId(fileConfRelId);
        FileCatalogConfig fileCatalogConfig =  fileCatalogRelation.getFileCatalogConfig();
        FileConfig fileConfig = fileCatalogRelation.getFileConfig();
        if (null == fileCatalogRelation) {
            throw new FileUploadException("文件关联关系配置不正确，请联系管理员！");
        }
        if (null == fileCatalogConfig) {
            throw new FileUploadException("文件目录未配置，请联系管理员！");
        }
        if (null == fileConfig) {
            throw new FileUploadException("文件未配置，请联系管理员！");
        }
        // 文件大小限制
        if (file.getSize() > fileCatalogRelation.getFileConfigMaxSize() * (1024 * 1024)) {
            throw new FileSizeLimitExceededException(fileCatalogRelation.getFileConfigMaxSize());
        }
        // 文件类型限制
        if (!fileCatalogRelation.getFileConfigContentType().contains(file.getContentType())) {
            throw new FileTypeNotAllowedException(fileCatalogRelation.getFileConfigContentType());
        }
        // 文件后缀名
        String suffixName = FilenameUtils.getExtension(file.getOriginalFilename()).toLowerCase();
        if (!fileCatalogRelation.getFileConfigSuffixName().contains(suffixName)) {
            throw new FileSuffixNameNotAllowedException(fileCatalogRelation.getFileConfigSuffixName());
        }
        FileDetail fileDetail = new FileDetail();
        fileDetail.setFileCatalogRelationId(fileConfRelId);
        fileDetail.setFileCatalogCode(fileCatalogConfig.getFileCatalogCode());
        fileDetail.setFileCatalogName(fileCatalogConfig.getFileCatalogName());
        fileDetail.setFileConfigCode(fileConfig.getFileConfigCode());
        fileDetail.setFileConfigName(fileConfig.getFileConfigName());
        fileDetail.setUploadSortNum(fileCatalogRelation.getFileConfigSortNum());
        StorePathExtended storePathExtended = null;
        if (fastDFSService.isSupportImage(file.getContentType()) && fastDFSConfig.isThumbImageEnabled()){
            storePathExtended = fastDFSService.uploadImageWithThumbnail(file, null);
        } else{
            storePathExtended = fastDFSService.uploadFile(file, null);
        }
        fileDetail.setUploadName(FilenameUtils.getBaseName(file.getOriginalFilename()));
        fileDetail.setUploadOriginalName(FilenameUtils.getBaseName(file.getOriginalFilename()));
        fileDetail.setUploadSuffixName(suffixName);
        fileDetail.setUploadContentType(file.getContentType());
        fileDetail.setUploadParentPath(fdfsWebServer.getWebServerUrl());
        fileDetail.setUploadPath(storePathExtended.getStorePath().getFullPath());
        fileDetail.setUploadSize(file.getSize());
        fileDetail.setUploadThumbnailPath(storePathExtended.getThumbImageFullPath());
        fileDetail.setUploadTime(new Date());
        fileDetail.setUploadDesc(fileDesc);
        fileDetailService.insertFileDetail(fileDetail);
        return fileDetail;
    }

    public int updateFileName(UpdateFileNameRequest updateFileNameRequest) {
        String newFileName = updateFileNameRequest.getNewFileName();
        if (newFileName.length() > 50) {  // 文件名长度限制
            throw new FileNameLengthLimitExceededException(50);
        }
        FileDetail fileDetail = new FileDetail();
        fileDetail.setFileDetailId(updateFileNameRequest.getFileId());
        fileDetail.setUploadName(newFileName);
       return fileDetailService.updateFileDetail(fileDetail);
    }

    public void dealFileInfo(String businessRecordId, String[] fileIds) {
        FileRelationRecord fileRelationRecord = new FileRelationRecord();
        fileRelationRecord.setBusinessRecordId(businessRecordId);
        fileRelationRecord.setDelFlag(SysConstants.DEL_FLAG_2); // 更新成删除状态
        fileRelationRecordService.updateFileRelRecByBizId(fileRelationRecord);

        if (StringUtils.isNotNull(fileIds)) {
            for (String fileId : fileIds) {
                fileRelationRecord = new FileRelationRecord();
                fileRelationRecord.setBusinessRecordId(businessRecordId);
                fileRelationRecord.setFileDetailId(fileId);
                fileRelationRecord.setDelFlag(SysConstants.DEL_FLAG_0); // 更新成存在状态
                int row = fileRelationRecordService.updateFileRelRecByBizIdAndFileId(fileRelationRecord);
                if(row == 0) {
                    fileRelationRecordService.insertFileRelationRecord(fileRelationRecord);
                }
            }
        }
    }
}
