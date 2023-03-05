package com.icoolkj.company.service.impl;

import com.icoolkj.common.utils.DateUtils;
import com.icoolkj.company.domain.IcCompBasic;
import com.icoolkj.company.mapper.IcCompBasicMapper;
import com.icoolkj.company.service.IIcCompBasicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 企业基本信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-03-05
 */
@Service
public class IcCompBasicServiceImpl implements IIcCompBasicService 
{
    @Autowired
    private IcCompBasicMapper icCompBasicMapper;

    /**
     * 查询企业基本信息
     * 
     * @param compBasicId 企业基本信息主键
     * @return 企业基本信息
     */
    @Override
    public IcCompBasic selectIcCompBasicByCompBasicId(String compBasicId)
    {
        return icCompBasicMapper.selectIcCompBasicByCompBasicId(compBasicId);
    }

    /**
     * 查询企业基本信息列表
     * 
     * @param icCompBasic 企业基本信息
     * @return 企业基本信息
     */
    @Override
    public List<IcCompBasic> selectIcCompBasicList(IcCompBasic icCompBasic)
    {
        return icCompBasicMapper.selectIcCompBasicList(icCompBasic);
    }

    /**
     * 新增企业基本信息
     * 
     * @param icCompBasic 企业基本信息
     * @return 结果
     */
    @Override
    public int insertIcCompBasic(IcCompBasic icCompBasic)
    {
        icCompBasic.setCreateTime(DateUtils.getNowDate());
        return icCompBasicMapper.insertIcCompBasic(icCompBasic);
    }

    /**
     * 修改企业基本信息
     * 
     * @param icCompBasic 企业基本信息
     * @return 结果
     */
    @Override
    public int updateIcCompBasic(IcCompBasic icCompBasic)
    {
        icCompBasic.setUpdateTime(DateUtils.getNowDate());
        return icCompBasicMapper.updateIcCompBasic(icCompBasic);
    }

    /**
     * 批量删除企业基本信息
     * 
     * @param compBasicIds 需要删除的企业基本信息主键
     * @return 结果
     */
    @Override
    public int deleteIcCompBasicByCompBasicIds(String[] compBasicIds)
    {
        return icCompBasicMapper.deleteIcCompBasicByCompBasicIds(compBasicIds);
    }

    /**
     * 删除企业基本信息信息
     * 
     * @param compBasicId 企业基本信息主键
     * @return 结果
     */
    @Override
    public int deleteIcCompBasicByCompBasicId(String compBasicId)
    {
        return icCompBasicMapper.deleteIcCompBasicByCompBasicId(compBasicId);
    }
}
