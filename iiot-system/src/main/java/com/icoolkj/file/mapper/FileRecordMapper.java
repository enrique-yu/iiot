package com.icoolkj.file.mapper;

import java.util.List;
import com.icoolkj.file.domain.FileRecord;

/**
 * 文件记录Mapper接口
 * 
 * @author:haiwei.yu01
 * @date 2023-03-18
 */
public interface FileRecordMapper 
{
    /**
     * 查询文件记录
     * 
     * @param fileRecordId 文件记录主键
     * @return 文件记录
     */
    public FileRecord selectFileRecordByFileRecordId(String fileRecordId);

    /**
     * 查询文件记录列表
     * 
     * @param fileRecord 文件记录
     * @return 文件记录集合
     */
    public List<FileRecord> selectFileRecordList(FileRecord fileRecord);

    /**
     * 新增文件记录
     * 
     * @param fileRecord 文件记录
     * @return 结果
     */
    public int insertFileRecord(FileRecord fileRecord);

    /**
     * 修改文件记录
     * 
     * @param fileRecord 文件记录
     * @return 结果
     */
    public int updateFileRecord(FileRecord fileRecord);

}
