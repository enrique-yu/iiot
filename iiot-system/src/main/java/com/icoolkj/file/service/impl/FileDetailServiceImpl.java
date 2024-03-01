package com.icoolkj.file.service.impl;

import java.util.List;

import com.icoolkj.common.utils.DateUtils;
import com.icoolkj.common.utils.SecurityUtils;
import com.icoolkj.common.utils.StringUtils;
import com.icoolkj.common.utils.uuid.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icoolkj.file.mapper.FileDetailMapper;
import com.icoolkj.file.domain.FileDetail;
import com.icoolkj.file.service.IFileDetailService;

/**
 * 文件明细Service业务层处理
 *
 * @author icoolkj
 * @date 2023-09-17
 */
@Service
public class FileDetailServiceImpl implements IFileDetailService
{
    @Autowired
    private FileDetailMapper fileDetailMapper;

    /**
     * 查询文件明细
     *
     * @param fileDetailId 文件明细主键
     * @return 文件明细
     */
    @Override
    public FileDetail selectFileDetailByFileDetailId(String fileDetailId)
    {
        return fileDetailMapper.selectFileDetailByFileDetailId(fileDetailId);
    }

    /**
     * 查询文件明细列表
     *
     * @param fileDetail 文件明细
     * @return 文件明细
     */
    @Override
    public List<FileDetail> selectFileDetailList(FileDetail fileDetail)
    {
        return fileDetailMapper.selectFileDetailList(fileDetail);
    }

    /**
     * 新增文件明细
     *
     * @param fileDetail 文件明细
     * @return 结果
     */
    @Override
    public int insertFileDetail(FileDetail fileDetail)
    {
        if (StringUtils.isEmpty(fileDetail.getFileDetailId())) { // 主键不存在，则生成
            fileDetail.setFileDetailId(IdWorker.nextId().toString());
        }
        if (StringUtils.isEmpty(fileDetail.getCreateBy())){  // 创建信息不存在，则生成
            fileDetail.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserName());
            fileDetail.setCreateTime(DateUtils.getNowDate());
        }
        return fileDetailMapper.insertFileDetail(fileDetail);
    }

    /**
     * 修改文件明细
     *
     * @param fileDetail 文件明细
     * @return 结果
     */
    @Override
    public int updateFileDetail(FileDetail fileDetail)
    {
        if (StringUtils.isEmpty(fileDetail.getUpdateBy())){  // 更新信息不存在，则生成
            fileDetail.setUpdateBy(SecurityUtils.getLoginUser().getUser().getUserName());
            fileDetail.setUpdateTime(DateUtils.getNowDate());
        }
        return fileDetailMapper.updateFileDetail(fileDetail);
    }

    /**
     * 批量删除文件明细
     *
     * @param fileDetailIds 需要删除的文件明细主键
     * @return 结果
     */
    @Override
    public int deleteFileDetailByFileDetailIds(String[] fileDetailIds)
    {
        return fileDetailMapper.deleteFileDetailByFileDetailIds(fileDetailIds);
    }

    /**
     * 删除文件明细信息
     *
     * @param fileDetailId 文件明细主键
     * @return 结果
     */
    @Override
    public int deleteFileDetailByFileDetailId(String fileDetailId)
    {
        return fileDetailMapper.deleteFileDetailByFileDetailId(fileDetailId);
    }
}
