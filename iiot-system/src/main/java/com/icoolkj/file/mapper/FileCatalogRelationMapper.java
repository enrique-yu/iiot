package com.icoolkj.file.mapper;

import com.icoolkj.file.domain.FileCatalogRelation;

import java.util.List;

/**
 * 文件与目录关系Mapper接口
 * 
 * @author icoolkj
 * @date 2023-03-18
 */
public interface FileCatalogRelationMapper 
{
    /**
     * 查询文件与目录关系
     * 
     * @param fileCatalogRelationId 文件与目录关系主键
     * @return 文件与目录关系
     */
    public FileCatalogRelation selectFileCatalogRelationByFileCatalogRelationId(String fileCatalogRelationId);

    /**
     * 查询文件与目录关系列表
     * 
     * @param fileCatalogRelation 文件与目录关系
     * @return 文件与目录关系集合
     */
    public List<FileCatalogRelation> selectFileCatalogRelationList(FileCatalogRelation fileCatalogRelation);

    /**
     * 新增文件与目录关系
     * 
     * @param fileCatalogRelation 文件与目录关系
     * @return 结果
     */
    public int insertFileCatalogRelation(FileCatalogRelation fileCatalogRelation);

    /**
     * 修改文件与目录关系
     * 
     * @param fileCatalogRelation 文件与目录关系
     * @return 结果
     */
    public int updateFileCatalogRelation(FileCatalogRelation fileCatalogRelation);

    /**
     * 查询目录已配置的文件
     * @param fileCatalogRelation
     * @return
     */
    public List<FileCatalogRelation> selectAllocatedFileList(FileCatalogRelation fileCatalogRelation);

    /**
     * 查询目录未配置的文件
     * @param fileCatalogRelation
     * @return
     */
    public List<FileCatalogRelation> selectUnallocatedFileList(FileCatalogRelation fileCatalogRelation);

}
