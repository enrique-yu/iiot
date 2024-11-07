package com.icoolkj.staff.service.impl;

import java.util.List;
import com.icoolkj.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icoolkj.staff.mapper.DcStaffBasicMapper;
import com.icoolkj.staff.domain.DcStaffBasic;
import com.icoolkj.staff.service.IDcStaffBasicService;

/**
 * 人员基本信息Service业务层处理
 * 
 * @author:haiwei.yu01
 * @date 2023-03-17
 */
@Service
public class DcStaffBasicServiceImpl implements IDcStaffBasicService 
{
    @Autowired
    private DcStaffBasicMapper dcStaffBasicMapper;

    /**
     * 查询人员基本信息
     * 
     * @param staffBasicId 人员基本信息主键
     * @return 人员基本信息
     */
    @Override
    public DcStaffBasic selectDcStaffBasicByStaffBasicId(String staffBasicId)
    {
        return dcStaffBasicMapper.selectDcStaffBasicByStaffBasicId(staffBasicId);
    }

    /**
     * 查询人员基本信息列表
     * 
     * @param dcStaffBasic 人员基本信息
     * @return 人员基本信息
     */
    @Override
    public List<DcStaffBasic> selectDcStaffBasicList(DcStaffBasic dcStaffBasic)
    {
        return dcStaffBasicMapper.selectDcStaffBasicList(dcStaffBasic);
    }

    /**
     * 新增人员基本信息
     * 
     * @param dcStaffBasic 人员基本信息
     * @return 结果
     */
    @Override
    public int insertDcStaffBasic(DcStaffBasic dcStaffBasic)
    {
        dcStaffBasic.setCreateTime(DateUtils.getNowDate());
        return dcStaffBasicMapper.insertDcStaffBasic(dcStaffBasic);
    }

    /**
     * 修改人员基本信息
     * 
     * @param dcStaffBasic 人员基本信息
     * @return 结果
     */
    @Override
    public int updateDcStaffBasic(DcStaffBasic dcStaffBasic)
    {
        dcStaffBasic.setUpdateTime(DateUtils.getNowDate());
        return dcStaffBasicMapper.updateDcStaffBasic(dcStaffBasic);
    }

    /**
     * 批量删除人员基本信息
     * 
     * @param staffBasicIds 需要删除的人员基本信息主键
     * @return 结果
     */
    @Override
    public int deleteDcStaffBasicByStaffBasicIds(String[] staffBasicIds)
    {
        return dcStaffBasicMapper.deleteDcStaffBasicByStaffBasicIds(staffBasicIds);
    }

    /**
     * 删除人员基本信息信息
     * 
     * @param staffBasicId 人员基本信息主键
     * @return 结果
     */
    @Override
    public int deleteDcStaffBasicByStaffBasicId(String staffBasicId)
    {
        return dcStaffBasicMapper.deleteDcStaffBasicByStaffBasicId(staffBasicId);
    }
}
