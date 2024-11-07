package com.icoolkj.file.domain;

import com.icoolkj.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 文件目录配置对象 file_catalog_config
 * 
 * @author:haiwei.yu01
 * @date 2023-03-18
 */
public class FileCatalogConfig extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 文件目录编码 */
    private String fileCatalogCode;

    /** 文件目录名称 */
    private String fileCatalogName;

    /** 文件目录配置备注信息 */
    private String fileCatalogDesc;

    /** 状态（0正常 1停用） */
    private String fileCatalogStatus;

    /** 删除标记（0代表存在 2代表删除） */
    private String delFlag;

    public void setFileCatalogCode(String fileCatalogCode) 
    {
        this.fileCatalogCode = fileCatalogCode;
    }

    public String getFileCatalogCode() 
    {
        return fileCatalogCode;
    }
    public void setFileCatalogName(String fileCatalogName) 
    {
        this.fileCatalogName = fileCatalogName;
    }

    public String getFileCatalogName() 
    {
        return fileCatalogName;
    }
    public void setFileCatalogDesc(String fileCatalogDesc) 
    {
        this.fileCatalogDesc = fileCatalogDesc;
    }

    public String getFileCatalogDesc() 
    {
        return fileCatalogDesc;
    }
    public void setFileCatalogStatus(String fileCatalogStatus) 
    {
        this.fileCatalogStatus = fileCatalogStatus;
    }

    public String getFileCatalogStatus() 
    {
        return fileCatalogStatus;
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
            .append("fileCatalogCode", getFileCatalogCode())
            .append("fileCatalogName", getFileCatalogName())
            .append("fileCatalogDesc", getFileCatalogDesc())
            .append("fileCatalogStatus", getFileCatalogStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
