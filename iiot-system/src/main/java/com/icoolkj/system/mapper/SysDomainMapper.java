package com.icoolkj.system.mapper;

import java.util.List;
import com.icoolkj.common.core.domain.entity.SysDomain;

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

}
