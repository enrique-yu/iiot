package com.icoolkj.file.service.impl;

import java.util.List;
import com.icoolkj.common.utils.DateUtils;
import com.icoolkj.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icoolkj.file.mapper.FileConfigMapper;
import com.icoolkj.file.domain.FileConfig;
import com.icoolkj.file.service.IFileConfigService;

/**
 * 文件配置Service业务层处理
 * 
 * @author icoolkj
 * @date 2023-03-18
 */
@Service
public class FileConfigServiceImpl implements IFileConfigService 
{
    @Autowired
    private FileConfigMapper fileConfigMapper;

    /**
     * 查询文件配置
     * 
     * @param fileConfigCode 文件配置主键
     * @return 文件配置
     */
    @Override
    public FileConfig selectFileConfigByFileConfigCode(String fileConfigCode)
    {
        return fileConfigMapper.selectFileConfigByFileConfigCode(fileConfigCode);
    }

    /**
     * 查询文件配置列表
     * 
     * @param fileConfig 文件配置
     * @return 文件配置
     */
    @Override
    public List<FileConfig> selectFileConfigList(FileConfig fileConfig)
    {
        return fileConfigMapper.selectFileConfigList(fileConfig);
    }

    /**
     * 新增文件配置
     * 
     * @param fileConfig 文件配置
     * @return 结果
     */
    @Override
    public int insertFileConfig(FileConfig fileConfig)
    {
        fileConfig.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId());
        fileConfig.setCreateTime(DateUtils.getNowDate());
        return fileConfigMapper.insertFileConfig(fileConfig);
    }

    /**
     * 修改文件配置
     * 
     * @param fileConfig 文件配置
     * @return 结果
     */
    @Override
    public int updateFileConfig(FileConfig fileConfig)
    {
        fileConfig.setUpdateBy(SecurityUtils.getLoginUser().getUser().getUserId());
        fileConfig.setUpdateTime(DateUtils.getNowDate());
        return fileConfigMapper.updateFileConfig(fileConfig);
    }


}
