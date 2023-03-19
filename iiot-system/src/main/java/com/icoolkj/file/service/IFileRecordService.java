package com.icoolkj.file.service;

import java.util.List;
import com.icoolkj.file.domain.FileRecord;

/**
 * 文件记录Service接口
 * 
 * @author icoolkj
 * @date 2023-03-18
 */
public interface IFileRecordService 
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

    /**
     * 批量删除文件记录
     * 
     * @param fileRecordIds 需要删除的文件记录主键集合
     * @return 结果
     */
    public int deleteFileRecordByFileRecordIds(String[] fileRecordIds);

    /**
     * 删除文件记录信息
     * 
     * @param fileRecordId 文件记录主键
     * @return 结果
     */
    public int deleteFileRecordByFileRecordId(String fileRecordId);
}
