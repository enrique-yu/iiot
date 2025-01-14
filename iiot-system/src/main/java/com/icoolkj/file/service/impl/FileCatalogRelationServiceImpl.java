package com.icoolkj.file.service.impl;

import java.util.List;
import com.icoolkj.common.utils.DateUtils;
import com.icoolkj.common.utils.SecurityUtils;
import com.icoolkj.common.utils.StringUtils;
import com.icoolkj.common.utils.uuid.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icoolkj.file.mapper.FileCatalogRelationMapper;
import com.icoolkj.file.domain.FileCatalogRelation;
import com.icoolkj.file.service.IFileCatalogRelationService;

/**
 * 文件与目录关系Service业务层处理
 * 
 * @author:haiwei.yu01
 * @date 2023-03-18
 */
@Service
public class FileCatalogRelationServiceImpl implements IFileCatalogRelationService 
{
    @Autowired
    private FileCatalogRelationMapper fileCatalogRelationMapper;

    /**
     * 查询文件与目录关系
     * 
     * @param fileCatalogRelationId 文件与目录关系主键
     * @return 文件与目录关系
     */
    @Override
    public FileCatalogRelation selectFileCatalogRelationByFileCatalogRelationId(String fileCatalogRelationId)
    {
        return fileCatalogRelationMapper.selectFileCatalogRelationByFileCatalogRelationId(fileCatalogRelationId);
    }

    /**
     * 查询文件与目录关系列表
     * 
     * @param fileCatalogRelation 文件与目录关系
     * @return 文件与目录关系
     */
    @Override
    public List<FileCatalogRelation> selectFileCatalogRelationList(FileCatalogRelation fileCatalogRelation)
    {
        return fileCatalogRelationMapper.selectFileCatalogRelationList(fileCatalogRelation);
    }

    /**
     * 新增文件与目录关系
     * 
     * @param fileCatalogRelation 文件与目录关系
     * @return 结果
     */
    @Override
    public int insertFileCatalogRelation(FileCatalogRelation fileCatalogRelation)
    {
        if (StringUtils.isEmpty(fileCatalogRelation.getFileCatalogRelationId())) { // 主键不存在，则生成
            fileCatalogRelation.setFileCatalogRelationId(IdWorker.nextId().toString());
        }
        if (StringUtils.isEmpty(fileCatalogRelation.getCreateBy())){  // 创建信息不存在，则生成
            fileCatalogRelation.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserName());
            fileCatalogRelation.setCreateTime(DateUtils.getNowDate());
        }
        return fileCatalogRelationMapper.insertFileCatalogRelation(fileCatalogRelation);
    }

    /**
     * 修改文件与目录关系
     * 
     * @param fileCatalogRelation 文件与目录关系
     * @return 结果
     */
    @Override
    public int updateFileCatalogRelation(FileCatalogRelation fileCatalogRelation)
    {
        if (StringUtils.isEmpty(fileCatalogRelation.getUpdateBy())){  // 更新信息不存在，则生成
            fileCatalogRelation.setUpdateBy(SecurityUtils.getLoginUser().getUser().getUserName());
            fileCatalogRelation.setUpdateTime(DateUtils.getNowDate());
        }
        return fileCatalogRelationMapper.updateFileCatalogRelation(fileCatalogRelation);
    }

    /**
     * 查询目录已配置的文件
     * @param fileCatalogRelation
     * @return
     */
    @Override
    public List<FileCatalogRelation> selectAllocatedFileList(FileCatalogRelation fileCatalogRelation){
        return fileCatalogRelationMapper.selectAllocatedFileList(fileCatalogRelation);
    }

    /**
     * 查询目录未配置的文件
     * @param fileCatalogRelation
     * @return
     */
    @Override
    public List<FileCatalogRelation> selectUnallocatedFileList(FileCatalogRelation fileCatalogRelation){
        return fileCatalogRelationMapper.selectUnallocatedFileList(fileCatalogRelation);
    }

}
