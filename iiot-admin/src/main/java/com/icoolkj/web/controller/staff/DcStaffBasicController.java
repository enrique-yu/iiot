package com.icoolkj.web.controller.staff;

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
import com.icoolkj.staff.domain.DcStaffBasic;
import com.icoolkj.staff.service.IDcStaffBasicService;
import com.icoolkj.common.utils.poi.ExcelUtil;
import com.icoolkj.common.core.page.TableDataInfo;

/**
 * 人员基本信息Controller
 * 
 * @author:haiwei.yu01
 * @date 2023-03-17
 */
@RestController
@RequestMapping("/staff/basic")
public class DcStaffBasicController extends BaseController
{
    @Autowired
    private IDcStaffBasicService dcStaffBasicService;

    /**
     * 查询人员基本信息列表
     */
    @PreAuthorize("@ss.hasPermi('staff:basic:list')")
    @GetMapping("/list")
    public TableDataInfo list(DcStaffBasic dcStaffBasic)
    {
        startPage();
        List<DcStaffBasic> list = dcStaffBasicService.selectDcStaffBasicList(dcStaffBasic);
        return getDataTable(list);
    }

    /**
     * 导出人员基本信息列表
     */
    @PreAuthorize("@ss.hasPermi('staff:basic:export')")
    @Log(title = "人员基本信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DcStaffBasic dcStaffBasic)
    {
        List<DcStaffBasic> list = dcStaffBasicService.selectDcStaffBasicList(dcStaffBasic);
        ExcelUtil<DcStaffBasic> util = new ExcelUtil<DcStaffBasic>(DcStaffBasic.class);
        util.exportExcel(response, list, "人员基本信息数据");
    }

    /**
     * 获取人员基本信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('staff:basic:query')")
    @GetMapping(value = "/{staffBasicId}")
    public AjaxResult getInfo(@PathVariable("staffBasicId") String staffBasicId)
    {
        return success(dcStaffBasicService.selectDcStaffBasicByStaffBasicId(staffBasicId));
    }

    /**
     * 新增人员基本信息
     */
    @PreAuthorize("@ss.hasPermi('staff:basic:add')")
    @Log(title = "人员基本信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DcStaffBasic dcStaffBasic)
    {
        return toAjax(dcStaffBasicService.insertDcStaffBasic(dcStaffBasic));
    }

    /**
     * 修改人员基本信息
     */
    @PreAuthorize("@ss.hasPermi('staff:basic:edit')")
    @Log(title = "人员基本信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DcStaffBasic dcStaffBasic)
    {
        return toAjax(dcStaffBasicService.updateDcStaffBasic(dcStaffBasic));
    }

    /**
     * 删除人员基本信息
     */
    @PreAuthorize("@ss.hasPermi('staff:basic:remove')")
    @Log(title = "人员基本信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{staffBasicIds}")
    public AjaxResult remove(@PathVariable String[] staffBasicIds)
    {
        return toAjax(dcStaffBasicService.deleteDcStaffBasicByStaffBasicIds(staffBasicIds));
    }
}
