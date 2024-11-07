package com.icoolkj.file.service.impl;

import java.util.List;
import com.icoolkj.common.utils.DateUtils;
import com.icoolkj.common.utils.SecurityUtils;
import com.icoolkj.common.utils.uuid.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icoolkj.file.mapper.FileRecordDetailMapper;
import com.icoolkj.file.domain.FileRecordDetail;
import com.icoolkj.file.service.IFileRecordDetailService;

/**
 * 文件记录明细Service业务层处理
 * 
 * @author:haiwei.yu01
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
        fileRecordDetail.setFileRecordDetailId(IdWorker.nextId().toString());
        fileRecordDetail.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserName());
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
        fileRecordDetail.setUpdateBy(SecurityUtils.getLoginUser().getUser().getUserName());
        fileRecordDetail.setUpdateTime(DateUtils.getNowDate());
        return fileRecordDetailMapper.updateFileRecordDetail(fileRecordDetail);
    }

}
