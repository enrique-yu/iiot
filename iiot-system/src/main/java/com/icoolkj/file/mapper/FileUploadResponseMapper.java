package com.icoolkj.file.mapper;

import com.icoolkj.file.domain.FileUploadResponse;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author icoolkj
 * @version 1.0
 * @description FileUploadResponseMapper
 * @createDate 2023/09/29
 */
public interface FileUploadResponseMapper
{
    public List<FileUploadResponse> selectFileByRelationIdAndBizId(@Param("fileCatalogRelationId") String fileCatalogRelationId,
                                                                   @Param("businessRecordId") String businessRecordId);

}
