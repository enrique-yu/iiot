package com.icoolkj.company.mapper;

import java.util.List;
import com.icoolkj.company.domain.DcCompStaffRelation;

/**
 * 企业人员关系Mapper接口
 * 
 * @author:haiwei.yu01
 * @date 2023-04-22
 */
public interface DcCompStaffRelationMapper 
{
    /**
     * 查询企业人员关系
     * 
     * @param compStaffRelationId 企业人员关系主键
     * @return 企业人员关系
     */
    public DcCompStaffRelation selectDcCompStaffRelationByCompStaffRelationId(String compStaffRelationId);

    /**
     * 查询企业人员关系列表
     * 
     * @param dcCompStaffRelation 企业人员关系
     * @return 企业人员关系集合
     */
    public List<DcCompStaffRelation> selectDcCompStaffRelationList(DcCompStaffRelation dcCompStaffRelation);

    /**
     * 新增企业人员关系
     * 
     * @param dcCompStaffRelation 企业人员关系
     * @return 结果
     */
    public int insertDcCompStaffRelation(DcCompStaffRelation dcCompStaffRelation);

    /**
     * 修改企业人员关系
     * 
     * @param dcCompStaffRelation 企业人员关系
     * @return 结果
     */
    public int updateDcCompStaffRelation(DcCompStaffRelation dcCompStaffRelation);

    /**
     * 删除企业人员关系
     * 
     * @param compStaffRelationId 企业人员关系主键
     * @return 结果
     */
    public int deleteDcCompStaffRelationByCompStaffRelationId(String compStaffRelationId);

    /**
     * 批量删除企业人员关系
     * 
     * @param compStaffRelationIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDcCompStaffRelationByCompStaffRelationIds(String[] compStaffRelationIds);
}
