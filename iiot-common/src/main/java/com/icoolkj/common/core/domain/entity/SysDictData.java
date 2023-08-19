package com.icoolkj.common.core.domain.entity;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.icoolkj.common.annotation.Excel;
import com.icoolkj.common.annotation.Excel.ColumnType;
import com.icoolkj.common.constant.UserConstants;
import com.icoolkj.common.core.domain.BaseEntity;

/**
 * 字典数据表 sys_dict_data
 * 
 * @author icoolkj
 */
public class SysDictData extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 字典编码 */
    @Excel(name = "字典编码", cellType = ColumnType.NUMERIC)
    private String dictCode;

    /** 组织编号 */
    private String domainId;

    /** 字典排序 */
    @Excel(name = "字典排序", cellType = ColumnType.NUMERIC)
    private Long dictSort;

    /** 字典标签 */
    @Excel(name = "字典标签")
    private String dictLabel;

    /** 字典键值 */
    @Excel(name = "字典键值")
    private String dictValue;

    /** 字典类型 */
    @Excel(name = "字典类型")
    private String dictType;

    /** 样式属性（其他样式扩展） */
    private String cssClass;

    /** 表格字典样式 */
    private String listClass;

    /** 是否默认（Y是 N否） */
    @Excel(name = "是否默认", readConverterExp = "Y=是,N=否")
    private String isDefault;

    /** 状态（0正常 1停用） */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 字典扩展项值1 */
    @Excel(name = "字典扩展项值1")
    private String dictExtendValue1;

    /** 字典扩展项值2 */
    @Excel(name = "字典扩展项值2")
    private String dictExtendValue2;

    /** 字典扩展项值3 */
    @Excel(name = "字典扩展项值3")
    private String dictExtendValue3;

    /** 字典扩展项值4 */
    @Excel(name = "字典扩展项值4")
    private String dictExtendValue4;

    /** 字典扩展项值5 */
    @Excel(name = "字典扩展项值5")
    private String dictExtendValue5;

    /** 字典扩展项值6 */
    @Excel(name = "字典扩展项值6")
    private String dictExtendValue6;

    public String getDictCode()
    {
        return dictCode;
    }

    public void setDictCode(String dictCode)
    {
        this.dictCode = dictCode;
    }

    public String getDomainId() {
        return domainId;
    }

    public void setDomainId(String domainId) {
        this.domainId = domainId;
    }

    public Long getDictSort()
    {
        return dictSort;
    }

    public void setDictSort(Long dictSort)
    {
        this.dictSort = dictSort;
    }

    @NotBlank(message = "字典标签不能为空")
    @Size(min = 0, max = 100, message = "字典标签长度不能超过100个字符")
    public String getDictLabel()
    {
        return dictLabel;
    }

    public void setDictLabel(String dictLabel)
    {
        this.dictLabel = dictLabel;
    }

    @NotBlank(message = "字典键值不能为空")
    @Size(min = 0, max = 100, message = "字典键值长度不能超过100个字符")
    public String getDictValue()
    {
        return dictValue;
    }

    public void setDictValue(String dictValue)
    {
        this.dictValue = dictValue;
    }

    @NotBlank(message = "字典类型不能为空")
    @Size(min = 0, max = 100, message = "字典类型长度不能超过100个字符")
    public String getDictType()
    {
        return dictType;
    }

    public void setDictType(String dictType)
    {
        this.dictType = dictType;
    }

    @Size(min = 0, max = 100, message = "样式属性长度不能超过100个字符")
    public String getCssClass()
    {
        return cssClass;
    }

    public void setCssClass(String cssClass)
    {
        this.cssClass = cssClass;
    }

    public String getListClass()
    {
        return listClass;
    }

    public void setListClass(String listClass)
    {
        this.listClass = listClass;
    }

    public boolean getDefault()
    {
        return UserConstants.YES.equals(this.isDefault);
    }

    public String getIsDefault()
    {
        return isDefault;
    }

    public void setIsDefault(String isDefault)
    {
        this.isDefault = isDefault;
    }

    public String getStatus()
    {
        return status;
    }

    public void setStatus(String status)
    {
        this.status = status;
    }

    public String getDictExtendValue1() {
        return dictExtendValue1;
    }

    public void setDictExtendValue1(String dictExtendValue1) {
        this.dictExtendValue1 = dictExtendValue1;
    }

    public String getDictExtendValue2() {
        return dictExtendValue2;
    }

    public void setDictExtendValue2(String dictExtendValue2) {
        this.dictExtendValue2 = dictExtendValue2;
    }

    public String getDictExtendValue3() {
        return dictExtendValue3;
    }

    public void setDictExtendValue3(String dictExtendValue3) {
        this.dictExtendValue3 = dictExtendValue3;
    }

    public String getDictExtendValue4() {
        return dictExtendValue4;
    }

    public void setDictExtendValue4(String dictExtendValue4) {
        this.dictExtendValue4 = dictExtendValue4;
    }

    public String getDictExtendValue5() {
        return dictExtendValue5;
    }

    public void setDictExtendValue5(String dictExtendValue5) {
        this.dictExtendValue5 = dictExtendValue5;
    }

    public String getDictExtendValue6() {
        return dictExtendValue6;
    }

    public void setDictExtendValue6(String dictExtendValue6) {
        this.dictExtendValue6 = dictExtendValue6;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("dictCode", getDictCode())
            .append("dictSort", getDictSort())
            .append("dictLabel", getDictLabel())
            .append("dictValue", getDictValue())
            .append("dictType", getDictType())
            .append("cssClass", getCssClass())
            .append("listClass", getListClass())
            .append("isDefault", getIsDefault())
            .append("status", getStatus())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("dictExtendValue1", getDictExtendValue1())
            .append("dictExtendValue2", getDictExtendValue2())
            .append("dictExtendValue3", getDictExtendValue3())
            .append("dictExtendValue4", getDictExtendValue4())
            .append("dictExtendValue5", getDictExtendValue5())
            .append("dictExtendValue6", getDictExtendValue6())
            .toString();
    }
}
