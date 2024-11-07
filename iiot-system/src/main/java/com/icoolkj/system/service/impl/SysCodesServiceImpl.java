package com.icoolkj.system.service.impl;

import com.icoolkj.system.domain.SysCodes;
import com.icoolkj.system.mapper.SysCodesMapper;
import com.icoolkj.system.service.ISysCodesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 编码生成记录Service业务层处理
 *
 * @author:haiwei.yu01
 * @date 2023-11-11
 */
@Service
public class SysCodesServiceImpl implements ISysCodesService
{
    @Autowired
    private SysCodesMapper sysCodesMapper;

    /**
     * 查询编码生成记录
     *
     * @param id 编码生成记录主键
     * @return 编码生成记录
     */
    @Override
    public SysCodes selectSysCodesById(Long id)
    {
        return sysCodesMapper.selectSysCodesById(id);
    }

    /**
     * 根据 业务编码前缀 查询最大增长值
     * @param prefix 业务编码前缀
     * @return
     */
    public Long selectMaxIncrementByPrefix(String prefix)  {
        return sysCodesMapper.selectMaxIncrementByPrefix(prefix);
    }

    /**
     * 查询编码生成记录列表
     *
     * @param sysCodes 编码生成记录
     * @return 编码生成记录
     */
    @Override
    public List<SysCodes> selectSysCodesList(SysCodes sysCodes)
    {
        return sysCodesMapper.selectSysCodesList(sysCodes);
    }

    /**
     * 新增编码生成记录
     *
     * @param sysCodes 编码生成记录
     * @return 结果
     */
    @Override
    public int insertSysCodes(SysCodes sysCodes)
    {
        return sysCodesMapper.insertSysCodes(sysCodes);
    }

}
