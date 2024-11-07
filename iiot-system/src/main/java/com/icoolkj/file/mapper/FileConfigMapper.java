package com.icoolkj.file.mapper;

import java.util.List;
import com.icoolkj.file.domain.FileConfig;

/**
 * 文件配置Mapper接口
 * 
 * @author:haiwei.yu01
 * @date 2023-03-18
 */
public interface FileConfigMapper 
{
    /**
     * 查询文件配置
     * 
     * @param fileConfigCode 文件配置主键
     * @return 文件配置
     */
    public FileConfig selectFileConfigByFileConfigCode(String fileConfigCode);

    /**
     * 查询文件配置列表
     * 
     * @param fileConfig 文件配置
     * @return 文件配置集合
     */
    public List<FileConfig> selectFileConfigList(FileConfig fileConfig);

    /**
     * 新增文件配置
     * 
     * @param fileConfig 文件配置
     * @return 结果
     */
    public int insertFileConfig(FileConfig fileConfig);

    /**
     * 修改文件配置
     * 
     * @param fileConfig 文件配置
     * @return 结果
     */
    public int updateFileConfig(FileConfig fileConfig);

}
