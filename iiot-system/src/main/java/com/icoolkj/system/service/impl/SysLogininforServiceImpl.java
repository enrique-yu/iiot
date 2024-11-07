package com.icoolkj.system.service.impl;

import java.util.List;

import com.icoolkj.common.constant.SysConstants;
import com.icoolkj.common.utils.SecurityUtils;
import com.icoolkj.common.utils.uuid.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icoolkj.system.domain.SysLogininfor;
import com.icoolkj.system.mapper.SysLogininforMapper;
import com.icoolkj.system.service.ISysLogininforService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 系统访问日志情况信息 服务层处理
 * 
 * @author:haiwei.yu01
 */
@Service
public class SysLogininforServiceImpl implements ISysLogininforService
{

    @Autowired
    private SysLogininforMapper logininforMapper;

    /**
     * 新增系统登录日志
     * 
     * @param logininfor 访问日志对象
     */
    @Override
    public void insertLogininfor(SysLogininfor logininfor)
    {
        logininfor.setInfoId(IdWorker.nextId().toString());
        logininforMapper.insertLogininfor(logininfor);
    }

    /**
     * 查询系统登录日志集合
     * 
     * @param logininfor 访问日志对象
     * @return 登录记录集合
     */
    @Override
    public List<SysLogininfor> selectLogininforList(SysLogininfor logininfor)
    {
        return logininforMapper.selectLogininforList(logininfor);
    }

    /**
     * 批量删除系统登录日志
     * 
     * @param infoIds 需要删除的登录日志ID
     * @return 结果
     */
    @Override
    @Transactional
    public int deleteLogininforByIds(String[] infoIds)
    {
        logininforMapper.insertHisByIds(infoIds);
        return logininforMapper.deleteLogininforByIds(infoIds);
    }

    /**
     * 清空系统登录日志
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public void cleanLogininfor()
    {
        String domainId = SecurityUtils.getDomainId();
        if(SysConstants.DOMAIN_SYSTEM.equals(domainId)){
            logininforMapper.insertHisAll();
            logininforMapper.cleanLogininfor();
        } else {
            logininforMapper.insertHisByDomain(domainId);
            logininforMapper.cleanLogininforByDomain(domainId);
        }
    }
}
