package com.icoolkj.device.domain;

import java.math.BigDecimal;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.icoolkj.common.annotation.Excel;
import com.icoolkj.common.core.domain.BaseEntity;

/**
 * 设备分类信息对象 dc_device_category
 * 
 * @author icoolkj
 * @date 2023-04-01
 */
public class DcDeviceCategory extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** device_category_id */
    private String deviceCategoryId;

    /** 上级分类ID */
    @Excel(name = "上级分类ID")
    private String categoryParentId;

    /** 分类名称 */
    @Excel(name = "分类名称")
    private String categoryName;

    /** 分类编号 */
    @Excel(name = "分类编号")
    private String categorySn;

    /** 分类等级 */
    @Excel(name = "分类等级")
    private Integer categoryLevel;

    /** 排序序号 */
    @Excel(name = "排序序号")
    private BigDecimal categorySortNum;

    /** 备注 */
    @Excel(name = "备注")
    private String categoryDesc;

    /** 组织编号 */
    @Excel(name = "组织编号")
    private String domainId;

    /** 删除标记（0代表存在 2代表删除） */
    private String delFlag;

    public void setDeviceCategoryId(String deviceCategoryId) 
    {
        this.deviceCategoryId = deviceCategoryId;
    }

    public String getDeviceCategoryId() 
    {
        return deviceCategoryId;
    }
    public void setCategoryParentId(String categoryParentId) 
    {
        this.categoryParentId = categoryParentId;
    }

    public String getCategoryParentId() 
    {
        return categoryParentId;
    }
    public void setCategoryName(String categoryName) 
    {
        this.categoryName = categoryName;
    }

    public String getCategoryName() 
    {
        return categoryName;
    }
    public void setCategorySn(String categorySn) 
    {
        this.categorySn = categorySn;
    }

    public String getCategorySn() 
    {
        return categorySn;
    }
    public void setCategoryLevel(Integer categoryLevel) 
    {
        this.categoryLevel = categoryLevel;
    }

    public Integer getCategoryLevel() 
    {
        return categoryLevel;
    }
    public void setCategorySortNum(BigDecimal categorySortNum) 
    {
        this.categorySortNum = categorySortNum;
    }

    public BigDecimal getCategorySortNum() 
    {
        return categorySortNum;
    }
    public void setCategoryDesc(String categoryDesc) 
    {
        this.categoryDesc = categoryDesc;
    }

    public String getCategoryDesc() 
    {
        return categoryDesc;
    }
    public void setDomainId(String domainId) 
    {
        this.domainId = domainId;
    }

    public String getDomainId() 
    {
        return domainId;
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
            .append("deviceCategoryId", getDeviceCategoryId())
            .append("categoryParentId", getCategoryParentId())
            .append("categoryName", getCategoryName())
            .append("categorySn", getCategorySn())
            .append("categoryLevel", getCategoryLevel())
            .append("categorySortNum", getCategorySortNum())
            .append("categoryDesc", getCategoryDesc())
            .append("domainId", getDomainId())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
