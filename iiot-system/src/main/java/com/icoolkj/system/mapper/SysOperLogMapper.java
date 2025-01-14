package com.icoolkj.system.mapper;

import java.util.List;
import com.icoolkj.system.domain.SysOperLog;

/**
 * 操作日志 数据层
 * 
 * @author:haiwei.yu01
 */
public interface SysOperLogMapper
{
    /**
     * 新增操作日志
     * 
     * @param operLog 操作日志对象
     */
    public void insertOperlog(SysOperLog operLog);

    /**
     * 查询系统操作日志集合
     * 
     * @param operLog 操作日志对象
     * @return 操作日志集合
     */
    public List<SysOperLog> selectOperLogList(SysOperLog operLog);

    /**
     * 查询操作日志详细
     *
     * @param operId 操作ID
     * @return 操作日志对象
     */
    public SysOperLog selectOperLogById(String operId);

    /**
     * 批量删除系统操作日志
     * 
     * @param operIds 需要删除的操作日志ID
     * @return 结果
     */
    public int insertHisByIds(String[] operIds);
    public int deleteOperLogByIds(String[] operIds);

    /**
     * 清空操作日志
     */
    public int insertHisAll();
    public int cleanOperLog();

    public int insertHisByDomain(String domainId);
    public int cleanOperLogByDomain(String domainId);
}
