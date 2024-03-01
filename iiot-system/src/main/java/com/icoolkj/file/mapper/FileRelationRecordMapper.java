package com.icoolkj.file.mapper;

import com.icoolkj.file.domain.FileRelationRecord;

import java.util.List;

/**
 * 文件业务记录Mapper接口
 *
 * @author icoolkj
 * @date 2023-09-17
 */
public interface FileRelationRecordMapper
{
    /**
     * 查询文件业务记录
     *
     * @param fileRelationRecordId 文件业务记录主键
     * @return 文件业务记录
     */
    public FileRelationRecord selectFileRelationRecordByFileRelationRecordId(String fileRelationRecordId);

    /**
     * 查询文件业务记录列表
     *
     * @param fileRelationRecord 文件业务记录
     * @return 文件业务记录集合
     */
    public List<FileRelationRecord> selectFileRelationRecordList(FileRelationRecord fileRelationRecord);

    /**
     * 新增文件业务记录
     *
     * @param fileRelationRecord 文件业务记录
     * @return 结果
     */
    public int insertFileRelationRecord(FileRelationRecord fileRelationRecord);

    public int updateFileRelRecByBizId(FileRelationRecord fileRelationRecord);

    public int updateFileRelRecByBizIdAndFileId(FileRelationRecord fileRelationRecord);
}
