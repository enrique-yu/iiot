package com.icoolkj.company.service.impl;

import com.icoolkj.common.constant.SysConstants;
import com.icoolkj.common.constant.UserConstants;
import com.icoolkj.common.core.domain.entity.SysDept;
import com.icoolkj.common.core.domain.entity.SysUser;
import com.icoolkj.common.utils.DateUtils;
import com.icoolkj.common.utils.aes.AESUtils;
import com.icoolkj.common.utils.aes.PasswordUtils;
import com.icoolkj.common.utils.SecurityUtils;
import com.icoolkj.common.utils.StringUtils;
import com.icoolkj.common.utils.uuid.IdWorker;
import com.icoolkj.company.domain.IcCompBasic;
import com.icoolkj.company.mapper.IcCompBasicMapper;
import com.icoolkj.company.service.IIcCompBasicService;
import com.icoolkj.system.domain.SysDomain;
import com.icoolkj.system.domain.SysUserRole;
import com.icoolkj.system.mapper.SysDeptMapper;
import com.icoolkj.system.mapper.SysDomainMapper;
import com.icoolkj.system.mapper.SysUserMapper;
import com.icoolkj.system.mapper.SysUserRoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
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
        icCompBasic.setCompBasicId(IdWorker.nextId().toString());
        icCompBasic.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId());
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
        icCompBasic.setUpdateBy(SecurityUtils.getLoginUser().getUser().getUserId());
        icCompBasic.setUpdateTime(DateUtils.getNowDate());
        return icCompBasicMapper.updateIcCompBasic(icCompBasic);
    }

    /**
     * 校验统一社会信用代码是否唯一
     *
     * @param icCompBasic
     * @return 结果
     */
    @Override
    public boolean checkCreditCodeUnique(IcCompBasic icCompBasic)
    {
        IcCompBasic info = icCompBasicMapper.checkCreditCodeUnique(icCompBasic.getCompCreditCode());
        if (StringUtils.isNotNull(info))
        {
            //如果是修改判断ID是否存在并且一致
            String id = icCompBasic.getCompBasicId();
            if(StringUtils.isNotEmpty(id) && id.equals(info.getCompBasicId())){
                return UserConstants.UNIQUE;
            }
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }


    //企业账号管理
    private void createCompAccount(IcCompBasic icCompBasic) {
        String account = "COMP-" + icCompBasic.getCompCreditCode();  //企业管理用户账号
        //组织账号
        String domainId = IdWorker.nextId().toString();
        SysDomain sysDomain = new SysDomain();
        sysDomain.setDomainId(domainId);
        sysDomain.setDomainParentId("");
        sysDomain.setDrolesId(SysConstants.DOMAIN_TYPE_COMP);  //企业组织角色
        sysDomain.setDomainName(icCompBasic.getCompName());
        sysDomain.setDomainAccount(account);
        Calendar rightNowDate = Calendar.getInstance();
        rightNowDate.add(Calendar.YEAR, 20);
        sysDomain.setDomainIndate(rightNowDate.getTime()); //组织账户有效期
        sysDomain.setDomainRegion(icCompBasic.getCompArea());
        sysDomain.setDomainPhone(icCompBasic.getCompLxrPhone());
        sysDomain.setDomainEmail(icCompBasic.getCompLxrEmail());
        sysDomain.setDomainDesc("");
        sysDomain.setDomainRelationId(""); //组织账号与业务关系ID
        sysDomain.setDomainStatus("0"); //组织账号状态（0正常 1停用）
        sysDomain.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId());
        sysDomain.setCreateTime(DateUtils.getNowDate());
        sysDomainMapper.insertSysDomain(sysDomain);


        //添加部门
        SysDept dept = new SysDept();
        String deptId = IdWorker.nextId().toString();
        dept.setDeptId(deptId);
        dept.setParentId(SysConstants.DEPT_133702242296393723);
        dept.setAncestors(SysConstants.DEPT_HOME+","+SysConstants.DEPT_133702242296393723);
        dept.setDomainId(domainId);
        dept.setDeptName(icCompBasic.getCompName()); //部门名称
        dept.setOrderNum(1); //显示顺序
        dept.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId()); //创建者
        dept.setCreateTime(DateUtils.getNowDate());//创建时间
        sysDeptMapper.insertDept(dept);

        //添加用户
        SysUser sysUser = new SysUser();
        String userId = IdWorker.nextId().toString();
        sysUser.setUserId(userId);
        sysUser.setDeptId(deptId); //所属部门ID
        //生成随机8位密码，包含大小写和数字
        String password = PasswordUtils.getPassword(8);
        sysUser.setUserName(account); //企业管理用户账号
        sysUser.setNickName(icCompBasic.getCompName());//用户昵称
        //sysUser.set(SysConstants.deptType.COMP); //用户类型
        sysUser.setPassword(SecurityUtils.encryptPassword(password));
        String pass = AESUtils.encryptAES(password, AESUtils.KEY, AESUtils.IV);
        //sysUser.setCleartextPassword(pass);
        sysUser.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId());
        sysUser.setCreateTime(DateUtils.getNowDate());
        sysUser.setPhonenumber("");
        sysUserMapper.insertUser(sysUser);

        //添加角色
        SysUserRole ur = new SysUserRole();
        ur.setUserId(sysUser.getUserId());
        ur.setRoleId("");
        sysUserRoleMapper.batchUserRole(Arrays.asList(ur));
    }




}
