package com.icoolkj.common.core.domain.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.icoolkj.common.annotation.Excel;
import com.icoolkj.common.core.domain.BaseEntity;

/**
 * 系统区域配置对象 sys_area
 * 
 * @author ruoyi
 * @date 2023-03-05
 */
public class SysArea extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 区域编码 */
    private String areaId;

    /** 区域名称 */
    @Excel(name = "区域名称")
    private String areaName;

    /** 区域父级编码 */
    @Excel(name = "区域父级编码")
    private String parentId;

    /** 区域描述 */
    @Excel(name = "区域描述")
    private String areaDesc;

    /** 区域状态（0停用 1正常） */
    @Excel(name = "区域状态", readConverterExp = "0=停用,1=正常")
    private String areaStatus;

    /** 删除标志（0删除 1存在） */
    private String delFlag;

    public void setAreaId(String areaId) 
    {
        this.areaId = areaId;
    }

    public String getAreaId() 
    {
        return areaId;
    }
    public void setAreaName(String areaName) 
    {
        this.areaName = areaName;
    }

    public String getAreaName() 
    {
        return areaName;
    }
    public void setParentId(String parentId) 
    {
        this.parentId = parentId;
    }

    public String getParentId() 
    {
        return parentId;
    }
    public void setAreaDesc(String areaDesc) 
    {
        this.areaDesc = areaDesc;
    }

    public String getAreaDesc() 
    {
        return areaDesc;
    }
    public void setAreaStatus(String areaStatus) 
    {
        this.areaStatus = areaStatus;
    }

    public String getAreaStatus() 
    {
        return areaStatus;
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
            .append("areaId", getAreaId())
            .append("areaName", getAreaName())
            .append("parentId", getParentId())
            .append("areaDesc", getAreaDesc())
            .append("areaStatus", getAreaStatus())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
