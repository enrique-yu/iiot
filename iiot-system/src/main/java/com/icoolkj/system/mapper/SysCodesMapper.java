package com.icoolkj.system.mapper;

import com.icoolkj.system.domain.SysCodes;

import java.util.List;

/**
 * 编码生成记录Mapper接口
 *
 * @author:haiwei.yu01
 * @date 2023-11-11
 */
public interface SysCodesMapper
{
    /**
     * 查询编码生成记录
     *
     * @param id 编码生成记录主键
     * @return 编码生成记录
     */
    public SysCodes selectSysCodesById(Long id);

    /**
     * 根据 业务编码前缀 查询最大增长值
     * @param prefix 业务编码前缀
     * @return
     */
    public Long selectMaxIncrementByPrefix(String prefix);

    /**
     * 查询编码生成记录列表
     *
     * @param sysCodes 编码生成记录
     * @return 编码生成记录集合
     */
    public List<SysCodes> selectSysCodesList(SysCodes sysCodes);

    /**
     * 新增编码生成记录
     *
     * @param sysCodes 编码生成记录
     * @return 结果
     */
    public int insertSysCodes(SysCodes sysCodes);
}
