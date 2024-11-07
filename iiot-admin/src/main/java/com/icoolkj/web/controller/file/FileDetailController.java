package com.icoolkj.web.controller.file;

import com.icoolkj.common.annotation.Log;
import com.icoolkj.common.core.controller.BaseController;
import com.icoolkj.common.core.domain.AjaxResult;
import com.icoolkj.common.core.page.TableDataInfo;
import com.icoolkj.common.enums.BusinessType;
import com.icoolkj.common.utils.poi.ExcelUtil;
import com.icoolkj.file.domain.FileDetail;
import com.icoolkj.file.service.IFileDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 文件明细Controller
 *
 * @author:haiwei.yu01
 * @date 2023-09-17
 */
@RestController
@RequestMapping("/file/detail")
public class FileDetailController extends BaseController
{
    @Autowired
    private IFileDetailService fileDetailService;

    /**
     * 查询文件明细列表
     */
    @PreAuthorize("@ss.hasPermi('file:detail:list')")
    @GetMapping("/list")
    public TableDataInfo list(FileDetail fileDetail)
    {
        startPage();
        List<FileDetail> list = fileDetailService.selectFileDetailList(fileDetail);
        return getDataTable(list);
    }

    /**
     * 导出文件明细列表
     */
    @PreAuthorize("@ss.hasPermi('file:detail:export')")
    @Log(title = "文件明细", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FileDetail fileDetail)
    {
        List<FileDetail> list = fileDetailService.selectFileDetailList(fileDetail);
        ExcelUtil<FileDetail> util = new ExcelUtil<FileDetail>(FileDetail.class);
        util.exportExcel(response, list, "文件明细数据");
    }

    /**
     * 获取文件明细详细信息
     */
    @PreAuthorize("@ss.hasPermi('file:detail:query')")
    @GetMapping(value = "/{fileDetailId}")
    public AjaxResult getInfo(@PathVariable("fileDetailId") String fileDetailId)
    {
        return success(fileDetailService.selectFileDetailByFileDetailId(fileDetailId));
    }

    /**
     * 新增文件明细
     */
    @PreAuthorize("@ss.hasPermi('file:detail:add')")
    @Log(title = "文件明细", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FileDetail fileDetail)
    {
        return toAjax(fileDetailService.insertFileDetail(fileDetail));
    }

    /**
     * 修改文件明细
     */
    @PreAuthorize("@ss.hasPermi('file:detail:edit')")
    @Log(title = "文件明细", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FileDetail fileDetail)
    {
        return toAjax(fileDetailService.updateFileDetail(fileDetail));
    }

    /**
     * 删除文件明细
     */
    @PreAuthorize("@ss.hasPermi('file:detail:remove')")
    @Log(title = "文件明细", businessType = BusinessType.DELETE)
	@DeleteMapping("/{fileDetailIds}")
    public AjaxResult remove(@PathVariable String[] fileDetailIds)
    {
        return toAjax(fileDetailService.deleteFileDetailByFileDetailIds(fileDetailIds));
    }
}
