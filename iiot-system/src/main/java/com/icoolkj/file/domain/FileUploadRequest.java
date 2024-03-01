package com.icoolkj.file.domain;

import java.math.BigDecimal;
import java.util.List;

/**
 * @author icoolkj
 * @version 1.0
 * @description
 * @createDate 2023/09/29
 */
public class FileUploadRequest
{
    /** file_catalog_relation_id */
    private String fileCatalogRelationId;

    /** 文件目录编码 */
    private String fileCatalogCode;

    /** 文件目录名称 */
    private String fileCatalogName;

    /** 文件配置代码 */
    private String fileConfigCode;

    /** 文件配置名称 */
    private String fileConfigName;

    /** 文件配置模板 */
    private String fileConfigTemplate;

    /** 文件类型【逗号拼接】 */
    private String fileConfigSuffixName;

    /** 上传文件类型 */
    private String fileConfigContentType;

    /** 是否必传【0非必须 1必须】 */
    private String fileConfigMust;

    /** 最小文件数量 */
    private Long fileConfigMinNum;

    /** 最大文件数量 */
    private Long fileConfigMaxNum;

    /** 最小文件大小 */
    private Long fileConfigMinSize;

    /** 最大文件大小 */
    private Long fileConfigMaxSize;

    /** 排序序号 */
    private BigDecimal fileConfigSortNum;

    private List<FileUploadResponse> fileUploadResponses;

    public String getFileCatalogRelationId() {
        return fileCatalogRelationId;
    }

    public void setFileCatalogRelationId(String fileCatalogRelationId) {
        this.fileCatalogRelationId = fileCatalogRelationId;
    }

    public String getFileCatalogCode() {
        return fileCatalogCode;
    }

    public void setFileCatalogCode(String fileCatalogCode) {
        this.fileCatalogCode = fileCatalogCode;
    }

    public String getFileCatalogName() {
        return fileCatalogName;
    }

    public void setFileCatalogName(String fileCatalogName) {
        this.fileCatalogName = fileCatalogName;
    }

    public String getFileConfigCode() {
        return fileConfigCode;
    }

    public void setFileConfigCode(String fileConfigCode) {
        this.fileConfigCode = fileConfigCode;
    }

    public String getFileConfigName() {
        return fileConfigName;
    }

    public void setFileConfigName(String fileConfigName) {
        this.fileConfigName = fileConfigName;
    }

    public String getFileConfigTemplate() {
        return fileConfigTemplate;
    }

    public void setFileConfigTemplate(String fileConfigTemplate) {
        this.fileConfigTemplate = fileConfigTemplate;
    }

    public String getFileConfigSuffixName() {
        return fileConfigSuffixName;
    }

    public void setFileConfigSuffixName(String fileConfigSuffixName) {
        this.fileConfigSuffixName = fileConfigSuffixName;
    }

    public String getFileConfigContentType() {
        return fileConfigContentType;
    }

    public void setFileConfigContentType(String fileConfigContentType) {
        this.fileConfigContentType = fileConfigContentType;
    }

    public String getFileConfigMust() {
        return fileConfigMust;
    }

    public void setFileConfigMust(String fileConfigMust) {
        this.fileConfigMust = fileConfigMust;
    }

    public Long getFileConfigMinNum() {
        return fileConfigMinNum;
    }

    public void setFileConfigMinNum(Long fileConfigMinNum) {
        this.fileConfigMinNum = fileConfigMinNum;
    }

    public Long getFileConfigMaxNum() {
        return fileConfigMaxNum;
    }

    public void setFileConfigMaxNum(Long fileConfigMaxNum) {
        this.fileConfigMaxNum = fileConfigMaxNum;
    }

    public Long getFileConfigMinSize() {
        return fileConfigMinSize;
    }

    public void setFileConfigMinSize(Long fileConfigMinSize) {
        this.fileConfigMinSize = fileConfigMinSize;
    }

    public Long getFileConfigMaxSize() {
        return fileConfigMaxSize;
    }

    public void setFileConfigMaxSize(Long fileConfigMaxSize) {
        this.fileConfigMaxSize = fileConfigMaxSize;
    }

    public BigDecimal getFileConfigSortNum() {
        return fileConfigSortNum;
    }

    public void setFileConfigSortNum(BigDecimal fileConfigSortNum) {
        this.fileConfigSortNum = fileConfigSortNum;
    }

    public List<FileUploadResponse> getFileUploadResponses() {
        return fileUploadResponses;
    }

    public void setFileUploadResponses(List<FileUploadResponse> fileUploadResponses) {
        this.fileUploadResponses = fileUploadResponses;
    }
}
