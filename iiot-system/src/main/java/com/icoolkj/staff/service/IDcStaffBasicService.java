package com.icoolkj.staff.service;

import java.util.List;
import com.icoolkj.staff.domain.DcStaffBasic;

/**
 * 人员基本信息Service接口
 * 
 * @author icoolkj
 * @date 2023-03-17
 */
public interface IDcStaffBasicService 
{
    /**
     * 查询人员基本信息
     * 
     * @param staffBasicId 人员基本信息主键
     * @return 人员基本信息
     */
    public DcStaffBasic selectDcStaffBasicByStaffBasicId(String staffBasicId);

    /**
     * 查询人员基本信息列表
     * 
     * @param dcStaffBasic 人员基本信息
     * @return 人员基本信息集合
     */
    public List<DcStaffBasic> selectDcStaffBasicList(DcStaffBasic dcStaffBasic);

    /**
     * 新增人员基本信息
     * 
     * @param dcStaffBasic 人员基本信息
     * @return 结果
     */
    public int insertDcStaffBasic(DcStaffBasic dcStaffBasic);

    /**
     * 修改人员基本信息
     * 
     * @param dcStaffBasic 人员基本信息
     * @return 结果
     */
    public int updateDcStaffBasic(DcStaffBasic dcStaffBasic);

    /**
     * 批量删除人员基本信息
     * 
     * @param staffBasicIds 需要删除的人员基本信息主键集合
     * @return 结果
     */
    public int deleteDcStaffBasicByStaffBasicIds(String[] staffBasicIds);

    /**
     * 删除人员基本信息信息
     * 
     * @param staffBasicId 人员基本信息主键
     * @return 结果
     */
    public int deleteDcStaffBasicByStaffBasicId(String staffBasicId);
}
