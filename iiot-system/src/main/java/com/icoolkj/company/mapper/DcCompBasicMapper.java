package com.icoolkj.company.mapper;

import java.util.List;
import com.icoolkj.company.domain.DcCompBasic;

/**
 * 企业基本信息Mapper接口
 * 
 * @author icoolkj
 * @date 2023-03-10
 */
public interface DcCompBasicMapper 
{
    /**
     * 查询企业基本信息
     * 
     * @param compBasicId 企业基本信息主键
     * @return 企业基本信息
     */
    public DcCompBasic selectDcCompBasicByCompBasicId(String compBasicId);

    /**
     * 查询企业基本信息列表
     * 
     * @param dcCompBasic 企业基本信息
     * @return 企业基本信息集合
     */
    public List<DcCompBasic> selectDcCompBasicList(DcCompBasic dcCompBasic);

    /**
     * 新增企业基本信息
     * 
     * @param dcCompBasic 企业基本信息
     * @return 结果
     */
    public int insertDcCompBasic(DcCompBasic dcCompBasic);

    /**
     * 修改企业基本信息
     * 
     * @param dcCompBasic 企业基本信息
     * @return 结果
     */
    public int updateDcCompBasic(DcCompBasic dcCompBasic);

    /**
     * 校验统一社会信用代码是否唯一
     *
     * @param compCreditCode
     * @return 结果
     */
    public DcCompBasic checkCreditCodeUnique(String compCreditCode);
}
