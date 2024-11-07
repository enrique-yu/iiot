package com.icoolkj.file.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.icoolkj.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 文件明细对象 file_detail
 *
 * @author:haiwei.yu01
 * @date 2023-09-17
 */
public class FileDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** file_record_detail_id */
    private String fileDetailId;

    /** 所属文件目录关系ID */
    private String fileCatalogRelationId;

    /** 所属文件目录名称 */
    private String fileCatalogName;

    /** 所属文件目录编码 */
    private String fileCatalogCode;

    /** 所属文件配置名称 */
    private String fileConfigName;

    /** 所属文件配置编码 */
    private String fileConfigCode;

    /** 上传文件名称 */
    private String uploadName;

    /** 上传文件原始名称 */
    private String uploadOriginalName;

    /** 上传文件后缀名称 */
    private String uploadSuffixName;

    /** 上传文件类型 */
    private String uploadContentType;

    /** 上传文件大小 */
    private Long uploadSize;

    /** 上传文件服务器路径 */
    private String uploadParentPath;

    /** 上传文件路径 */
    private String uploadPath;

    /** 【图片类型】上传文件缩略图路径 */
    private String uploadThumbnailPath;

    /** 上传时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date uploadTime;

    /** 上传备注 */
    private String uploadDesc;

    /** 排序序号【如果是配置，则写入配置的序号】 */
    private BigDecimal uploadSortNum;

    /** 状态（0正常 1停用） */
    private String uploadStatus;

    /** 删除标记（0代表存在 2代表删除） */
    private String delFlag;

    public void setFileDetailId(String fileDetailId)
    {
        this.fileDetailId = fileDetailId;
    }

    public String getFileDetailId()
    {
        return fileDetailId;
    }
    public void setFileCatalogRelationId(String fileCatalogRelationId)
    {
        this.fileCatalogRelationId = fileCatalogRelationId;
    }

    public String getFileCatalogRelationId()
    {
        return fileCatalogRelationId;
    }
    public void setFileCatalogName(String fileCatalogName)
    {
        this.fileCatalogName = fileCatalogName;
    }

    public String getFileCatalogName()
    {
        return fileCatalogName;
    }
    public void setFileCatalogCode(String fileCatalogCode)
    {
        this.fileCatalogCode = fileCatalogCode;
    }

    public String getFileCatalogCode()
    {
        return fileCatalogCode;
    }
    public void setFileConfigName(String fileConfigName)
    {
        this.fileConfigName = fileConfigName;
    }

    public String getFileConfigName()
    {
        return fileConfigName;
    }
    public void setFileConfigCode(String fileConfigCode)
    {
        this.fileConfigCode = fileConfigCode;
    }

    public String getFileConfigCode()
    {
        return fileConfigCode;
    }
    public void setUploadName(String uploadName)
    {
        this.uploadName = uploadName;
    }

    public String getUploadName()
    {
        return uploadName;
    }
    public void setUploadOriginalName(String uploadOriginalName)
    {
        this.uploadOriginalName = uploadOriginalName;
    }

    public String getUploadOriginalName()
    {
        return uploadOriginalName;
    }
    public void setUploadSuffixName(String uploadSuffixName)
    {
        this.uploadSuffixName = uploadSuffixName;
    }

    public String getUploadSuffixName()
    {
        return uploadSuffixName;
    }
    public void setUploadContentType(String uploadContentType)
    {
        this.uploadContentType = uploadContentType;
    }

    public String getUploadContentType()
    {
        return uploadContentType;
    }
    public void setUploadSize(Long uploadSize)
    {
        this.uploadSize = uploadSize;
    }

    public Long getUploadSize()
    {
        return uploadSize;
    }
    public void setUploadParentPath(String uploadParentPath)
    {
        this.uploadParentPath = uploadParentPath;
    }

    public String getUploadParentPath()
    {
        return uploadParentPath;
    }
    public void setUploadPath(String uploadPath)
    {
        this.uploadPath = uploadPath;
    }

    public String getUploadPath()
    {
        return uploadPath;
    }
    public void setUploadThumbnailPath(String uploadThumbnailPath)
    {
        this.uploadThumbnailPath = uploadThumbnailPath;
    }

    public String getUploadThumbnailPath()
    {
        return uploadThumbnailPath;
    }
    public void setUploadTime(Date uploadTime)
    {
        this.uploadTime = uploadTime;
    }

    public Date getUploadTime()
    {
        return uploadTime;
    }
    public void setUploadDesc(String uploadDesc)
    {
        this.uploadDesc = uploadDesc;
    }

    public String getUploadDesc()
    {
        return uploadDesc;
    }
    public void setUploadSortNum(BigDecimal uploadSortNum)
    {
        this.uploadSortNum = uploadSortNum;
    }

    public BigDecimal getUploadSortNum()
    {
        return uploadSortNum;
    }
    public void setUploadStatus(String uploadStatus)
    {
        this.uploadStatus = uploadStatus;
    }

    public String getUploadStatus()
    {
        return uploadStatus;
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
            .append("fileDetailId", getFileDetailId())
            .append("fileCatalogRelationId", getFileCatalogRelationId())
            .append("fileCatalogName", getFileCatalogName())
            .append("fileCatalogCode", getFileCatalogCode())
            .append("fileConfigName", getFileConfigName())
            .append("fileConfigCode", getFileConfigCode())
            .append("uploadName", getUploadName())
            .append("uploadOriginalName", getUploadOriginalName())
            .append("uploadSuffixName", getUploadSuffixName())
            .append("uploadContentType", getUploadContentType())
            .append("uploadSize", getUploadSize())
            .append("uploadParentPath", getUploadParentPath())
            .append("uploadPath", getUploadPath())
            .append("uploadThumbnailPath", getUploadThumbnailPath())
            .append("uploadTime", getUploadTime())
            .append("uploadDesc", getUploadDesc())
            .append("uploadSortNum", getUploadSortNum())
            .append("uploadStatus", getUploadStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
