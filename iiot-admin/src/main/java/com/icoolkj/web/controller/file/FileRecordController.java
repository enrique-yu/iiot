package com.icoolkj.web.controller.file;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.icoolkj.common.annotation.Log;
import com.icoolkj.common.core.controller.BaseController;
import com.icoolkj.common.core.domain.AjaxResult;
import com.icoolkj.common.enums.BusinessType;
import com.icoolkj.file.domain.FileRecord;
import com.icoolkj.file.service.IFileRecordService;
import com.icoolkj.common.utils.poi.ExcelUtil;
import com.icoolkj.common.core.page.TableDataInfo;

/**
 * 文件记录Controller
 * 
 * @author icoolkj
 * @date 2023-03-18
 */
@RestController
@RequestMapping("/file/record")
public class FileRecordController extends BaseController
{
    @Autowired
    private IFileRecordService fileRecordService;

    /**
     * 查询文件记录列表
     */
    @PreAuthorize("@ss.hasPermi('file:record:list')")
    @GetMapping("/list")
    public TableDataInfo list(FileRecord fileRecord)
    {
        startPage();
        List<FileRecord> list = fileRecordService.selectFileRecordList(fileRecord);
        return getDataTable(list);
    }

    /**
     * 导出文件记录列表
     */
    @PreAuthorize("@ss.hasPermi('file:record:export')")
    @Log(title = "文件记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FileRecord fileRecord)
    {
        List<FileRecord> list = fileRecordService.selectFileRecordList(fileRecord);
        ExcelUtil<FileRecord> util = new ExcelUtil<FileRecord>(FileRecord.class);
        util.exportExcel(response, list, "文件记录数据");
    }

    /**
     * 获取文件记录详细信息
     */
    @PreAuthorize("@ss.hasPermi('file:record:query')")
    @GetMapping(value = "/{fileRecordId}")
    public AjaxResult getInfo(@PathVariable("fileRecordId") String fileRecordId)
    {
        return success(fileRecordService.selectFileRecordByFileRecordId(fileRecordId));
    }

    /**
     * 新增文件记录
     */
    @PreAuthorize("@ss.hasPermi('file:record:add')")
    @Log(title = "文件记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FileRecord fileRecord)
    {
        return toAjax(fileRecordService.insertFileRecord(fileRecord));
    }

    /**
     * 修改文件记录
     */
    @PreAuthorize("@ss.hasPermi('file:record:edit')")
    @Log(title = "文件记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FileRecord fileRecord)
    {
        return toAjax(fileRecordService.updateFileRecord(fileRecord));
    }

    /**
     * 删除文件记录
     */
    @PreAuthorize("@ss.hasPermi('file:record:remove')")
    @Log(title = "文件记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{fileRecordIds}")
    public AjaxResult remove(@PathVariable String[] fileRecordIds)
    {
        return toAjax(fileRecordService.deleteFileRecordByFileRecordIds(fileRecordIds));
    }
}
