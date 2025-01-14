package com.icoolkj.system.service;

import java.util.List;
import com.icoolkj.common.core.domain.entity.SysArea;

/**
 * 系统区域配置Service接口
 * 
 * @author:haiwei.yu01
 * @date 2023-03-05
 */
public interface ISysAreaService 
{
    /**
     * 查询系统区域配置
     * 
     * @param areaId 系统区域配置主键
     * @return 系统区域配置
     */
    public SysArea selectSysAreaByAreaId(String areaId);

    /**
     * 查询系统区域配置列表
     * 
     * @param sysArea 系统区域配置
     * @return 系统区域配置集合
     */
    public List<SysArea> selectSysAreaList(SysArea sysArea);

    /**
     * 新增系统区域配置
     * 
     * @param sysArea 系统区域配置
     * @return 结果
     */
    public int insertSysArea(SysArea sysArea);

    /**
     * 修改系统区域配置
     * 
     * @param sysArea 系统区域配置
     * @return 结果
     */
    public int updateSysArea(SysArea sysArea);

    /**
     * 校验区域编码是否唯一
     *
     * @param sysArea
     * @return 结果
     */
    boolean checkAreaIdUnique(SysArea sysArea);

}
