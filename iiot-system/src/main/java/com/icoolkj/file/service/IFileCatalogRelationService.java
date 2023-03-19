package com.icoolkj.file.service;

import java.util.List;
import com.icoolkj.file.domain.FileCatalogRelation;

/**
 * 文件与目录关系Service接口
 * 
 * @author icoolkj
 * @date 2023-03-18
 */
public interface IFileCatalogRelationService 
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
     * 批量删除文件与目录关系
     * 
     * @param fileCatalogRelationIds 需要删除的文件与目录关系主键集合
     * @return 结果
     */
    public int deleteFileCatalogRelationByFileCatalogRelationIds(String[] fileCatalogRelationIds);

    /**
     * 删除文件与目录关系信息
     * 
     * @param fileCatalogRelationId 文件与目录关系主键
     * @return 结果
     */
    public int deleteFileCatalogRelationByFileCatalogRelationId(String fileCatalogRelationId);
}
