package com.icoolkj.file.service.impl;

import java.util.List;
import com.icoolkj.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icoolkj.file.mapper.FileCatalogConfigMapper;
import com.icoolkj.file.domain.FileCatalogConfig;
import com.icoolkj.file.service.IFileCatalogConfigService;

/**
 * 文件目录配置Service业务层处理
 * 
 * @author icoolkj
 * @date 2023-03-18
 */
@Service
public class FileCatalogConfigServiceImpl implements IFileCatalogConfigService 
{
    @Autowired
    private FileCatalogConfigMapper fileCatalogConfigMapper;

    /**
     * 查询文件目录配置
     * 
     * @param fileCatalogCode 文件目录配置主键
     * @return 文件目录配置
     */
    @Override
    public FileCatalogConfig selectFileCatalogConfigByFileCatalogCode(String fileCatalogCode)
    {
        return fileCatalogConfigMapper.selectFileCatalogConfigByFileCatalogCode(fileCatalogCode);
    }

    /**
     * 查询文件目录配置列表
     * 
     * @param fileCatalogConfig 文件目录配置
     * @return 文件目录配置
     */
    @Override
    public List<FileCatalogConfig> selectFileCatalogConfigList(FileCatalogConfig fileCatalogConfig)
    {
        return fileCatalogConfigMapper.selectFileCatalogConfigList(fileCatalogConfig);
    }

    /**
     * 新增文件目录配置
     * 
     * @param fileCatalogConfig 文件目录配置
     * @return 结果
     */
    @Override
    public int insertFileCatalogConfig(FileCatalogConfig fileCatalogConfig)
    {
        fileCatalogConfig.setCreateTime(DateUtils.getNowDate());
        return fileCatalogConfigMapper.insertFileCatalogConfig(fileCatalogConfig);
    }

    /**
     * 修改文件目录配置
     * 
     * @param fileCatalogConfig 文件目录配置
     * @return 结果
     */
    @Override
    public int updateFileCatalogConfig(FileCatalogConfig fileCatalogConfig)
    {
        fileCatalogConfig.setUpdateTime(DateUtils.getNowDate());
        return fileCatalogConfigMapper.updateFileCatalogConfig(fileCatalogConfig);
    }

    /**
     * 批量删除文件目录配置
     * 
     * @param fileCatalogCodes 需要删除的文件目录配置主键
     * @return 结果
     */
    @Override
    public int deleteFileCatalogConfigByFileCatalogCodes(String[] fileCatalogCodes)
    {
        return fileCatalogConfigMapper.deleteFileCatalogConfigByFileCatalogCodes(fileCatalogCodes);
    }

    /**
     * 删除文件目录配置信息
     * 
     * @param fileCatalogCode 文件目录配置主键
     * @return 结果
     */
    @Override
    public int deleteFileCatalogConfigByFileCatalogCode(String fileCatalogCode)
    {
        return fileCatalogConfigMapper.deleteFileCatalogConfigByFileCatalogCode(fileCatalogCode);
    }
}
