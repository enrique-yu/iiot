package com.icoolkj.company.service;

import com.icoolkj.company.domain.IcCompBasic;

import java.util.List;

/**
 * 企业基本信息Service接口
 * 
 * @author icoolkj
 * @date 2023-03-05
 */
public interface IIcCompBasicService 
{
    /**
     * 查询企业基本信息
     * 
     * @param compBasicId 企业基本信息主键
     * @return 企业基本信息
     */
    public IcCompBasic selectIcCompBasicByCompBasicId(String compBasicId);

    /**
     * 查询企业基本信息列表
     * 
     * @param icCompBasic 企业基本信息
     * @return 企业基本信息集合
     */
    public List<IcCompBasic> selectIcCompBasicList(IcCompBasic icCompBasic);

    /**
     * 新增企业基本信息
     * 
     * @param icCompBasic 企业基本信息
     * @return 结果
     */
    public int insertIcCompBasic(IcCompBasic icCompBasic);

    /**
     * 修改企业基本信息
     * 
     * @param icCompBasic 企业基本信息
     * @return 结果
     */
    public int updateIcCompBasic(IcCompBasic icCompBasic);


}
