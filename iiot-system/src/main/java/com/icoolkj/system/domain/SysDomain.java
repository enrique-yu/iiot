package com.icoolkj.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.icoolkj.common.core.domain.entity.SysDept;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.icoolkj.common.annotation.Excel;
import com.icoolkj.common.core.domain.BaseEntity;

/**
 * 系统组织账户对象 sys_domain
 * 
 * @author icoolkj
 * @date 2023-03-08
 */
public class SysDomain extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 组织编号 */
    private String domainId;

    /** 父级组织编号 */
    @Excel(name = "父级组织编号")
    private String domainParentId;

    /** 组织角色编号 */
    @Excel(name = "组织角色编号")
    private String drolesId;

    /** 组织账户名称 */
    @Excel(name = "组织账户名称")
    private String domainName;

    /** 组织账号 */
    @Excel(name = "组织账号")
    private String domainAccount;

    /** 组织账户有效期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "组织账户有效期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date domainIndate;

    /** 组织可管区域 */
    @Excel(name = "组织可管区域")
    private String domainRegion;

    /** 组织管理员手机 */
    @Excel(name = "组织管理员手机")
    private String domainPhone;

    /** 组织管理员邮箱 */
    @Excel(name = "组织管理员邮箱")
    private String domainEmail;

    /** 组织账户描述 */
    @Excel(name = "组织账户描述")
    private String domainDesc;

    /** 组织账号与业务关系ID */
    @Excel(name = "组织账号与业务关系ID")
    private String domainRelationId;

    /** 组织账号状态（0正常 1停用） */
    @Excel(name = "组织账号状态", readConverterExp = "0=正常,1=停用")
    private String domainStatus;

    /** 删除标记（0代表存在 2代表删除） */
    private String delFlag;

    /** 系统组织权限对象 **/
    private SysDomainRoles domainRoles;

    /** 系统组织权限对象 **/
    private SysArea area;

    public void setDomainId(String domainId) 
    {
        this.domainId = domainId;
    }

    public String getDomainId() 
    {
        return domainId;
    }
    public void setDomainParentId(String domainParentId) 
    {
        this.domainParentId = domainParentId;
    }

    public String getDomainParentId() 
    {
        return domainParentId;
    }
    public void setDrolesId(String drolesId) 
    {
        this.drolesId = drolesId;
    }

    public String getDrolesId() 
    {
        return drolesId;
    }
    public void setDomainName(String domainName) 
    {
        this.domainName = domainName;
    }

    public String getDomainName() 
    {
        return domainName;
    }
    public void setDomainAccount(String domainAccount) 
    {
        this.domainAccount = domainAccount;
    }

    public String getDomainAccount() 
    {
        return domainAccount;
    }
    public void setDomainIndate(Date domainIndate) 
    {
        this.domainIndate = domainIndate;
    }

    public Date getDomainIndate() 
    {
        return domainIndate;
    }
    public void setDomainRegion(String domainRegion) 
    {
        this.domainRegion = domainRegion;
    }

    public String getDomainRegion() 
    {
        return domainRegion;
    }
    public void setDomainPhone(String domainPhone) 
    {
        this.domainPhone = domainPhone;
    }

    public String getDomainPhone() 
    {
        return domainPhone;
    }
    public void setDomainEmail(String domainEmail) 
    {
        this.domainEmail = domainEmail;
    }

    public String getDomainEmail() 
    {
        return domainEmail;
    }
    public void setDomainDesc(String domainDesc) 
    {
        this.domainDesc = domainDesc;
    }

    public String getDomainDesc() 
    {
        return domainDesc;
    }
    public void setDomainRelationId(String domainRelationId) 
    {
        this.domainRelationId = domainRelationId;
    }

    public String getDomainRelationId() 
    {
        return domainRelationId;
    }
    public void setDomainStatus(String domainStatus) 
    {
        this.domainStatus = domainStatus;
    }

    public String getDomainStatus() 
    {
        return domainStatus;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }

    public SysDomainRoles getDomainRoles() {
        return domainRoles;
    }

    public void setDomainRoles(SysDomainRoles domainRoles) {
        this.domainRoles = domainRoles;
    }

    public SysArea getArea() {
        return area;
    }

    public void setArea(SysArea area) {
        this.area = area;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("domainId", getDomainId())
            .append("domainParentId", getDomainParentId())
            .append("drolesId", getDrolesId())
            .append("domainName", getDomainName())
            .append("domainAccount", getDomainAccount())
            .append("domainIndate", getDomainIndate())
            .append("domainRegion", getDomainRegion())
            .append("domainPhone", getDomainPhone())
            .append("domainEmail", getDomainEmail())
            .append("domainDesc", getDomainDesc())
            .append("domainRelationId", getDomainRelationId())
            .append("domainStatus", getDomainStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
