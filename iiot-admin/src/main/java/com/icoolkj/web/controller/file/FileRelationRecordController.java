package com.icoolkj.web.controller.file;

import com.icoolkj.common.annotation.Log;
import com.icoolkj.common.core.controller.BaseController;
import com.icoolkj.common.core.domain.AjaxResult;
import com.icoolkj.common.core.page.TableDataInfo;
import com.icoolkj.common.enums.BusinessType;
import com.icoolkj.common.utils.poi.ExcelUtil;
import com.icoolkj.file.domain.FileRelationRecord;
import com.icoolkj.file.service.IFileRelationRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 文件业务记录Controller
 *
 * @author icoolkj
 * @date 2023-09-17
 */
@RestController
@RequestMapping("/file/record")
public class FileRelationRecordController extends BaseController
{
    @Autowired
    private IFileRelationRecordService fileRelationRecordService;

    /**
     * 查询文件业务记录列表
     */
    @PreAuthorize("@ss.hasPermi('file:record:list')")
    @GetMapping("/list")
    public TableDataInfo list(FileRelationRecord fileRelationRecord)
    {
        startPage();
        List<FileRelationRecord> list = fileRelationRecordService.selectFileRelationRecordList(fileRelationRecord);
        return getDataTable(list);
    }

    /**
     * 导出文件业务记录列表
     */
    @PreAuthorize("@ss.hasPermi('file:record:export')")
    @Log(title = "文件业务记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FileRelationRecord fileRelationRecord)
    {
        List<FileRelationRecord> list = fileRelationRecordService.selectFileRelationRecordList(fileRelationRecord);
        ExcelUtil<FileRelationRecord> util = new ExcelUtil<FileRelationRecord>(FileRelationRecord.class);
        util.exportExcel(response, list, "文件业务记录数据");
    }

    /**
     * 获取文件业务记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('file:record:query')")
    @GetMapping(value = "/{fileRelationRecordId}")
    public AjaxResult getInfo(@PathVariable("fileRelationRecordId") String fileRelationRecordId)
    {
        return success(fileRelationRecordService.selectFileRelationRecordByFileRelationRecordId(fileRelationRecordId));
    }

}
