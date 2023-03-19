package com.icoolkj.file.service;

import java.util.List;
import com.icoolkj.file.domain.FileCatalogConfig;

/**
 * 文件目录配置Service接口
 * 
 * @author icoolkj
 * @date 2023-03-18
 */
public interface IFileCatalogConfigService 
{
    /**
     * 查询文件目录配置
     * 
     * @param fileCatalogCode 文件目录配置主键
     * @return 文件目录配置
     */
    public FileCatalogConfig selectFileCatalogConfigByFileCatalogCode(String fileCatalogCode);

    /**
     * 查询文件目录配置列表
     * 
     * @param fileCatalogConfig 文件目录配置
     * @return 文件目录配置集合
     */
    public List<FileCatalogConfig> selectFileCatalogConfigList(FileCatalogConfig fileCatalogConfig);

    /**
     * 新增文件目录配置
     * 
     * @param fileCatalogConfig 文件目录配置
     * @return 结果
     */
    public int insertFileCatalogConfig(FileCatalogConfig fileCatalogConfig);

    /**
     * 修改文件目录配置
     * 
     * @param fileCatalogConfig 文件目录配置
     * @return 结果
     */
    public int updateFileCatalogConfig(FileCatalogConfig fileCatalogConfig);

}
