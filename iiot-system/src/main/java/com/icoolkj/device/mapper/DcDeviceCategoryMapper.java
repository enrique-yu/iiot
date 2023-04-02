package com.icoolkj.device.mapper;

import java.util.List;
import com.icoolkj.device.domain.DcDeviceCategory;

/**
 * 设备分类信息Mapper接口
 * 
 * @author icoolkj
 * @date 2023-04-01
 */
public interface DcDeviceCategoryMapper 
{
    /**
     * 查询设备分类信息
     * 
     * @param deviceCategoryId 设备分类信息主键
     * @return 设备分类信息
     */
    public DcDeviceCategory selectDcDeviceCategoryByDeviceCategoryId(String deviceCategoryId);

    /**
     * 查询设备分类信息列表
     * 
     * @param dcDeviceCategory 设备分类信息
     * @return 设备分类信息集合
     */
    public List<DcDeviceCategory> selectDcDeviceCategoryList(DcDeviceCategory dcDeviceCategory);

    /**
     * 查询设备分类列表（排除节点及节点下子节点）
     *
     * @param dcDeviceCategory 设备分类信息
     * @return 设备分类信息集合
     */
    public List<DcDeviceCategory> selectDcDeviceCategoryExcludeChildList(DcDeviceCategory dcDeviceCategory);

    /**
     * 新增设备分类信息
     * 
     * @param dcDeviceCategory 设备分类信息
     * @return 结果
     */
    public int insertDcDeviceCategory(DcDeviceCategory dcDeviceCategory);

    /**
     * 修改设备分类信息
     * 
     * @param dcDeviceCategory 设备分类信息
     * @return 结果
     */
    public int updateDcDeviceCategory(DcDeviceCategory dcDeviceCategory);

    /**
     * 删除设备分类信息
     * 
     * @param deviceCategoryId 设备分类信息主键
     * @return 结果
     */
    public int deleteDcDeviceCategoryByDeviceCategoryId(String deviceCategoryId);

    /**
     * 批量删除设备分类信息
     * 
     * @param deviceCategoryIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDcDeviceCategoryByDeviceCategoryIds(String[] deviceCategoryIds);
}
