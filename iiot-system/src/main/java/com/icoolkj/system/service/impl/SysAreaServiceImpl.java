package com.icoolkj.system.service.impl;

import com.icoolkj.common.constant.UserConstants;
import com.icoolkj.common.utils.StringUtils;
import com.icoolkj.common.core.domain.entity.SysArea;
import com.icoolkj.system.mapper.SysAreaMapper;
import com.icoolkj.system.service.ISysAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
     * @param areaId 系统区域配置主键
     * @return 系统区域配置
     */
    @Override
    public SysArea selectSysAreaByAreaId(String areaId)
    {
        return sysAreaMapper.selectSysAreaByAreaId(areaId);
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
     * 校验区域编码是否唯一
     *
     * @param sysArea 区域信息
     * @return 结果
     */
    @Override
    public boolean checkAreaIdUnique(SysArea sysArea)
    {
        SysArea info = sysAreaMapper.checkAreaIdUnique(sysArea.getAreaId());
        if (StringUtils.isNotNull(info))
        {
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }


}
