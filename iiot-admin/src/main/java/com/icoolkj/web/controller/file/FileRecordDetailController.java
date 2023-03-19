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
import com.icoolkj.file.domain.FileRecordDetail;
import com.icoolkj.file.service.IFileRecordDetailService;
import com.icoolkj.common.utils.poi.ExcelUtil;
import com.icoolkj.common.core.page.TableDataInfo;

/**
 * 文件记录明细Controller
 * 
 * @author icoolkj
 * @date 2023-03-18
 */
@RestController
@RequestMapping("/company/detail")
public class FileRecordDetailController extends BaseController
{
    @Autowired
    private IFileRecordDetailService fileRecordDetailService;

    /**
     * 查询文件记录明细列表
     */
    @PreAuthorize("@ss.hasPermi('company:detail:list')")
    @GetMapping("/list")
    public TableDataInfo list(FileRecordDetail fileRecordDetail)
    {
        startPage();
        List<FileRecordDetail> list = fileRecordDetailService.selectFileRecordDetailList(fileRecordDetail);
        return getDataTable(list);
    }

    /**
     * 导出文件记录明细列表
     */
    @PreAuthorize("@ss.hasPermi('company:detail:export')")
    @Log(title = "文件记录明细", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FileRecordDetail fileRecordDetail)
    {
        List<FileRecordDetail> list = fileRecordDetailService.selectFileRecordDetailList(fileRecordDetail);
        ExcelUtil<FileRecordDetail> util = new ExcelUtil<FileRecordDetail>(FileRecordDetail.class);
        util.exportExcel(response, list, "文件记录明细数据");
    }

    /**
     * 获取文件记录明细详细信息
     */
    @PreAuthorize("@ss.hasPermi('company:detail:query')")
    @GetMapping(value = "/{fileRecordDetailId}")
    public AjaxResult getInfo(@PathVariable("fileRecordDetailId") String fileRecordDetailId)
    {
        return success(fileRecordDetailService.selectFileRecordDetailByFileRecordDetailId(fileRecordDetailId));
    }

    /**
     * 新增文件记录明细
     */
    @PreAuthorize("@ss.hasPermi('company:detail:add')")
    @Log(title = "文件记录明细", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FileRecordDetail fileRecordDetail)
    {
        return toAjax(fileRecordDetailService.insertFileRecordDetail(fileRecordDetail));
    }

    /**
     * 修改文件记录明细
     */
    @PreAuthorize("@ss.hasPermi('company:detail:edit')")
    @Log(title = "文件记录明细", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FileRecordDetail fileRecordDetail)
    {
        return toAjax(fileRecordDetailService.updateFileRecordDetail(fileRecordDetail));
    }

    /**
     * 删除文件记录明细
     */
    @PreAuthorize("@ss.hasPermi('company:detail:remove')")
    @Log(title = "文件记录明细", businessType = BusinessType.DELETE)
	@DeleteMapping("/{fileRecordDetailIds}")
    public AjaxResult remove(@PathVariable String[] fileRecordDetailIds)
    {
        return toAjax(fileRecordDetailService.deleteFileRecordDetailByFileRecordDetailIds(fileRecordDetailIds));
    }
}
