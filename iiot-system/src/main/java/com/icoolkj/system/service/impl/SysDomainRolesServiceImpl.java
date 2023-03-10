package com.icoolkj.system.service.impl;

import com.icoolkj.common.utils.DateUtils;
import com.icoolkj.common.utils.SecurityUtils;
import com.icoolkj.common.utils.uuid.IdWorker;
import com.icoolkj.common.core.domain.entity.SysDomainRoles;
import com.icoolkj.system.mapper.SysDomainRolesMapper;
import com.icoolkj.system.service.ISysDomainRolesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 系统组织权限Service业务层处理
 * 
 * @author icoolkj
 * @date 2023-03-08
 */
@Service
public class SysDomainRolesServiceImpl implements ISysDomainRolesService 
{
    @Autowired
    private SysDomainRolesMapper sysDomainRolesMapper;

    /**
     * 查询系统组织权限
     * 
     * @param drolesId 系统组织权限主键
     * @return 系统组织权限
     */
    @Override
    public SysDomainRoles selectSysDomainRolesByDrolesId(String drolesId)
    {
        return sysDomainRolesMapper.selectSysDomainRolesByDrolesId(drolesId);
    }

    /**
     * 查询系统组织权限列表
     * 
     * @param sysDomainRoles 系统组织权限
     * @return 系统组织权限
     */
    @Override
    public List<SysDomainRoles> selectSysDomainRolesList(SysDomainRoles sysDomainRoles)
    {
        return sysDomainRolesMapper.selectSysDomainRolesList(sysDomainRoles);
    }

    /**
     * 新增系统组织权限
     * 
     * @param sysDomainRoles 系统组织权限
     * @return 结果
     */
    @Override
    public int insertSysDomainRoles(SysDomainRoles sysDomainRoles)
    {
        sysDomainRoles.setDrolesId(IdWorker.nextId().toString());
        sysDomainRoles.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId());
        sysDomainRoles.setCreateTime(DateUtils.getNowDate());
        return sysDomainRolesMapper.insertSysDomainRoles(sysDomainRoles);
    }

    /**
     * 修改系统组织权限
     * 
     * @param sysDomainRoles 系统组织权限
     * @return 结果
     */
    @Override
    public int updateSysDomainRoles(SysDomainRoles sysDomainRoles)
    {
        sysDomainRoles.setUpdateBy(SecurityUtils.getLoginUser().getUser().getUserId());
        sysDomainRoles.setUpdateTime(DateUtils.getNowDate());
        return sysDomainRolesMapper.updateSysDomainRoles(sysDomainRoles);
    }


    /**
     * 查询所有系统组织权限
     *
     * @return 系统组织权限列表
     */
    @Override
    public List<SysDomainRoles> selectDomainRolesAll()
    {
        return sysDomainRolesMapper.selectDomainRolesAll();
    }
}
