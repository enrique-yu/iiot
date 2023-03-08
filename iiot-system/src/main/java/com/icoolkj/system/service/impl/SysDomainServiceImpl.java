package com.icoolkj.system.service.impl;

import java.util.List;
import com.icoolkj.common.utils.DateUtils;
import com.icoolkj.common.utils.uuid.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icoolkj.system.mapper.SysDomainMapper;
import com.icoolkj.system.domain.SysDomain;
import com.icoolkj.system.service.ISysDomainService;

/**
 * 系统组织账户Service业务层处理
 * 
 * @author icoolkj
 * @date 2023-03-08
 */
@Service
public class SysDomainServiceImpl implements ISysDomainService 
{
    @Autowired
    private SysDomainMapper sysDomainMapper;

    /**
     * 查询系统组织账户
     * 
     * @param domainId 系统组织账户主键
     * @return 系统组织账户
     */
    @Override
    public SysDomain selectSysDomainByDomainId(String domainId)
    {
        return sysDomainMapper.selectSysDomainByDomainId(domainId);
    }

    /**
     * 查询系统组织账户列表
     * 
     * @param sysDomain 系统组织账户
     * @return 系统组织账户
     */
    @Override
    public List<SysDomain> selectSysDomainList(SysDomain sysDomain)
    {
        return sysDomainMapper.selectSysDomainList(sysDomain);
    }

    /**
     * 新增系统组织账户
     * 
     * @param sysDomain 系统组织账户
     * @return 结果
     */
    @Override
    public int insertSysDomain(SysDomain sysDomain)
    {
        sysDomain.setDomainId(IdWorker.nextId().toString());
        sysDomain.setCreateTime(DateUtils.getNowDate());
        return sysDomainMapper.insertSysDomain(sysDomain);
    }

    /**
     * 修改系统组织账户
     * 
     * @param sysDomain 系统组织账户
     * @return 结果
     */
    @Override
    public int updateSysDomain(SysDomain sysDomain)
    {
        sysDomain.setUpdateTime(DateUtils.getNowDate());
        return sysDomainMapper.updateSysDomain(sysDomain);
    }

    /**
     * 批量删除系统组织账户
     * 
     * @param domainIds 需要删除的系统组织账户主键
     * @return 结果
     */
    @Override
    public int deleteSysDomainByDomainIds(String[] domainIds)
    {
        return sysDomainMapper.deleteSysDomainByDomainIds(domainIds);
    }

    /**
     * 删除系统组织账户信息
     * 
     * @param domainId 系统组织账户主键
     * @return 结果
     */
    @Override
    public int deleteSysDomainByDomainId(String domainId)
    {
        return sysDomainMapper.deleteSysDomainByDomainId(domainId);
    }
}
