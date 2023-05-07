package com.icoolkj.company.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icoolkj.company.mapper.DcCompStaffRelationMapper;
import com.icoolkj.company.domain.DcCompStaffRelation;
import com.icoolkj.company.service.IDcCompStaffRelationService;

/**
 * 企业人员关系Service业务层处理
 * 
 * @author icoolkj
 * @date 2023-04-22
 */
@Service
public class DcCompStaffRelationServiceImpl implements IDcCompStaffRelationService 
{
    @Autowired
    private DcCompStaffRelationMapper dcCompStaffRelationMapper;

    /**
     * 查询企业人员关系
     * 
     * @param compStaffRelationId 企业人员关系主键
     * @return 企业人员关系
     */
    @Override
    public DcCompStaffRelation selectDcCompStaffRelationByCompStaffRelationId(String compStaffRelationId)
    {
        return dcCompStaffRelationMapper.selectDcCompStaffRelationByCompStaffRelationId(compStaffRelationId);
    }

    /**
     * 查询企业人员关系列表
     * 
     * @param dcCompStaffRelation 企业人员关系
     * @return 企业人员关系
     */
    @Override
    public List<DcCompStaffRelation> selectDcCompStaffRelationList(DcCompStaffRelation dcCompStaffRelation)
    {
        return dcCompStaffRelationMapper.selectDcCompStaffRelationList(dcCompStaffRelation);
    }

    /**
     * 新增企业人员关系
     * 
     * @param dcCompStaffRelation 企业人员关系
     * @return 结果
     */
    @Override
    public int insertDcCompStaffRelation(DcCompStaffRelation dcCompStaffRelation)
    {
        return dcCompStaffRelationMapper.insertDcCompStaffRelation(dcCompStaffRelation);
    }

    /**
     * 修改企业人员关系
     * 
     * @param dcCompStaffRelation 企业人员关系
     * @return 结果
     */
    @Override
    public int updateDcCompStaffRelation(DcCompStaffRelation dcCompStaffRelation)
    {
        return dcCompStaffRelationMapper.updateDcCompStaffRelation(dcCompStaffRelation);
    }

    /**
     * 批量删除企业人员关系
     * 
     * @param compStaffRelationIds 需要删除的企业人员关系主键
     * @return 结果
     */
    @Override
    public int deleteDcCompStaffRelationByCompStaffRelationIds(String[] compStaffRelationIds)
    {
        return dcCompStaffRelationMapper.deleteDcCompStaffRelationByCompStaffRelationIds(compStaffRelationIds);
    }

    /**
     * 删除企业人员关系信息
     * 
     * @param compStaffRelationId 企业人员关系主键
     * @return 结果
     */
    @Override
    public int deleteDcCompStaffRelationByCompStaffRelationId(String compStaffRelationId)
    {
        return dcCompStaffRelationMapper.deleteDcCompStaffRelationByCompStaffRelationId(compStaffRelationId);
    }
}
