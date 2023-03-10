package com.icoolkj.company.mapper;

import com.icoolkj.company.domain.DcCompBasic;

import java.util.List;

/**
 * 企业基本信息Mapper接口
 * 
 * @author icoolkj
 * @date 2023-03-05
 */
public interface DcCompBasicMapper
{
    /**
     * 查询企业基本信息
     * 
     * @param compBasicId 企业基本信息主键
     * @return 企业基本信息
     */
    public DcCompBasic selectIcCompBasicByCompBasicId(String compBasicId);

    /**
     * 查询企业基本信息列表
     * 
     * @param icCompBasic 企业基本信息
     * @return 企业基本信息集合
     */
    public List<DcCompBasic> selectIcCompBasicList(DcCompBasic icCompBasic);

    /**
     * 新增企业基本信息
     * 
     * @param icCompBasic 企业基本信息
     * @return 结果
     */
    public int insertIcCompBasic(DcCompBasic icCompBasic);

    /**
     * 修改企业基本信息
     * 
     * @param icCompBasic 企业基本信息
     * @return 结果
     */
    public int updateIcCompBasic(DcCompBasic icCompBasic);


    /**
     * 校验统一社会信用代码是否唯一
     *
     * @param compCreditCode
     * @return 结果
     */
    public DcCompBasic checkCreditCodeUnique(String compCreditCode);
}
