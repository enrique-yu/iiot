package com.icoolkj.system.mapper;

import java.util.List;
import com.icoolkj.system.domain.SysDomain;

/**
 * 系统组织账户Mapper接口
 * 
 * @author icoolkj
 * @date 2023-03-08
 */
public interface SysDomainMapper 
{
    /**
     * 查询系统组织账户
     * 
     * @param domainId 系统组织账户主键
     * @return 系统组织账户
     */
    public SysDomain selectSysDomainByDomainId(String domainId);

    /**
     * 查询系统组织账户列表
     * 
     * @param sysDomain 系统组织账户
     * @return 系统组织账户集合
     */
    public List<SysDomain> selectSysDomainList(SysDomain sysDomain);

    /**
     * 新增系统组织账户
     * 
     * @param sysDomain 系统组织账户
     * @return 结果
     */
    public int insertSysDomain(SysDomain sysDomain);

    /**
     * 修改系统组织账户
     * 
     * @param sysDomain 系统组织账户
     * @return 结果
     */
    public int updateSysDomain(SysDomain sysDomain);

    /**
     * 删除系统组织账户
     * 
     * @param domainId 系统组织账户主键
     * @return 结果
     */
    public int deleteSysDomainByDomainId(String domainId);

    /**
     * 批量删除系统组织账户
     * 
     * @param domainIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysDomainByDomainIds(String[] domainIds);
}