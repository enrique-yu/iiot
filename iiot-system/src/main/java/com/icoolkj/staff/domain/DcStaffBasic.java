package com.icoolkj.staff.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.icoolkj.common.annotation.Excel;
import com.icoolkj.common.core.domain.BaseEntity;

/**
 * 人员基本信息对象 dc_staff_basic
 * 
 * @author icoolkj
 * @date 2023-03-17
 */
public class DcStaffBasic extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** staff_basic_id */
    private String staffBasicId;

    /** 人员姓名 */
    @Excel(name = "人员姓名")
    private String staffName;

    /** 证件类型【默认身份证】 */
    @Excel(name = "证件类型【默认身份证】")
    private String staffCardType;

    /** 证件号码 */
    @Excel(name = "证件号码")
    private String staffCardNo;

    /** 证件发证机关 */
    @Excel(name = "证件发证机关")
    private String staffCardFzunit;

    /** 证件是否长期（0长期 1非长期） */
    @Excel(name = "证件是否长期", readConverterExp = "0=长期,1=非长期")
    private String staffCardStatus;

    /** 证件有效期开始 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "证件有效期开始", width = 30, dateFormat = "yyyy-MM-dd")
    private Date staffCardSdate;

    /** 证件有效期截至 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "证件有效期截至", width = 30, dateFormat = "yyyy-MM-dd")
    private Date staffCardEdate;

    /** 性别 */
    @Excel(name = "性别")
    private String staffSex;

    /** 年龄 */
    @Excel(name = "年龄")
    private Long staffAge;

    /** 民族 */
    @Excel(name = "民族")
    private String staffNation;

    /** 出生日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "出生日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date staffBirthdate;

    /** 籍贯 */
    @Excel(name = "籍贯")
    private String staffBirthplace;

    /** 住址 */
    @Excel(name = "住址")
    private String staffAddr;

    /** 联系手机 */
    @Excel(name = "联系手机")
    private String staffPhone;

    /** 联系邮箱 */
    @Excel(name = "联系邮箱")
    private String staffEmail;

    /** 政治面貌 */
    @Excel(name = "政治面貌")
    private String staffPoliticsStatus;

    /** 备注信息 */
    @Excel(name = "备注信息")
    private String staffRemark;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String staffStatus;

    /** 删除标记（0代表存在 2代表删除） */
    private String delFlag;

    public void setStaffBasicId(String staffBasicId) 
    {
        this.staffBasicId = staffBasicId;
    }

    public String getStaffBasicId() 
    {
        return staffBasicId;
    }
    public void setStaffName(String staffName) 
    {
        this.staffName = staffName;
    }

    public String getStaffName() 
    {
        return staffName;
    }
    public void setStaffCardType(String staffCardType) 
    {
        this.staffCardType = staffCardType;
    }

    public String getStaffCardType() 
    {
        return staffCardType;
    }
    public void setStaffCardNo(String staffCardNo) 
    {
        this.staffCardNo = staffCardNo;
    }

    public String getStaffCardNo() 
    {
        return staffCardNo;
    }
    public void setStaffCardFzunit(String staffCardFzunit) 
    {
        this.staffCardFzunit = staffCardFzunit;
    }

    public String getStaffCardFzunit() 
    {
        return staffCardFzunit;
    }
    public void setStaffCardStatus(String staffCardStatus) 
    {
        this.staffCardStatus = staffCardStatus;
    }

    public String getStaffCardStatus() 
    {
        return staffCardStatus;
    }
    public void setStaffCardSdate(Date staffCardSdate) 
    {
        this.staffCardSdate = staffCardSdate;
    }

    public Date getStaffCardSdate() 
    {
        return staffCardSdate;
    }
    public void setStaffCardEdate(Date staffCardEdate) 
    {
        this.staffCardEdate = staffCardEdate;
    }

    public Date getStaffCardEdate() 
    {
        return staffCardEdate;
    }
    public void setStaffSex(String staffSex) 
    {
        this.staffSex = staffSex;
    }

    public String getStaffSex() 
    {
        return staffSex;
    }
    public void setStaffAge(Long staffAge) 
    {
        this.staffAge = staffAge;
    }

    public Long getStaffAge() 
    {
        return staffAge;
    }
    public void setStaffNation(String staffNation) 
    {
        this.staffNation = staffNation;
    }

    public String getStaffNation() 
    {
        return staffNation;
    }
    public void setStaffBirthdate(Date staffBirthdate) 
    {
        this.staffBirthdate = staffBirthdate;
    }

    public Date getStaffBirthdate() 
    {
        return staffBirthdate;
    }
    public void setStaffBirthplace(String staffBirthplace) 
    {
        this.staffBirthplace = staffBirthplace;
    }

    public String getStaffBirthplace() 
    {
        return staffBirthplace;
    }
    public void setStaffAddr(String staffAddr) 
    {
        this.staffAddr = staffAddr;
    }

    public String getStaffAddr() 
    {
        return staffAddr;
    }
    public void setStaffPhone(String staffPhone) 
    {
        this.staffPhone = staffPhone;
    }

    public String getStaffPhone() 
    {
        return staffPhone;
    }
    public void setStaffEmail(String staffEmail) 
    {
        this.staffEmail = staffEmail;
    }

    public String getStaffEmail() 
    {
        return staffEmail;
    }
    public void setStaffPoliticsStatus(String staffPoliticsStatus) 
    {
        this.staffPoliticsStatus = staffPoliticsStatus;
    }

    public String getStaffPoliticsStatus() 
    {
        return staffPoliticsStatus;
    }
    public void setStaffRemark(String staffRemark) 
    {
        this.staffRemark = staffRemark;
    }

    public String getStaffRemark() 
    {
        return staffRemark;
    }
    public void setStaffStatus(String staffStatus) 
    {
        this.staffStatus = staffStatus;
    }

    public String getStaffStatus() 
    {
        return staffStatus;
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
            .append("staffBasicId", getStaffBasicId())
            .append("staffName", getStaffName())
            .append("staffCardType", getStaffCardType())
            .append("staffCardNo", getStaffCardNo())
            .append("staffCardFzunit", getStaffCardFzunit())
            .append("staffCardStatus", getStaffCardStatus())
            .append("staffCardSdate", getStaffCardSdate())
            .append("staffCardEdate", getStaffCardEdate())
            .append("staffSex", getStaffSex())
            .append("staffAge", getStaffAge())
            .append("staffNation", getStaffNation())
            .append("staffBirthdate", getStaffBirthdate())
            .append("staffBirthplace", getStaffBirthplace())
            .append("staffAddr", getStaffAddr())
            .append("staffPhone", getStaffPhone())
            .append("staffEmail", getStaffEmail())
            .append("staffPoliticsStatus", getStaffPoliticsStatus())
            .append("staffRemark", getStaffRemark())
            .append("staffStatus", getStaffStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
