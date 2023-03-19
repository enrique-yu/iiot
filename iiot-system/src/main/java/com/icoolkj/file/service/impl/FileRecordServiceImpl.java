package com.icoolkj.file.service.impl;

import java.util.List;
import com.icoolkj.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icoolkj.file.mapper.FileRecordMapper;
import com.icoolkj.file.domain.FileRecord;
import com.icoolkj.file.service.IFileRecordService;

/**
 * 文件记录Service业务层处理
 * 
 * @author icoolkj
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
        fileRecord.setUpdateTime(DateUtils.getNowDate());
        return fileRecordMapper.updateFileRecord(fileRecord);
    }

    /**
     * 批量删除文件记录
     * 
     * @param fileRecordIds 需要删除的文件记录主键
     * @return 结果
     */
    @Override
    public int deleteFileRecordByFileRecordIds(String[] fileRecordIds)
    {
        return fileRecordMapper.deleteFileRecordByFileRecordIds(fileRecordIds);
    }

    /**
     * 删除文件记录信息
     * 
     * @param fileRecordId 文件记录主键
     * @return 结果
     */
    @Override
    public int deleteFileRecordByFileRecordId(String fileRecordId)
    {
        return fileRecordMapper.deleteFileRecordByFileRecordId(fileRecordId);
    }
}
