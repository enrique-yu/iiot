package com.icoolkj.file.mapper;

import java.util.List;
import com.icoolkj.file.domain.FileRecordDetail;

/**
 * 文件记录明细Mapper接口
 * 
 * @author icoolkj
 * @date 2023-03-18
 */
public interface FileRecordDetailMapper 
{
    /**
     * 查询文件记录明细
     * 
     * @param fileRecordDetailId 文件记录明细主键
     * @return 文件记录明细
     */
    public FileRecordDetail selectFileRecordDetailByFileRecordDetailId(String fileRecordDetailId);

    /**
     * 查询文件记录明细列表
     * 
     * @param fileRecordDetail 文件记录明细
     * @return 文件记录明细集合
     */
    public List<FileRecordDetail> selectFileRecordDetailList(FileRecordDetail fileRecordDetail);

    /**
     * 新增文件记录明细
     * 
     * @param fileRecordDetail 文件记录明细
     * @return 结果
     */
    public int insertFileRecordDetail(FileRecordDetail fileRecordDetail);

    /**
     * 修改文件记录明细
     * 
     * @param fileRecordDetail 文件记录明细
     * @return 结果
     */
    public int updateFileRecordDetail(FileRecordDetail fileRecordDetail);

    /**
     * 删除文件记录明细
     * 
     * @param fileRecordDetailId 文件记录明细主键
     * @return 结果
     */
    public int deleteFileRecordDetailByFileRecordDetailId(String fileRecordDetailId);

    /**
     * 批量删除文件记录明细
     * 
     * @param fileRecordDetailIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFileRecordDetailByFileRecordDetailIds(String[] fileRecordDetailIds);
}