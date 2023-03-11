package com.icoolkj.company.service.impl;

import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import com.icoolkj.common.constant.SysConstants;
import com.icoolkj.common.constant.UserConstants;
import com.icoolkj.common.core.domain.entity.SysDept;
import com.icoolkj.common.core.domain.entity.SysDomain;
import com.icoolkj.common.core.domain.entity.SysUser;
import com.icoolkj.common.utils.DateUtils;
import com.icoolkj.common.utils.SecurityUtils;
import com.icoolkj.common.utils.StringUtils;
import com.icoolkj.common.utils.aes.AESUtils;
import com.icoolkj.common.utils.aes.PasswordUtils;
import com.icoolkj.common.utils.uuid.IdWorker;
import com.icoolkj.system.domain.SysUserRole;
import com.icoolkj.system.mapper.SysDeptMapper;
import com.icoolkj.system.mapper.SysDomainMapper;
import com.icoolkj.system.mapper.SysUserMapper;
import com.icoolkj.system.mapper.SysUserRoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icoolkj.company.mapper.DcCompBasicMapper;
import com.icoolkj.company.domain.DcCompBasic;
import com.icoolkj.company.service.IDcCompBasicService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 企业基本信息Service业务层处理
 * 
 * @author icoolkj
 * @date 2023-03-10
 */
@Service
public class DcCompBasicServiceImpl implements IDcCompBasicService 
{
    @Autowired
    private DcCompBasicMapper dcCompBasicMapper;

    @Autowired
    private SysDomainMapper sysDomainMapper;

    @Autowired
    private SysDeptMapper sysDeptMapper;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SysUserRoleMapper sysUserRoleMapper;

    /**
     * 查询企业基本信息
     * 
     * @param compBasicId 企业基本信息主键
     * @return 企业基本信息
     */
    @Override
    public DcCompBasic selectDcCompBasicByCompBasicId(String compBasicId)
    {
        return dcCompBasicMapper.selectDcCompBasicByCompBasicId(compBasicId);
    }

    /**
     * 查询企业基本信息列表
     * 
     * @param dcCompBasic 企业基本信息
     * @return 企业基本信息
     */
    @Override
    public List<DcCompBasic> selectDcCompBasicList(DcCompBasic dcCompBasic)
    {
        return dcCompBasicMapper.selectDcCompBasicList(dcCompBasic);
    }

    /**
     * 新增企业基本信息
     * 
     * @param dcCompBasic 企业基本信息
     * @return 结果
     */
    @Override
    @Transactional
    public int insertDcCompBasic(DcCompBasic dcCompBasic)
    {
        dcCompBasic.setCompBasicId(IdWorker.nextId().toString());
        dcCompBasic.setCreateTime(DateUtils.getNowDate());
        createCompAccount(dcCompBasic);
        return dcCompBasicMapper.insertDcCompBasic(dcCompBasic);
    }

    /**
     * 修改企业基本信息
     * 
     * @param dcCompBasic 企业基本信息
     * @return 结果
     */
    @Override
    @Transactional
    public int updateDcCompBasic(DcCompBasic dcCompBasic)
    {
        dcCompBasic.setUpdateBy(SecurityUtils.getLoginUser().getUser().getUserId());
        dcCompBasic.setUpdateTime(DateUtils.getNowDate());
        createCompAccount(dcCompBasic);
        return dcCompBasicMapper.updateDcCompBasic(dcCompBasic);
    }


    /**
     * 根据统一社会信用代码获取信息
     *
     * @param dcCompBasic
     * @return 结果
     */
    @Override
    public DcCompBasic getDcCompBasicByCreditCode(DcCompBasic dcCompBasic)
    {
        return dcCompBasicMapper.getDcCompBasicByCreditCode(dcCompBasic.getCompCreditCode());
    }


    //企业账号管理
    private void createCompAccount(DcCompBasic dcCompBasic) {
        //添加企业组织账号
        String account = "COMP-" + dcCompBasic.getCompCreditCode();  //企业管理用户账号
        String domainId = IdWorker.nextId().toString();
        SysDomain sysDomain = new SysDomain();
        sysDomain.setDomainId(domainId);
        sysDomain.setDomainParentId(SysConstants.DOMAIN_COMP); //企业组织域
        sysDomain.setDrolesId(SysConstants.DOMAIN_ROLE_COMP);  //企业组织角色
        sysDomain.setDomainName(dcCompBasic.getCompName());
        sysDomain.setDomainAccount(account);
        Calendar rightNowDate = Calendar.getInstance();
        rightNowDate.add(Calendar.YEAR, 20); //有效期20年
        sysDomain.setDomainIndate(rightNowDate.getTime()); //组织账户有效期
        sysDomain.setDomainRegion(dcCompBasic.getCompArea());
        sysDomain.setDomainPhone(dcCompBasic.getCompLxrPhone());
        sysDomain.setDomainEmail(dcCompBasic.getCompLxrEmail());
        sysDomain.setDomainRelationId(dcCompBasic.getCompBasicId()); //组织账号与业务关系ID
        sysDomain.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId());
        sysDomain.setCreateTime(DateUtils.getNowDate());
        sysDomainMapper.insertSysDomain(sysDomain);

        //添加企业默认部门
        SysDept dept = new SysDept();
        String deptId = IdWorker.nextId().toString();
        dept.setDeptId(deptId);
        dept.setDomainId(domainId);
        dept.setDeptName("企业默认部门"); //部门名称
        dept.setOrderNum(1); //显示顺序
        dept.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId()); //创建者
        dept.setCreateTime(DateUtils.getNowDate());//创建时间
        sysDeptMapper.insertDept(dept);

        //添加企业管理员用户
        SysUser sysUser = new SysUser();
        String userId = IdWorker.nextId().toString();
        sysUser.setUserId(userId);
        sysUser.setDomainId(domainId); //所属组织
        sysUser.setDeptId(deptId); //所属部门ID
        //生成随机8位密码，包含大小写和数字
        String password = PasswordUtils.getPassword(8);
        sysUser.setUserName(account); //企业管理用户账号
        sysUser.setNickName(account+"管理员");//用户昵称
        sysUser.setUserType(SysConstants.USER_TYPE_COMP); //企业用户
        sysUser.setPassword(SecurityUtils.encryptPassword(password));
        String pass = AESUtils.encryptAES(password, AESUtils.KEY, AESUtils.IV);
        sysUser.setPasswordCleartext(pass);
        sysUser.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId());
        sysUser.setCreateTime(DateUtils.getNowDate());  //手机号码
        sysUser.setPhonenumber(dcCompBasic.getCompLxrPhone());   //用户邮箱
        sysUser.setEmail(dcCompBasic.getCompLxrEmail());
        sysUserMapper.insertUser(sysUser);

        //添加企业角色
        SysUserRole ur = new SysUserRole();
        ur.setUserId(userId);
        ur.setRoleId(SysConstants.ROLE_COMP);
        sysUserRoleMapper.batchUserRole(Arrays.asList(ur));
    }
}
