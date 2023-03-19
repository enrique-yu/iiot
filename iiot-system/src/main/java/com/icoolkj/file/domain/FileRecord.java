package com.icoolkj.file.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.icoolkj.common.annotation.Excel;
import com.icoolkj.common.core.domain.BaseEntity;

/**
 * 文件记录对象 file_record
 * 
 * @author icoolkj
 * @date 2023-03-18
 */
public class FileRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** file_record_id */
    private String fileRecordId;

    /** 所属业务记录ID */
    @Excel(name = "所属业务记录ID")
    private String businessRecordId;

    /** 所属文件目录名称 */
    @Excel(name = "所属文件目录名称")
    private String fileCatalogName;

    /** 所属文件目录编码 */
    @Excel(name = "所属文件目录编码")
    private String fileCatalogCode;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String fileRecordStatus;

    /** 删除标记（0代表存在 2代表删除） */
    private String delFlag;

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
    public void setFileRecordStatus(String fileRecordStatus) 
    {
        this.fileRecordStatus = fileRecordStatus;
    }

    public String getFileRecordStatus() 
    {
        return fileRecordStatus;
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
            .append("fileRecordId", getFileRecordId())
            .append("businessRecordId", getBusinessRecordId())
            .append("fileCatalogName", getFileCatalogName())
            .append("fileCatalogCode", getFileCatalogCode())
            .append("fileRecordStatus", getFileRecordStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
