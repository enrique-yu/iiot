package com.icoolkj.file.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.icoolkj.common.annotation.Excel;
import com.icoolkj.common.core.domain.BaseEntity;

/**
 * 文件与目录关系对象 file_catalog_relation
 * 
 * @author icoolkj
 * @date 2023-03-18
 */
public class FileCatalogRelation extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** file_catalog_relation_id */
    private String fileCatalogRelationId;

    /** 文件目录编码 */
    @Excel(name = "文件目录编码")
    private String fileCatalogCode;

    /** 文件配置代码 */
    @Excel(name = "文件配置代码")
    private String fileConfigCode;

    /** 文件类型【逗号拼接】 */
    @Excel(name = "文件类型【逗号拼接】")
    private String fileConfigType;

    /** 是否必传【0非必须 1必须】 */
    @Excel(name = "是否必传【0非必须 1必须】")
    private String fileConfigMust;

    /** 最小文件数量 */
    @Excel(name = "最小文件数量")
    private Long fileConfigMinNum;

    /** 最大文件数量 */
    @Excel(name = "最大文件数量")
    private Long fileConfigMaxNum;

    /** 最小文件大小 */
    @Excel(name = "最小文件大小")
    private Long fileConfigMinSize;

    /** 最大文件大小 */
    @Excel(name = "最大文件大小")
    private Long fileConfigMaxSize;

    /** 排序序号 */
    @Excel(name = "排序序号")
    private BigDecimal fileConfigSortNum;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String fileCatalogRelationStatus;

    /** 删除标记（0代表存在 2代表删除） */
    private String delFlag;

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
    public void setFileConfigType(String fileConfigType) 
    {
        this.fileConfigType = fileConfigType;
    }

    public String getFileConfigType() 
    {
        return fileConfigType;
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

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("fileCatalogRelationId", getFileCatalogRelationId())
            .append("fileCatalogCode", getFileCatalogCode())
            .append("fileConfigCode", getFileConfigCode())
            .append("fileConfigType", getFileConfigType())
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
