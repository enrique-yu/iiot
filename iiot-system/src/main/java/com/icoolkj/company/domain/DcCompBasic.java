package com.icoolkj.company.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.icoolkj.common.annotation.Excel;
import com.icoolkj.common.core.domain.BaseEntity;

/**
 * 企业基本信息对象 ic_comp_basic
 * 
 * @author icoolkj
 * @date 2023-03-10
 */
public class DcCompBasic extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** comp_basic_id */
    private String compBasicId;

    /** 企业名称 */
    @Excel(name = "企业名称")
    private String compName;

    /** 企业统一社会信用代码 */
    @Excel(name = "企业统一社会信用代码")
    private String compCreditCode;

    /** 企业类型 */
    @Excel(name = "企业类型")
    private String compType;

    /** 企业法人 */
    @Excel(name = "企业法人")
    private String compFr;

    /** 企业法人手机 */
    @Excel(name = "企业法人手机")
    private String compFrPhone;

    /** 行政区划 */
    @Excel(name = "行政区划")
    private String compArea;

    /** 注册地址 */
    @Excel(name = "注册地址")
    private String compAddr;

    /** 经度 */
    @Excel(name = "经度")
    private String compLng;

    /** 维度 */
    @Excel(name = "维度")
    private String compLat;

    /** 成立日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "成立日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date compRegDate;

    /** 营业期限 */
    @Excel(name = "营业期限")
    private String compBusinessTerm;

    /** 经营状态 */
    @Excel(name = "经营状态")
    private String compManageStatus;

    /** 核准日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "核准日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date compApproveDate;

    /** 登记机关 */
    @Excel(name = "登记机关")
    private String compApproveOffice;

    /** 注册资本 */
    @Excel(name = "注册资本")
    private String compRegCapital;

    /** 实缴资本 */
    @Excel(name = "实缴资本")
    private String compPaidCapital;

    /** 经营范围 */
    @Excel(name = "经营范围")
    private String compManageScope;

    /** 企业联系人 */
    @Excel(name = "企业联系人")
    private String compLxr;

    /** 企业联系人手机 */
    @Excel(name = "企业联系人手机")
    private String compLxrPhone;

    /** 企业联系人邮箱 */
    @Excel(name = "企业联系人邮箱")
    private String compLxrEmail;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String compStatus;

    /** 删除标记（0代表存在 2代表删除） */
    private String delFlag;

    public void setCompBasicId(String compBasicId) 
    {
        this.compBasicId = compBasicId;
    }

    public String getCompBasicId() 
    {
        return compBasicId;
    }
    public void setCompName(String compName) 
    {
        this.compName = compName;
    }

    public String getCompName() 
    {
        return compName;
    }
    public void setCompCreditCode(String compCreditCode) 
    {
        this.compCreditCode = compCreditCode;
    }

    public String getCompCreditCode() 
    {
        return compCreditCode;
    }
    public void setCompType(String compType) 
    {
        this.compType = compType;
    }

    public String getCompType() 
    {
        return compType;
    }
    public void setCompFr(String compFr) 
    {
        this.compFr = compFr;
    }

    public String getCompFr() 
    {
        return compFr;
    }
    public void setCompFrPhone(String compFrPhone) 
    {
        this.compFrPhone = compFrPhone;
    }

    public String getCompFrPhone() 
    {
        return compFrPhone;
    }
    public void setCompArea(String compArea) 
    {
        this.compArea = compArea;
    }

    public String getCompArea() 
    {
        return compArea;
    }
    public void setCompAddr(String compAddr) 
    {
        this.compAddr = compAddr;
    }

    public String getCompAddr() 
    {
        return compAddr;
    }
    public void setCompLng(String compLng) 
    {
        this.compLng = compLng;
    }

    public String getCompLng() 
    {
        return compLng;
    }
    public void setCompLat(String compLat) 
    {
        this.compLat = compLat;
    }

    public String getCompLat() 
    {
        return compLat;
    }
    public void setCompRegDate(Date compRegDate) 
    {
        this.compRegDate = compRegDate;
    }

    public Date getCompRegDate() 
    {
        return compRegDate;
    }
    public void setCompBusinessTerm(String compBusinessTerm) 
    {
        this.compBusinessTerm = compBusinessTerm;
    }

    public String getCompBusinessTerm() 
    {
        return compBusinessTerm;
    }
    public void setCompManageStatus(String compManageStatus) 
    {
        this.compManageStatus = compManageStatus;
    }

    public String getCompManageStatus() 
    {
        return compManageStatus;
    }
    public void setCompApproveDate(Date compApproveDate) 
    {
        this.compApproveDate = compApproveDate;
    }

    public Date getCompApproveDate() 
    {
        return compApproveDate;
    }
    public void setCompApproveOffice(String compApproveOffice) 
    {
        this.compApproveOffice = compApproveOffice;
    }

    public String getCompApproveOffice() 
    {
        return compApproveOffice;
    }
    public void setCompRegCapital(String compRegCapital) 
    {
        this.compRegCapital = compRegCapital;
    }

    public String getCompRegCapital() 
    {
        return compRegCapital;
    }
    public void setCompPaidCapital(String compPaidCapital) 
    {
        this.compPaidCapital = compPaidCapital;
    }

    public String getCompPaidCapital() 
    {
        return compPaidCapital;
    }
    public void setCompManageScope(String compManageScope) 
    {
        this.compManageScope = compManageScope;
    }

    public String getCompManageScope() 
    {
        return compManageScope;
    }
    public void setCompLxr(String compLxr) 
    {
        this.compLxr = compLxr;
    }

    public String getCompLxr() 
    {
        return compLxr;
    }
    public void setCompLxrPhone(String compLxrPhone) 
    {
        this.compLxrPhone = compLxrPhone;
    }

    public String getCompLxrPhone() 
    {
        return compLxrPhone;
    }
    public void setCompLxrEmail(String compLxrEmail) 
    {
        this.compLxrEmail = compLxrEmail;
    }

    public String getCompLxrEmail() 
    {
        return compLxrEmail;
    }
    public void setCompStatus(String compStatus) 
    {
        this.compStatus = compStatus;
    }

    public String getCompStatus() 
    {
        return compStatus;
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
            .append("compBasicId", getCompBasicId())
            .append("compName", getCompName())
            .append("compCreditCode", getCompCreditCode())
            .append("compType", getCompType())
            .append("compFr", getCompFr())
            .append("compFrPhone", getCompFrPhone())
            .append("compArea", getCompArea())
            .append("compAddr", getCompAddr())
            .append("compLng", getCompLng())
            .append("compLat", getCompLat())
            .append("compRegDate", getCompRegDate())
            .append("compBusinessTerm", getCompBusinessTerm())
            .append("compManageStatus", getCompManageStatus())
            .append("compApproveDate", getCompApproveDate())
            .append("compApproveOffice", getCompApproveOffice())
            .append("compRegCapital", getCompRegCapital())
            .append("compPaidCapital", getCompPaidCapital())
            .append("compManageScope", getCompManageScope())
            .append("compLxr", getCompLxr())
            .append("compLxrPhone", getCompLxrPhone())
            .append("compLxrEmail", getCompLxrEmail())
            .append("compStatus", getCompStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
