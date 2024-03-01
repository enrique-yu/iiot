package com.icoolkj.file.service;

import com.icoolkj.file.domain.FileDetail;

import java.util.List;

/**
 * 文件明细Service接口
 *
 * @author icoolkj
 * @date 2023-09-17
 */
public interface IFileDetailService
{
    /**
     * 查询文件明细
     *
     * @param fileDetailId 文件明细主键
     * @return 文件明细
     */
    public FileDetail selectFileDetailByFileDetailId(String fileDetailId);

    /**
     * 查询文件明细列表
     *
     * @param fileDetail 文件明细
     * @return 文件明细集合
     */
    public List<FileDetail> selectFileDetailList(FileDetail fileDetail);

    /**
     * 新增文件明细
     *
     * @param fileDetail 文件明细
     * @return 结果
     */
    public int insertFileDetail(FileDetail fileDetail);

    /**
     * 修改文件明细
     *
     * @param fileDetail 文件明细
     * @return 结果
     */
    public int updateFileDetail(FileDetail fileDetail);

    /**
     * 批量删除文件明细
     *
     * @param fileDetailIds 需要删除的文件明细主键集合
     * @return 结果
     */
    public int deleteFileDetailByFileDetailIds(String[] fileDetailIds);

    /**
     * 删除文件明细信息
     *
     * @param fileDetailId 文件明细主键
     * @return 结果
     */
    public int deleteFileDetailByFileDetailId(String fileDetailId);

}
