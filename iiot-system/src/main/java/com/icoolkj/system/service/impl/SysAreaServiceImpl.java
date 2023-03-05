package com.icoolkj.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icoolkj.system.mapper.SysAreaMapper;
import com.icoolkj.system.domain.SysArea;
import com.icoolkj.system.service.ISysAreaService;

/**
 * 系统区域配置Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-03-05
 */
@Service
public class SysAreaServiceImpl implements ISysAreaService 
{
    @Autowired
    private SysAreaMapper sysAreaMapper;

    /**
     * 查询系统区域配置
     * 
     * @param areaCode 系统区域配置主键
     * @return 系统区域配置
     */
    @Override
    public SysArea selectSysAreaByAreaCode(String areaCode)
    {
        return sysAreaMapper.selectSysAreaByAreaCode(areaCode);
    }

    /**
     * 查询系统区域配置列表
     * 
     * @param sysArea 系统区域配置
     * @return 系统区域配置
     */
    @Override
    public List<SysArea> selectSysAreaList(SysArea sysArea)
    {
        return sysAreaMapper.selectSysAreaList(sysArea);
    }

    /**
     * 新增系统区域配置
     * 
     * @param sysArea 系统区域配置
     * @return 结果
     */
    @Override
    public int insertSysArea(SysArea sysArea)
    {
        return sysAreaMapper.insertSysArea(sysArea);
    }

    /**
     * 修改系统区域配置
     * 
     * @param sysArea 系统区域配置
     * @return 结果
     */
    @Override
    public int updateSysArea(SysArea sysArea)
    {
        return sysAreaMapper.updateSysArea(sysArea);
    }

    /**
     * 批量删除系统区域配置
     * 
     * @param areaCodes 需要删除的系统区域配置主键
     * @return 结果
     */
    @Override
    public int deleteSysAreaByAreaCodes(String[] areaCodes)
    {
        return sysAreaMapper.deleteSysAreaByAreaCodes(areaCodes);
    }

    /**
     * 删除系统区域配置信息
     * 
     * @param areaCode 系统区域配置主键
     * @return 结果
     */
    @Override
    public int deleteSysAreaByAreaCode(String areaCode)
    {
        return sysAreaMapper.deleteSysAreaByAreaCode(areaCode);
    }
}
