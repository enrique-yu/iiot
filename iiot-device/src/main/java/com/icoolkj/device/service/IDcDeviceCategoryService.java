package com.icoolkj.device.service;

import java.util.List;
import com.icoolkj.device.domain.DcDeviceCategory;

/**
 * 设备分类信息Service接口
 * 
 * @author icoolkj
 * @date 2023-04-01
 */
public interface IDcDeviceCategoryService 
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
     * 删除设备分类信息信息
     * 
     * @param deviceCategoryId 设备分类信息主键
     * @return 结果
     */
    public int deleteDcDeviceCategoryByDeviceCategoryId(String deviceCategoryId);


    /**
     * 是否有子分类信息
     *
     * @param deviceCategoryId 设备分类信息主键
     * @return 结果
     */
    public boolean hasChildById(String deviceCategoryId);

    /**
     * 查询分类下是否登记设备
     *
     * @param deviceCategoryId 设备分类信息主键
     * @return 结果 true 存在 false 不存在
     */
    public boolean checkDeviceById(String deviceCategoryId);

}
