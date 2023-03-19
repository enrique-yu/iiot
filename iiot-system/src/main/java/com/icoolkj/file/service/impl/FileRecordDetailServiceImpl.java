package com.icoolkj.file.service.impl;

import java.util.List;
import com.icoolkj.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icoolkj.file.mapper.FileRecordDetailMapper;
import com.icoolkj.file.domain.FileRecordDetail;
import com.icoolkj.file.service.IFileRecordDetailService;

/**
 * 文件记录明细Service业务层处理
 * 
 * @author icoolkj
 * @date 2023-03-18
 */
@Service
public class FileRecordDetailServiceImpl implements IFileRecordDetailService 
{
    @Autowired
    private FileRecordDetailMapper fileRecordDetailMapper;

    /**
     * 查询文件记录明细
     * 
     * @param fileRecordDetailId 文件记录明细主键
     * @return 文件记录明细
     */
    @Override
    public FileRecordDetail selectFileRecordDetailByFileRecordDetailId(String fileRecordDetailId)
    {
        return fileRecordDetailMapper.selectFileRecordDetailByFileRecordDetailId(fileRecordDetailId);
    }

    /**
     * 查询文件记录明细列表
     * 
     * @param fileRecordDetail 文件记录明细
     * @return 文件记录明细
     */
    @Override
    public List<FileRecordDetail> selectFileRecordDetailList(FileRecordDetail fileRecordDetail)
    {
        return fileRecordDetailMapper.selectFileRecordDetailList(fileRecordDetail);
    }

    /**
     * 新增文件记录明细
     * 
     * @param fileRecordDetail 文件记录明细
     * @return 结果
     */
    @Override
    public int insertFileRecordDetail(FileRecordDetail fileRecordDetail)
    {
        fileRecordDetail.setCreateTime(DateUtils.getNowDate());
        return fileRecordDetailMapper.insertFileRecordDetail(fileRecordDetail);
    }

    /**
     * 修改文件记录明细
     * 
     * @param fileRecordDetail 文件记录明细
     * @return 结果
     */
    @Override
    public int updateFileRecordDetail(FileRecordDetail fileRecordDetail)
    {
        fileRecordDetail.setUpdateTime(DateUtils.getNowDate());
        return fileRecordDetailMapper.updateFileRecordDetail(fileRecordDetail);
    }

    /**
     * 批量删除文件记录明细
     * 
     * @param fileRecordDetailIds 需要删除的文件记录明细主键
     * @return 结果
     */
    @Override
    public int deleteFileRecordDetailByFileRecordDetailIds(String[] fileRecordDetailIds)
    {
        return fileRecordDetailMapper.deleteFileRecordDetailByFileRecordDetailIds(fileRecordDetailIds);
    }

    /**
     * 删除文件记录明细信息
     * 
     * @param fileRecordDetailId 文件记录明细主键
     * @return 结果
     */
    @Override
    public int deleteFileRecordDetailByFileRecordDetailId(String fileRecordDetailId)
    {
        return fileRecordDetailMapper.deleteFileRecordDetailByFileRecordDetailId(fileRecordDetailId);
    }
}
