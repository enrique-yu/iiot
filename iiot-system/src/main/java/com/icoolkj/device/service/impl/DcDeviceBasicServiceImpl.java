package com.icoolkj.device.service.impl;

import java.util.List;

import com.icoolkj.common.constant.UserConstants;
import com.icoolkj.common.utils.DateUtils;
import com.icoolkj.common.utils.SecurityUtils;
import com.icoolkj.common.utils.StringUtils;
import com.icoolkj.common.utils.uuid.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icoolkj.device.mapper.DcDeviceBasicMapper;
import com.icoolkj.device.domain.DcDeviceBasic;
import com.icoolkj.device.service.IDcDeviceBasicService;

/**
 * 设备基础Service业务层处理
 * 
 * @author icoolkj
 * @date 2023-03-17
 */
@Service
public class DcDeviceBasicServiceImpl implements IDcDeviceBasicService 
{
    @Autowired
    private DcDeviceBasicMapper dcDeviceBasicMapper;

    /**
     * 查询设备基础
     * 
     * @param deviceBasicId 设备基础主键
     * @return 设备基础
     */
    @Override
    public DcDeviceBasic selectDcDeviceBasicByDeviceBasicId(String deviceBasicId)
    {
        return dcDeviceBasicMapper.selectDcDeviceBasicByDeviceBasicId(deviceBasicId);
    }

    /**
     * 查询设备基础列表
     * 
     * @param dcDeviceBasic 设备基础
     * @return 设备基础
     */
    @Override
    public List<DcDeviceBasic> selectDcDeviceBasicList(DcDeviceBasic dcDeviceBasic)
    {
        return dcDeviceBasicMapper.selectDcDeviceBasicList(dcDeviceBasic);
    }

    /**
     * 新增设备基础
     * 
     * @param dcDeviceBasic 设备基础
     * @return 结果
     */
    @Override
    public int insertDcDeviceBasic(DcDeviceBasic dcDeviceBasic)
    {
        dcDeviceBasic.setDeviceBasicId(IdWorker.nextId().toString());
        dcDeviceBasic.setCompBasicId(SecurityUtils.getUserRelationId());
        dcDeviceBasic.setDomainId(SecurityUtils.getDomainId());
        dcDeviceBasic.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId());
        dcDeviceBasic.setCreateTime(DateUtils.getNowDate());
        return dcDeviceBasicMapper.insertDcDeviceBasic(dcDeviceBasic);
    }

    /**
     * 修改设备基础
     * 
     * @param dcDeviceBasic 设备基础
     * @return 结果
     */
    @Override
    public int updateDcDeviceBasic(DcDeviceBasic dcDeviceBasic)
    {
        dcDeviceBasic.setUpdateBy(SecurityUtils.getLoginUser().getUser().getUserId());
        dcDeviceBasic.setUpdateTime(DateUtils.getNowDate());
        return dcDeviceBasicMapper.updateDcDeviceBasic(dcDeviceBasic);
    }

    /**
     * 校验设备编号是否唯一
     *
     * @param dcDeviceBasic 设备基础
     * @return 结果
     */
    @Override
    public boolean checkDeviceSnUnique(DcDeviceBasic dcDeviceBasic)
    {
        DcDeviceBasic info = dcDeviceBasicMapper.checkDeviceSnUnique(dcDeviceBasic.getDeviceSn());
        if (StringUtils.isNotNull(info))
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

}
