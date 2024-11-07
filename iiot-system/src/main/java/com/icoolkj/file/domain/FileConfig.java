package com.icoolkj.file.domain;

import com.icoolkj.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 文件配置对象 file_config
 * 
 * @author:haiwei.yu01
 * @date 2023-03-18
 */
public class FileConfig extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 文件配置代码 */
    private String fileConfigCode;

    /** 文件配置名称 */
    private String fileConfigName;

    /** 文件配置模板 */
    private String fileConfigTemplate;

    /** 文件配置备注信息 */
    private String fileConfigDesc;

    /** 状态（0正常 1停用） */
    private String fileConfigStatus;

    /** 删除标记（0代表存在 2代表删除） */
    private String delFlag;

    public void setFileConfigCode(String fileConfigCode) 
    {
        this.fileConfigCode = fileConfigCode;
    }

    public String getFileConfigCode() 
    {
        return fileConfigCode;
    }
    public void setFileConfigName(String fileConfigName) 
    {
        this.fileConfigName = fileConfigName;
    }

    public String getFileConfigName() 
    {
        return fileConfigName;
    }
    public void setFileConfigTemplate(String fileConfigTemplate) 
    {
        this.fileConfigTemplate = fileConfigTemplate;
    }

    public String getFileConfigTemplate() 
    {
        return fileConfigTemplate;
    }
    public void setFileConfigDesc(String fileConfigDesc) 
    {
        this.fileConfigDesc = fileConfigDesc;
    }

    public String getFileConfigDesc() 
    {
        return fileConfigDesc;
    }
    public void setFileConfigStatus(String fileConfigStatus) 
    {
        this.fileConfigStatus = fileConfigStatus;
    }

    public String getFileConfigStatus() 
    {
        return fileConfigStatus;
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
            .append("fileConfigCode", getFileConfigCode())
            .append("fileConfigName", getFileConfigName())
            .append("fileConfigTemplate", getFileConfigTemplate())
            .append("fileConfigDesc", getFileConfigDesc())
            .append("fileConfigStatus", getFileConfigStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
