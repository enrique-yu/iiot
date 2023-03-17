package com.icoolkj.device.service;

import java.util.List;
import com.icoolkj.device.domain.DcDeviceBasic;

/**
 * 设备基础Service接口
 * 
 * @author icoolkj
 * @date 2023-03-17
 */
public interface IDcDeviceBasicService 
{
    /**
     * 查询设备基础
     * 
     * @param deviceBasicId 设备基础主键
     * @return 设备基础
     */
    public DcDeviceBasic selectDcDeviceBasicByDeviceBasicId(String deviceBasicId);

    /**
     * 查询设备基础列表
     * 
     * @param dcDeviceBasic 设备基础
     * @return 设备基础集合
     */
    public List<DcDeviceBasic> selectDcDeviceBasicList(DcDeviceBasic dcDeviceBasic);

    /**
     * 新增设备基础
     * 
     * @param dcDeviceBasic 设备基础
     * @return 结果
     */
    public int insertDcDeviceBasic(DcDeviceBasic dcDeviceBasic);

    /**
     * 修改设备基础
     * 
     * @param dcDeviceBasic 设备基础
     * @return 结果
     */
    public int updateDcDeviceBasic(DcDeviceBasic dcDeviceBasic);

    /**
     * 批量删除设备基础
     * 
     * @param deviceBasicIds 需要删除的设备基础主键集合
     * @return 结果
     */
    public int deleteDcDeviceBasicByDeviceBasicIds(String[] deviceBasicIds);

    /**
     * 删除设备基础信息
     * 
     * @param deviceBasicId 设备基础主键
     * @return 结果
     */
    public int deleteDcDeviceBasicByDeviceBasicId(String deviceBasicId);
}
