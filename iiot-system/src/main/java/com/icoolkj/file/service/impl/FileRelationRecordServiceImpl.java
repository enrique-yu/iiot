package com.icoolkj.file.service.impl;

import java.util.List;

import com.icoolkj.common.utils.DateUtils;
import com.icoolkj.common.utils.SecurityUtils;
import com.icoolkj.common.utils.StringUtils;
import com.icoolkj.common.utils.uuid.IdWorker;
import com.icoolkj.file.domain.FileUploadResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icoolkj.file.mapper.FileRelationRecordMapper;
import com.icoolkj.file.domain.FileRelationRecord;
import com.icoolkj.file.service.IFileRelationRecordService;

/**
 * 文件业务记录Service业务层处理
 *
 * @author:haiwei.yu01
 * @date 2023-09-17
 */
@Service
public class FileRelationRecordServiceImpl implements IFileRelationRecordService
{
    @Autowired
    private FileRelationRecordMapper fileRelationRecordMapper;

    /**
     * 查询文件业务记录
     *
     * @param fileRelationRecordId 文件业务记录主键
     * @return 文件业务记录
     */
    @Override
    public FileRelationRecord selectFileRelationRecordByFileRelationRecordId(String fileRelationRecordId)
    {
        return fileRelationRecordMapper.selectFileRelationRecordByFileRelationRecordId(fileRelationRecordId);
    }

    /**
     * 查询文件业务记录列表
     *
     * @param fileRelationRecord 文件业务记录
     * @return 文件业务记录
     */
    @Override
    public List<FileRelationRecord> selectFileRelationRecordList(FileRelationRecord fileRelationRecord)
    {
        return fileRelationRecordMapper.selectFileRelationRecordList(fileRelationRecord);
    }

    /**
     * 新增文件业务记录
     *
     * @param fileRelationRecord 文件业务记录
     * @return 结果
     */
    @Override
    public int insertFileRelationRecord(FileRelationRecord fileRelationRecord)
    {
        if (StringUtils.isEmpty(fileRelationRecord.getFileRelationRecordId())) { // 主键不存在，则生成
            fileRelationRecord.setFileRelationRecordId(IdWorker.nextId().toString());
        }
        if (StringUtils.isEmpty(fileRelationRecord.getCreateBy())){  // 创建信息不存在，则生成
            fileRelationRecord.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserName());
            fileRelationRecord.setCreateTime(DateUtils.getNowDate());
        }
        return fileRelationRecordMapper.insertFileRelationRecord(fileRelationRecord);
    }

    @Override
    public int updateFileRelRecByBizId(FileRelationRecord fileRelationRecord)
    {
        if (StringUtils.isEmpty(fileRelationRecord.getUpdateBy())){  // 更新信息不存在，则生成
            fileRelationRecord.setUpdateBy(SecurityUtils.getLoginUser().getUser().getUserName());
            fileRelationRecord.setUpdateTime(DateUtils.getNowDate());
        }
        return fileRelationRecordMapper.updateFileRelRecByBizId(fileRelationRecord);
    }

    public int updateFileRelRecByBizIdAndFileId(FileRelationRecord fileRelationRecord){
        if (StringUtils.isEmpty(fileRelationRecord.getUpdateBy())){  // 更新信息不存在，则生成
            fileRelationRecord.setUpdateBy(SecurityUtils.getLoginUser().getUser().getUserName());
            fileRelationRecord.setUpdateTime(DateUtils.getNowDate());
        }
        return fileRelationRecordMapper.updateFileRelRecByBizIdAndFileId(fileRelationRecord);
    }

}
