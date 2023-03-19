package com.icoolkj.file.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.icoolkj.common.annotation.Excel;
import com.icoolkj.common.core.domain.BaseEntity;

/**
 * 文件记录明细对象 file_record_detail
 * 
 * @author icoolkj
 * @date 2023-03-18
 */
public class FileRecordDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** file_record_detail_id */
    private String fileRecordDetailId;

    /** 所属文件记录 */
    @Excel(name = "所属文件记录")
    private String fileRecordId;

    /** 所属业务记录ID */
    @Excel(name = "所属业务记录ID")
    private String businessRecordId;

    /** 所属文件目录关系ID */
    @Excel(name = "所属文件目录关系ID")
    private String fileCatalogRelationId;

    /** 所属文件配置名称 */
    @Excel(name = "所属文件配置名称")
    private String fileConfigName;

    /** 所属文件配置编码 */
    @Excel(name = "所属文件配置编码")
    private String fileConfigCode;

    /** 上传文件名称 */
    @Excel(name = "上传文件名称")
    private String uploadName;

    /** 上传文件原始名称 */
    @Excel(name = "上传文件原始名称")
    private String uploadOriginalName;

    /** 上传文件类型 */
    @Excel(name = "上传文件类型")
    private String uploadType;

    /** 上传文件大小 */
    @Excel(name = "上传文件大小")
    private Long uploadSize;

    /** 上传文件服务器路径 */
    @Excel(name = "上传文件服务器路径")
    private String uploadParentPath;

    /** 上传文件路径 */
    @Excel(name = "上传文件路径")
    private String uploadPath;

    /** 上传时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "上传时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date uploadTime;

    /** 上传备注 */
    @Excel(name = "上传备注")
    private String uploadDesc;

    /** 排序序号【如果是配置，则写入配置的序号】 */
    @Excel(name = "排序序号【如果是配置，则写入配置的序号】")
    private BigDecimal fileSortNum;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String uploadStatus;

    /** 删除标记（0代表存在 2代表删除） */
    private String delFlag;

    public void setFileRecordDetailId(String fileRecordDetailId) 
    {
        this.fileRecordDetailId = fileRecordDetailId;
    }

    public String getFileRecordDetailId() 
    {
        return fileRecordDetailId;
    }
    public void setFileRecordId(String fileRecordId) 
    {
        this.fileRecordId = fileRecordId;
    }

    public String getFileRecordId() 
    {
        return fileRecordId;
    }
    public void setBusinessRecordId(String businessRecordId) 
    {
        this.businessRecordId = businessRecordId;
    }

    public String getBusinessRecordId() 
    {
        return businessRecordId;
    }
    public void setFileCatalogRelationId(String fileCatalogRelationId) 
    {
        this.fileCatalogRelationId = fileCatalogRelationId;
    }

    public String getFileCatalogRelationId() 
    {
        return fileCatalogRelationId;
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
    public void setUploadType(String uploadType) 
    {
        this.uploadType = uploadType;
    }

    public String getUploadType() 
    {
        return uploadType;
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
    public void setFileSortNum(BigDecimal fileSortNum) 
    {
        this.fileSortNum = fileSortNum;
    }

    public BigDecimal getFileSortNum() 
    {
        return fileSortNum;
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
            .append("fileRecordDetailId", getFileRecordDetailId())
            .append("fileRecordId", getFileRecordId())
            .append("businessRecordId", getBusinessRecordId())
            .append("fileCatalogRelationId", getFileCatalogRelationId())
            .append("fileConfigName", getFileConfigName())
            .append("fileConfigCode", getFileConfigCode())
            .append("uploadName", getUploadName())
            .append("uploadOriginalName", getUploadOriginalName())
            .append("uploadType", getUploadType())
            .append("uploadSize", getUploadSize())
            .append("uploadParentPath", getUploadParentPath())
            .append("uploadPath", getUploadPath())
            .append("uploadTime", getUploadTime())
            .append("uploadDesc", getUploadDesc())
            .append("fileSortNum", getFileSortNum())
            .append("uploadStatus", getUploadStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
