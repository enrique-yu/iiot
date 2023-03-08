package com.icoolkj.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.icoolkj.common.annotation.Excel;
import com.icoolkj.common.core.domain.BaseEntity;

/**
 * 系统组织权限对象 sys_domain_roles
 * 
 * @author icoolkj
 * @date 2023-03-08
 */
public class SysDomainRoles extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID */
    private String drolesId;

    /** 组织角色名称 */
    @Excel(name = "组织角色名称")
    private String drolesName;

    /** 组织角色类型 */
    @Excel(name = "组织角色类型")
    private String drolesType;

    /** 组织角色状态（0正常 1停用） */
    @Excel(name = "组织角色状态", readConverterExp = "0=正常,1=停用")
    private String drolesStatus;

    /** 删除标记（0代表存在 2代表删除） */
    private String delFlag;

    public void setDrolesId(String drolesId) 
    {
        this.drolesId = drolesId;
    }

    public String getDrolesId() 
    {
        return drolesId;
    }
    public void setDrolesName(String drolesName) 
    {
        this.drolesName = drolesName;
    }

    public String getDrolesName() 
    {
        return drolesName;
    }
    public void setDrolesType(String drolesType) 
    {
        this.drolesType = drolesType;
    }

    public String getDrolesType() 
    {
        return drolesType;
    }
    public void setDrolesStatus(String drolesStatus) 
    {
        this.drolesStatus = drolesStatus;
    }

    public String getDrolesStatus() 
    {
        return drolesStatus;
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
            .append("drolesId", getDrolesId())
            .append("drolesName", getDrolesName())
            .append("drolesType", getDrolesType())
            .append("drolesStatus", getDrolesStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
