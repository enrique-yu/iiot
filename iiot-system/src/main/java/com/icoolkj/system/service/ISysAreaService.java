package com.icoolkj.system.service;

import java.util.List;
import com.icoolkj.system.domain.SysArea;

/**
 * 系统区域配置Service接口
 * 
 * @author ruoyi
 * @date 2023-03-05
 */
public interface ISysAreaService 
{
    /**
     * 查询系统区域配置
     * 
     * @param areaCode 系统区域配置主键
     * @return 系统区域配置
     */
    public SysArea selectSysAreaByAreaCode(String areaCode);

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
     * 批量删除系统区域配置
     * 
     * @param areaCodes 需要删除的系统区域配置主键集合
     * @return 结果
     */
    public int deleteSysAreaByAreaCodes(String[] areaCodes);

    /**
     * 删除系统区域配置信息
     * 
     * @param areaCode 系统区域配置主键
     * @return 结果
     */
    public int deleteSysAreaByAreaCode(String areaCode);
}
