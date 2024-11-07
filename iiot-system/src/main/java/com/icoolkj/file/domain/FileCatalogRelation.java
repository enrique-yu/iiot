package com.icoolkj.file.domain;

import com.icoolkj.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.math.BigDecimal;

/**
 * 文件与目录关系对象 file_catalog_relation
 *
 * @author:haiwei.yu01
 * @date 2023-09-16
 */
public class FileCatalogRelation extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** file_catalog_relation_id */
    private String fileCatalogRelationId;

    /** 文件目录编码 */
    private String fileCatalogCode;

    /** 文件配置代码 */
    private String fileConfigCode;

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

    /** 状态（0正常 1停用） */
    private String fileCatalogRelationStatus;

    /** 删除标记（0代表存在 2代表删除） */
    private String delFlag;

    /** 文件目录名称 */
    private String fileCatalogName;

    /** 文件目录对象 **/
    private FileCatalogConfig fileCatalogConfig;

    /** 文件配置名称 */
    private String fileConfigName;

    /** 文件配置对象*/
    private FileConfig fileConfig;

    public void setFileCatalogRelationId(String fileCatalogRelationId)
    {
        this.fileCatalogRelationId = fileCatalogRelationId;
    }

    public String getFileCatalogRelationId()
    {
        return fileCatalogRelationId;
    }
    public void setFileCatalogCode(String fileCatalogCode)
    {
        this.fileCatalogCode = fileCatalogCode;
    }

    public String getFileCatalogCode()
    {
        return fileCatalogCode;
    }
    public void setFileConfigCode(String fileConfigCode)
    {
        this.fileConfigCode = fileConfigCode;
    }

    public String getFileConfigCode()
    {
        return fileConfigCode;
    }
    public void setFileConfigSuffixName(String fileConfigSuffixName)
    {
        this.fileConfigSuffixName = fileConfigSuffixName;
    }

    public String getFileConfigSuffixName()
    {
        return fileConfigSuffixName;
    }
    public void setFileConfigContentType(String fileConfigContentType)
    {
        this.fileConfigContentType = fileConfigContentType;
    }

    public String getFileConfigContentType()
    {
        return fileConfigContentType;
    }
    public void setFileConfigMust(String fileConfigMust)
    {
        this.fileConfigMust = fileConfigMust;
    }

    public String getFileConfigMust()
    {
        return fileConfigMust;
    }
    public void setFileConfigMinNum(Long fileConfigMinNum)
    {
        this.fileConfigMinNum = fileConfigMinNum;
    }

    public Long getFileConfigMinNum()
    {
        return fileConfigMinNum;
    }
    public void setFileConfigMaxNum(Long fileConfigMaxNum)
    {
        this.fileConfigMaxNum = fileConfigMaxNum;
    }

    public Long getFileConfigMaxNum()
    {
        return fileConfigMaxNum;
    }
    public void setFileConfigMinSize(Long fileConfigMinSize)
    {
        this.fileConfigMinSize = fileConfigMinSize;
    }

    public Long getFileConfigMinSize()
    {
        return fileConfigMinSize;
    }
    public void setFileConfigMaxSize(Long fileConfigMaxSize)
    {
        this.fileConfigMaxSize = fileConfigMaxSize;
    }

    public Long getFileConfigMaxSize()
    {
        return fileConfigMaxSize;
    }
    public void setFileConfigSortNum(BigDecimal fileConfigSortNum)
    {
        this.fileConfigSortNum = fileConfigSortNum;
    }

    public BigDecimal getFileConfigSortNum()
    {
        return fileConfigSortNum;
    }
    public void setFileCatalogRelationStatus(String fileCatalogRelationStatus)
    {
        this.fileCatalogRelationStatus = fileCatalogRelationStatus;
    }

    public String getFileCatalogRelationStatus()
    {
        return fileCatalogRelationStatus;
    }
    public void setDelFlag(String delFlag)
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag()
    {
        return delFlag;
    }

    public String getFileCatalogName() {
        return fileCatalogName;
    }

    public void setFileCatalogName(String fileCatalogName) {
        this.fileCatalogName = fileCatalogName;
    }

    public FileCatalogConfig getFileCatalogConfig() {
        return fileCatalogConfig;
    }

    public void setFileCatalogConfig(FileCatalogConfig fileCatalogConfig) {
        this.fileCatalogConfig = fileCatalogConfig;
    }

    public String getFileConfigName() {
        return fileConfigName;
    }

    public void setFileConfigName(String fileConfigName) {
        this.fileConfigName = fileConfigName;
    }

    public FileConfig getFileConfig() {
        return fileConfig;
    }

    public void setFileConfig(FileConfig fileConfig) {
        this.fileConfig = fileConfig;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("fileCatalogRelationId", getFileCatalogRelationId())
            .append("fileCatalogCode", getFileCatalogCode())
            .append("fileConfigCode", getFileConfigCode())
            .append("fileConfigSuffixName", getFileConfigSuffixName())
            .append("fileConfigContentType", getFileConfigContentType())
            .append("fileConfigMust", getFileConfigMust())
            .append("fileConfigMinNum", getFileConfigMinNum())
            .append("fileConfigMaxNum", getFileConfigMaxNum())
            .append("fileConfigMinSize", getFileConfigMinSize())
            .append("fileConfigMaxSize", getFileConfigMaxSize())
            .append("fileConfigSortNum", getFileConfigSortNum())
            .append("fileCatalogRelationStatus", getFileCatalogRelationStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
