package com.icoolkj.system.mapper;

import java.util.List;
import com.icoolkj.system.domain.SysDomainRoles;

/**
 * 系统组织权限Mapper接口
 * 
 * @author icoolkj
 * @date 2023-03-08
 */
public interface SysDomainRolesMapper 
{
    /**
     * 查询系统组织权限
     * 
     * @param drolesId 系统组织权限主键
     * @return 系统组织权限
     */
    public SysDomainRoles selectSysDomainRolesByDrolesId(String drolesId);

    /**
     * 查询系统组织权限列表
     * 
     * @param sysDomainRoles 系统组织权限
     * @return 系统组织权限集合
     */
    public List<SysDomainRoles> selectSysDomainRolesList(SysDomainRoles sysDomainRoles);

    /**
     * 新增系统组织权限
     * 
     * @param sysDomainRoles 系统组织权限
     * @return 结果
     */
    public int insertSysDomainRoles(SysDomainRoles sysDomainRoles);

    /**
     * 修改系统组织权限
     * 
     * @param sysDomainRoles 系统组织权限
     * @return 结果
     */
    public int updateSysDomainRoles(SysDomainRoles sysDomainRoles);

    /**
     * 删除系统组织权限
     * 
     * @param drolesId 系统组织权限主键
     * @return 结果
     */
    public int deleteSysDomainRolesByDrolesId(String drolesId);

    /**
     * 批量删除系统组织权限
     * 
     * @param drolesIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysDomainRolesByDrolesIds(String[] drolesIds);
}
