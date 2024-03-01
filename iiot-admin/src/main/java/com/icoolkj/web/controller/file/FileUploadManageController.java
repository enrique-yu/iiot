package com.icoolkj.web.controller.file;

import com.icoolkj.common.annotation.Log;
import com.icoolkj.common.core.controller.BaseController;
import com.icoolkj.common.core.domain.AjaxResult;
import com.icoolkj.common.core.page.TableDataInfo;
import com.icoolkj.common.enums.BusinessType;
import com.icoolkj.common.exception.file.FileException;
import com.icoolkj.common.utils.StringUtils;
import com.icoolkj.file.domain.FileUploadRequest;
import com.icoolkj.file.domain.FileUploadResponse;
import com.icoolkj.file.domain.UpdateFileNameRequest;
import com.icoolkj.file.service.IFileUploadRequestService;
import com.icoolkj.file.service.IFileUploadResponseService;
import com.icoolkj.file.service.impl.FileUploadManageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @author icoolkj
 * @version 1.0
 * @description FileManageController
 * @createDate 2023/09/10
 */
@RestController
@RequestMapping("/file/manage")
public class FileUploadManageController extends BaseController {

    @Autowired
    private FileUploadManageService fileUploadManageService;

    @Autowired
    private IFileUploadRequestService fileUploadRequestService;

    @Autowired
    private IFileUploadResponseService fileUploadResponseService;


    //@PreAuthorize("@ss.hasPermi('file:catalog:list')")
    @GetMapping("/getConfigDataList")
    public TableDataInfo getConfigDataList(@RequestParam("fileCatalogCode") String fileCatalogCode,
                                           @RequestParam(value = "businessRecordId", required = false) String businessRecordId)
    {
        List<FileUploadRequest> list = fileUploadRequestService.getConfigDataListByCataLogCode(fileCatalogCode);
        if (StringUtils.isNotEmpty(businessRecordId)) {
            for (FileUploadRequest conf : list) {
                List<FileUploadResponse> fileRelationRecords =
                        fileUploadResponseService.selectFileByRelationIdAndBizId(conf.getFileCatalogRelationId(), businessRecordId);
                conf.setFileUploadResponses(fileRelationRecords);
            }
        }
        return getDataTable(list);
    }

    //@PreAuthorize("@ss.hasPermi('file:record:add')")
    @Log(title = "文件上传", businessType = BusinessType.INSERT)
    @PostMapping("/upload")
    public AjaxResult upload(@RequestParam(value = "file") MultipartFile file,
                             @RequestParam(value = "fileConfRelId") String fileConfRelId,
                             @RequestParam(value = "fileDesc", required = false) String fileDesc){
        FileUploadResponse fileUploadResponse = null;
        try {
            fileUploadResponse = fileUploadManageService.upload(file, fileConfRelId, fileDesc);
        } catch (FileException e) {
            String errorCode = e.getCode();
            logger.error("文件上传异常，错误代码：{}, 错误内容：{}", errorCode, e.getMessage());
            return AjaxResult.error(e.getMessage());
        }
        return  AjaxResult.success(fileUploadResponse);
    }

    //@PreAuthorize("@ss.hasPermi('file:record:add')")
    @Log(title = "修改文件名称", businessType = BusinessType.UPDATE)
    @PostMapping("/updateFileName")
    public AjaxResult updateFileName(@RequestBody UpdateFileNameRequest request){
        return toAjax(fileUploadManageService.updateFileName(request));
    }


}
