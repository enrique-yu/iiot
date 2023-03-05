package com.icoolkj.web.controller.system;

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
import com.icoolkj.system.domain.SysArea;
import com.icoolkj.system.service.ISysAreaService;
import com.icoolkj.common.utils.poi.ExcelUtil;
import com.icoolkj.common.core.page.TableDataInfo;

/**
 * 系统区域配置Controller
 * 
 * @author ruoyi
 * @date 2023-03-05
 */
@RestController
@RequestMapping("/system/area")
public class SysAreaController extends BaseController
{
    @Autowired
    private ISysAreaService sysAreaService;

    /**
     * 查询系统区域配置列表
     */
    @PreAuthorize("@ss.hasPermi('system:area:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysArea sysArea)
    {
        startPage();
        List<SysArea> list = sysAreaService.selectSysAreaList(sysArea);
        return getDataTable(list);
    }

    /**
     * 导出系统区域配置列表
     */
    @PreAuthorize("@ss.hasPermi('system:area:export')")
    @Log(title = "系统区域配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysArea sysArea)
    {
        List<SysArea> list = sysAreaService.selectSysAreaList(sysArea);
        ExcelUtil<SysArea> util = new ExcelUtil<SysArea>(SysArea.class);
        util.exportExcel(response, list, "系统区域配置数据");
    }

    /**
     * 获取系统区域配置详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:area:query')")
    @GetMapping(value = "/{areaCode}")
    public AjaxResult getInfo(@PathVariable("areaCode") String areaCode)
    {
        return success(sysAreaService.selectSysAreaByAreaCode(areaCode));
    }

    /**
     * 新增系统区域配置
     */
    @PreAuthorize("@ss.hasPermi('system:area:add')")
    @Log(title = "系统区域配置", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysArea sysArea)
    {
        return toAjax(sysAreaService.insertSysArea(sysArea));
    }

    /**
     * 修改系统区域配置
     */
    @PreAuthorize("@ss.hasPermi('system:area:edit')")
    @Log(title = "系统区域配置", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysArea sysArea)
    {
        return toAjax(sysAreaService.updateSysArea(sysArea));
    }

    /**
     * 删除系统区域配置
     */
    @PreAuthorize("@ss.hasPermi('system:area:remove')")
    @Log(title = "系统区域配置", businessType = BusinessType.DELETE)
	@DeleteMapping("/{areaCodes}")
    public AjaxResult remove(@PathVariable String[] areaCodes)
    {
        return toAjax(sysAreaService.deleteSysAreaByAreaCodes(areaCodes));
    }
}
