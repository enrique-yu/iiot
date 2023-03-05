package com.icoolkj.system.domain;

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
    @Excel(name = "区域编码")
    private String areaCode;

    /** 区域名称 */
    @Excel(name = "区域名称")
    private String areaName;

    /** 区域父级编码 */
    @Excel(name = "区域父级编码")
    private String areaPcode;

    /** 区域描述 */
    @Excel(name = "区域描述")
    private String areaDesc;

    /** 区域状态（0停用 1正常） */
    @Excel(name = "区域状态", readConverterExp = "0=停用,1=正常")
    private String areaStatus;

    /** 删除标志（0删除 1存在） */
    private String delFlag;

    public void setAreaCode(String areaCode) 
    {
        this.areaCode = areaCode;
    }

    public String getAreaCode() 
    {
        return areaCode;
    }
    public void setAreaName(String areaName) 
    {
        this.areaName = areaName;
    }

    public String getAreaName() 
    {
        return areaName;
    }
    public void setAreaPcode(String areaPcode) 
    {
        this.areaPcode = areaPcode;
    }

    public String getAreaPcode() 
    {
        return areaPcode;
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
            .append("areaCode", getAreaCode())
            .append("areaName", getAreaName())
            .append("areaPcode", getAreaPcode())
            .append("areaDesc", getAreaDesc())
            .append("areaStatus", getAreaStatus())
            .append("delFlag", getDelFlag())
            .toString();
    }
}
