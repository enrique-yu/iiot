package com.icoolkj.device.service.impl;

import java.util.List;
import com.icoolkj.common.utils.DateUtils;
import com.icoolkj.common.utils.SecurityUtils;
import com.icoolkj.common.utils.uuid.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icoolkj.device.mapper.DcDeviceCategoryMapper;
import com.icoolkj.device.domain.DcDeviceCategory;
import com.icoolkj.device.service.IDcDeviceCategoryService;

/**
 * 设备分类信息Service业务层处理
 * 
 * @author:haiwei.yu01
 * @date 2023-04-01
 */
@Service
public class DcDeviceCategoryServiceImpl implements IDcDeviceCategoryService 
{
    @Autowired
    private DcDeviceCategoryMapper dcDeviceCategoryMapper;

    /**
     * 查询设备分类信息
     * 
     * @param deviceCategoryId 设备分类信息主键
     * @return 设备分类信息
     */
    @Override
    public DcDeviceCategory selectDcDeviceCategoryByDeviceCategoryId(String deviceCategoryId)
    {
        return dcDeviceCategoryMapper.selectDcDeviceCategoryByDeviceCategoryId(deviceCategoryId);
    }

    /**
     * 查询设备分类信息列表
     * 
     * @param dcDeviceCategory 设备分类信息
     * @return 设备分类信息
     */
    @Override
    public List<DcDeviceCategory> selectDcDeviceCategoryList(DcDeviceCategory dcDeviceCategory)
    {
        return dcDeviceCategoryMapper.selectDcDeviceCategoryList(dcDeviceCategory);
    }


    /**
     * 询设备分类列表（排除节点及节点下子节点）
     *
     * @param dcDeviceCategory 设备分类信息
     * @return 设备分类信息集合
     */
    @Override
    public List<DcDeviceCategory> selectDcDeviceCategoryExcludeChildList(DcDeviceCategory dcDeviceCategory)
    {
        return dcDeviceCategoryMapper.selectDcDeviceCategoryExcludeChildList(dcDeviceCategory);
    }

    /**
     * 新增设备分类信息
     * 
     * @param dcDeviceCategory 设备分类信息
     * @return 结果
     */
    @Override
    public int insertDcDeviceCategory(DcDeviceCategory dcDeviceCategory)
    {
        dcDeviceCategory.setDeviceCategoryId(IdWorker.nextId().toString());
        dcDeviceCategory.setDomainId(SecurityUtils.getDomainId());
        dcDeviceCategory.setCreateBy(SecurityUtils.getUserId());
        dcDeviceCategory.setCreateTime(DateUtils.getNowDate());
        return dcDeviceCategoryMapper.insertDcDeviceCategory(dcDeviceCategory);
    }

    /**
     * 修改设备分类信息
     * 
     * @param dcDeviceCategory 设备分类信息
     * @return 结果
     */
    @Override
    public int updateDcDeviceCategory(DcDeviceCategory dcDeviceCategory)
    {
        dcDeviceCategory.setUpdateBy(SecurityUtils.getLoginUser().getUser().getUserName());
        dcDeviceCategory.setUpdateTime(DateUtils.getNowDate());
        return dcDeviceCategoryMapper.updateDcDeviceCategory(dcDeviceCategory);
    }


    /**
     * 删除设备分类信息信息
     * 
     * @param deviceCategoryId 设备分类信息主键
     * @return 结果
     */
    @Override
    public int deleteDcDeviceCategoryByDeviceCategoryId(String deviceCategoryId)
    {
        return dcDeviceCategoryMapper.deleteDcDeviceCategoryByDeviceCategoryId(deviceCategoryId);
    }


    /**
     * 是否有子分类信息
     *
     * @param deviceCategoryId 设备分类信息主键
     * @return 结果
     */
    @Override
    public boolean hasChildById(String deviceCategoryId)
    {
        int result = dcDeviceCategoryMapper.hasChildById(deviceCategoryId);
        return result > 0;
    }

    /**
     * 查询分类下是否登记设备
     *
     * @param deviceCategoryId 设备分类信息主键
     * @return 结果 true 存在 false 不存在
     */
    @Override
    public boolean checkDeviceById(String deviceCategoryId)
    {
        int result = dcDeviceCategoryMapper.checkDeviceById(deviceCategoryId);
        return result > 0;
    }

}
