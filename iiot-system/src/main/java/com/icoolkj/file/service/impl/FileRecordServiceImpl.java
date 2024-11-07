package com.icoolkj.file.service.impl;

import java.util.List;
import com.icoolkj.common.utils.DateUtils;
import com.icoolkj.common.utils.SecurityUtils;
import com.icoolkj.common.utils.uuid.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icoolkj.file.mapper.FileRecordMapper;
import com.icoolkj.file.domain.FileRecord;
import com.icoolkj.file.service.IFileRecordService;

/**
 * 文件记录Service业务层处理
 * 
 * @author:haiwei.yu01
 * @date 2023-03-18
 */
@Service
public class FileRecordServiceImpl implements IFileRecordService 
{
    @Autowired
    private FileRecordMapper fileRecordMapper;

    /**
     * 查询文件记录
     * 
     * @param fileRecordId 文件记录主键
     * @return 文件记录
     */
    @Override
    public FileRecord selectFileRecordByFileRecordId(String fileRecordId)
    {
        return fileRecordMapper.selectFileRecordByFileRecordId(fileRecordId);
    }

    /**
     * 查询文件记录列表
     * 
     * @param fileRecord 文件记录
     * @return 文件记录
     */
    @Override
    public List<FileRecord> selectFileRecordList(FileRecord fileRecord)
    {
        return fileRecordMapper.selectFileRecordList(fileRecord);
    }

    /**
     * 新增文件记录
     * 
     * @param fileRecord 文件记录
     * @return 结果
     */
    @Override
    public int insertFileRecord(FileRecord fileRecord)
    {
        fileRecord.setFileRecordId(IdWorker.nextId().toString());
        fileRecord.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserName());
        fileRecord.setCreateTime(DateUtils.getNowDate());
        return fileRecordMapper.insertFileRecord(fileRecord);
    }

    /**
     * 修改文件记录
     * 
     * @param fileRecord 文件记录
     * @return 结果
     */
    @Override
    public int updateFileRecord(FileRecord fileRecord)
    {
        fileRecord.setUpdateBy(SecurityUtils.getLoginUser().getUser().getUserName());
        fileRecord.setUpdateTime(DateUtils.getNowDate());
        return fileRecordMapper.updateFileRecord(fileRecord);
    }

}
