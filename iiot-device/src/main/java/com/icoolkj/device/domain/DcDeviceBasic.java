package com.icoolkj.device.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.icoolkj.common.annotation.Excel;
import com.icoolkj.common.core.domain.BaseEntity;

/**
 * 设备基础对象 dc_device_basic
 * 
 * @author icoolkj
 * @date 2023-03-17
 */
public class DcDeviceBasic extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** device_basic_id */
    private String deviceBasicId;

    /** device_category_id */
    private String deviceCategoryId;

    /** 设备所属企业ID */
    @Excel(name = "设备所属企业ID")
    private String compBasicId;

    /** 设备名称 */
    @Excel(name = "设备名称")
    private String deviceName;

    /** 设备编号【设备ID】 */
    @Excel(name = "设备编号【设备ID】")
    private String deviceSn;

    /** 设备类型 */
    @Excel(name = "设备类型")
    private String deviceType;

    /** 设备规格型号 */
    @Excel(name = "设备规格型号")
    private String deviceModel;

    /** 品牌 */
    @Excel(name = "品牌")
    private String deviceBrand;

    /** 生产厂家 */
    @Excel(name = "生产厂家")
    private String deviceFactory;

    /** 设备描述 */
    @Excel(name = "设备描述")
    private String deviceDesc;

    /** 设备最后活动时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "设备最后活动时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date deviceLastActiveTime;

    /** 在线状态（0离线 1在线  2未注册） */
    @Excel(name = "在线状态", readConverterExp = "0=离线,1=在线,2=未注册")
    private String deviceOnlineStatus;

    /** 设备状态（0正常 1停用  2故障） */
    @Excel(name = "设备状态", readConverterExp = "0=正常,1=停用,2=故障")
    private String deviceStatus;

    /** 组织ID */
    @Excel(name = "组织ID")
    private String domainId;

    /** 删除标记（0代表存在 2代表删除） */
    private String delFlag;

    /** 分类名称 */
    @Excel(name = "分类名称")
    private String categoryName;

    public void setDeviceBasicId(String deviceBasicId) 
    {
        this.deviceBasicId = deviceBasicId;
    }

    public String getDeviceBasicId() 
    {
        return deviceBasicId;
    }
    public void setDeviceCategoryId(String deviceCategoryId) {
        this.deviceCategoryId = deviceCategoryId;
    }

    public String getDeviceCategoryId() {
        return deviceCategoryId;
    }
    public void setCompBasicId(String compBasicId)
    {
        this.compBasicId = compBasicId;
    }

    public String getCompBasicId() 
    {
        return compBasicId;
    }
    public void setDeviceName(String deviceName) 
    {
        this.deviceName = deviceName;
    }

    public String getDeviceName() 
    {
        return deviceName;
    }
    public void setDeviceSn(String deviceSn) 
    {
        this.deviceSn = deviceSn;
    }

    public String getDeviceSn() 
    {
        return deviceSn;
    }
    public void setDeviceType(String deviceType) 
    {
        this.deviceType = deviceType;
    }

    public String getDeviceType() 
    {
        return deviceType;
    }
    public void setDeviceModel(String deviceModel) 
    {
        this.deviceModel = deviceModel;
    }

    public String getDeviceModel() 
    {
        return deviceModel;
    }
    public void setDeviceBrand(String deviceBrand) 
    {
        this.deviceBrand = deviceBrand;
    }

    public String getDeviceBrand() 
    {
        return deviceBrand;
    }
    public void setDeviceFactory(String deviceFactory) 
    {
        this.deviceFactory = deviceFactory;
    }

    public String getDeviceFactory() 
    {
        return deviceFactory;
    }
    public void setDeviceDesc(String deviceDesc) 
    {
        this.deviceDesc = deviceDesc;
    }

    public String getDeviceDesc() 
    {
        return deviceDesc;
    }
    public void setDeviceLastActiveTime(Date deviceLastActiveTime) 
    {
        this.deviceLastActiveTime = deviceLastActiveTime;
    }

    public Date getDeviceLastActiveTime() 
    {
        return deviceLastActiveTime;
    }
    public void setDeviceOnlineStatus(String deviceOnlineStatus) 
    {
        this.deviceOnlineStatus = deviceOnlineStatus;
    }

    public String getDeviceOnlineStatus() 
    {
        return deviceOnlineStatus;
    }
    public void setDeviceStatus(String deviceStatus) 
    {
        this.deviceStatus = deviceStatus;
    }

    public String getDeviceStatus() 
    {
        return deviceStatus;
    }
    public void setDomainId(String domainId) {
        this.domainId = domainId;
    }

    public String getDomainId() {
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

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("deviceBasicId", getDeviceBasicId())
            .append("compBasicId", getCompBasicId())
            .append("deviceName", getDeviceName())
            .append("deviceSn", getDeviceSn())
            .append("deviceType", getDeviceType())
            .append("deviceModel", getDeviceModel())
            .append("deviceBrand", getDeviceBrand())
            .append("deviceFactory", getDeviceFactory())
            .append("deviceDesc", getDeviceDesc())
            .append("deviceLastActiveTime", getDeviceLastActiveTime())
            .append("deviceOnlineStatus", getDeviceOnlineStatus())
            .append("deviceStatus", getDeviceStatus())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
