package com.icoolkj.company.domain;

import com.icoolkj.staff.domain.DcStaffBasic;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.icoolkj.common.annotation.Excel;
import com.icoolkj.common.core.domain.BaseEntity;

/**
 * 企业人员关系对象 dc_comp_staff_relation
 * 
 * @author:haiwei.yu01
 * @date 2023-04-22
 */
public class DcCompStaffRelation extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** comp_staff_relation_id */
    private String compStaffRelationId;

    /** 企业基本信息ID */
    @Excel(name = "企业基本信息ID")
    private String compBasicId;

    /** 人员基本信息ID */
    @Excel(name = "人员基本信息ID")
    private String staffBasicId;

    /** 企业基本信息对象*/
    private DcCompBasic dcCompBasic;

    /** 企业名称 */
    private String compName;

    /** 企业统一社会信用代码 */
    private String compCreditCode;

    /** 人员基本信息对象*/
    private DcStaffBasic dcStaffBasic;

    /** 人员姓名 */
    private String staffName;

    public void setCompStaffRelationId(String compStaffRelationId) 
    {
        this.compStaffRelationId = compStaffRelationId;
    }

    public String getCompStaffRelationId() 
    {
        return compStaffRelationId;
    }
    public void setCompBasicId(String compBasicId) 
    {
        this.compBasicId = compBasicId;
    }

    public String getCompBasicId() 
    {
        return compBasicId;
    }
    public void setStaffBasicId(String staffBasicId) 
    {
        this.staffBasicId = staffBasicId;
    }

    public String getStaffBasicId() 
    {
        return staffBasicId;
    }

    public DcCompBasic getDcCompBasic() {
        return dcCompBasic;
    }

    public void setDcCompBasic(DcCompBasic dcCompBasic) {
        this.dcCompBasic = dcCompBasic;
    }

    public String getCompName() {
        return compName;
    }

    public void setCompName(String compName) {
        this.compName = compName;
    }

    public String getCompCreditCode() {
        return compCreditCode;
    }

    public void setCompCreditCode(String compCreditCode) {
        this.compCreditCode = compCreditCode;
    }

    public DcStaffBasic getDcStaffBasic() {
        return dcStaffBasic;
    }

    public void setDcStaffBasic(DcStaffBasic dcStaffBasic) {
        this.dcStaffBasic = dcStaffBasic;
    }

    public String getStaffName() {
        return staffName;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("compStaffRelationId", getCompStaffRelationId())
            .append("compBasicId", getCompBasicId())
            .append("staffBasicId", getStaffBasicId())
            .toString();
    }
}
