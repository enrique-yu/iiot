package com.icoolkj.file.domain;

import com.icoolkj.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 文件业务记录对象 file_relation_record
 *
 * @author icoolkj
 * @date 2023-09-17
 */
public class FileRelationRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** file_record_id */
    private String fileRelationRecordId;

    /** 所属业务记录ID */
    private String businessRecordId;

    /** 文件明细ID */
    private String fileDetailId;

    /** 状态（0正常 1停用） */
    private String recordStatus;

    /** 删除标记（0代表存在 2代表删除） */
    private String delFlag;

    private FileDetail fileDetail;

    public void setFileRelationRecordId(String fileRelationRecordId)
    {
        this.fileRelationRecordId = fileRelationRecordId;
    }

    public String getFileRelationRecordId()
    {
        return fileRelationRecordId;
    }
    public void setBusinessRecordId(String businessRecordId)
    {
        this.businessRecordId = businessRecordId;
    }

    public String getBusinessRecordId()
    {
        return businessRecordId;
    }
    public void setFileDetailId(String fileDetailId)
    {
        this.fileDetailId = fileDetailId;
    }

    public String getFileDetailId()
    {
        return fileDetailId;
    }
    public void setRecordStatus(String recordStatus)
    {
        this.recordStatus = recordStatus;
    }

    public String getRecordStatus()
    {
        return recordStatus;
    }
    public void setDelFlag(String delFlag)
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag()
    {
        return delFlag;
    }

    public FileDetail getFileDetail() {
        return fileDetail;
    }

    public void setFileDetail(FileDetail fileDetail) {
        this.fileDetail = fileDetail;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("fileRelationRecordId", getFileRelationRecordId())
            .append("businessRecordId", getBusinessRecordId())
            .append("fileDetailId", getFileDetailId())
            .append("recordStatus", getRecordStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
