package com.icoolkj.system.service.impl;

import com.icoolkj.common.constant.SysConstants;
import com.icoolkj.common.core.domain.entity.SysDept;
import com.icoolkj.common.core.domain.entity.SysDomain;
import com.icoolkj.common.core.domain.entity.SysUser;
import com.icoolkj.common.utils.DateUtils;
import com.icoolkj.common.utils.SecurityUtils;
import com.icoolkj.common.utils.aes.AESUtils;
import com.icoolkj.common.utils.aes.PasswordUtils;
import com.icoolkj.common.utils.uuid.IdWorker;
import com.icoolkj.system.domain.SysUserRole;
import com.icoolkj.system.mapper.SysDeptMapper;
import com.icoolkj.system.mapper.SysDomainMapper;
import com.icoolkj.system.mapper.SysUserMapper;
import com.icoolkj.system.mapper.SysUserRoleMapper;
import com.icoolkj.system.service.ISysDomainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.List;

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

    @Autowired
    private SysDeptMapper sysDeptMapper;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SysUserRoleMapper sysUserRoleMapper;

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
    @Transactional
    public int insertSysDomain(SysDomain sysDomain)
    {
        sysDomain.setDomainId(IdWorker.nextId().toString());
        sysDomain.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserName());
        sysDomain.setCreateTime(DateUtils.getNowDate());
        if(SysConstants.DOMAIN_ROLE_SYSTEM.equals(sysDomain.getDomainRoles())){  /** 系统组织角色 */
            sysDomain.setDomainParentId(SysConstants.DOMAIN_SYSTEM); /** 系统组织域 */
        }
        if(SysConstants.DOMAIN_ROLE_COMP.equals(sysDomain.getDomainRoles())){    /** 企业组织角色 */
            sysDomain.setDomainParentId(SysConstants.DOMAIN_COMP);   /** 企业组织域 */
        }
        int count = sysDomainMapper.insertSysDomain(sysDomain);
        createDomainAccount(sysDomain);
        return count;
    }

    /**
     * 修改系统组织账户
     * 
     * @param sysDomain 系统组织账户
     * @return 结果
     */
    @Override
    @Transactional
    public int updateSysDomain(SysDomain sysDomain)
    {
        sysDomain.setUpdateBy(SecurityUtils.getLoginUser().getUser().getUserName());
        sysDomain.setUpdateTime(DateUtils.getNowDate());
        return sysDomainMapper.updateSysDomain(sysDomain);
    }


    /**
     *创建域部门及管理员信息
     *
     * @param sysDomain
     */
    private void createDomainAccount(SysDomain sysDomain) {
        //添加默认部门
        SysDept dept = new SysDept();
        String deptId = IdWorker.nextId().toString();
        dept.setDeptId(deptId);
        dept.setDomainId(sysDomain.getDomainId());
        if(SysConstants.DOMAIN_ROLE_SYSTEM.equals(sysDomain.getDomainRoles())){  /** 系统组织角色 */
            dept.setParentId(SysConstants.DEPT_DOMAIN_SYSTEM); /** 系统根部门 */
            dept.setAncestors("0,"+SysConstants.DEPT_DOMAIN_SYSTEM);
        }
        if(SysConstants.DOMAIN_ROLE_COMP.equals(sysDomain.getDomainRoles())){    /** 企业组织角色 */
            dept.setParentId(SysConstants.DEPT_DOMAIN_COMP);   /** 企业根部门 */
            dept.setAncestors("0,"+SysConstants.DEPT_DOMAIN_COMP);
        }
        dept.setDeptName("默认部门"); //部门名称
        dept.setOrderNum(1); //显示顺序
        dept.setSysDeptFlag("1");
        dept.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserName()); //创建者
        dept.setCreateTime(DateUtils.getNowDate());//创建时间
        sysDeptMapper.insertDept(dept);

        //添加管理员用户
        SysUser sysUser = new SysUser();
        String userId = IdWorker.nextId().toString();
        sysUser.setUserId(userId);
        sysUser.setDomainId(sysDomain.getDomainId()); //所属组织
        sysUser.setDeptId(deptId); //所属部门ID
        //生成随机8位密码，包含大小写和数字
        String password = PasswordUtils.getPassword(8);
        sysUser.setUserName(sysDomain.getDomainAccount()); //管理用户账号
        sysUser.setNickName(sysDomain.getDomainAccount()+"管理员");//用户昵称
        sysUser.setUserType(SysConstants.USER_TYPE_COMP); //企业用户
        sysUser.setPassword(SecurityUtils.encryptPassword(password));
        String pass = AESUtils.encryptAES(password, AESUtils.KEY, AESUtils.IV);
        sysUser.setPasswordCleartext(pass);
        sysUser.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserName());
        sysUser.setCreateTime(DateUtils.getNowDate());  //手机号码
        sysUser.setPhonenumber(sysDomain.getDomainPhone());   //用户邮箱
        sysUser.setEmail(sysDomain.getDomainEmail());
        sysUserMapper.insertUser(sysUser);

        //添加角色
        SysUserRole ur = new SysUserRole();
        ur.setUserId(userId);
        ur.setRoleId(SysConstants.ROLE_COMP);
        sysUserRoleMapper.batchUserRole(Arrays.asList(ur));
    }


}
