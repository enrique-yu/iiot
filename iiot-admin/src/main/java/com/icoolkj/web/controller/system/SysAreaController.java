package com.icoolkj.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.icoolkj.common.core.domain.entity.SysDept;
import com.icoolkj.common.utils.StringUtils;
import org.apache.commons.lang3.ArrayUtils;
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
    public AjaxResult list(SysArea sysArea)
    {
        startPage();
        List<SysArea> areas = sysAreaService.selectSysAreaList(sysArea);
        return success(areas);
    }

    /**
     * 查询部门列表（排除节点）
     */
    @PreAuthorize("@ss.hasPermi('system:area:list')")
    @GetMapping("/list/exclude/{areaId}")
    public AjaxResult excludeChild(@PathVariable(value = "areaId", required = false) String areaId)
    {
        List<SysArea> areas = sysAreaService.selectSysAreaList(new SysArea());
        areas.removeIf(d -> areaId.equals(d.getAreaId()));
        return success(areas);
    }

    /**
     * 获取系统区域配置详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:area:query')")
    @GetMapping(value = "/{areaId}")
    public AjaxResult getInfo(@PathVariable("areaId") String areaId)
    {
        return success(sysAreaService.selectSysAreaByAreaId(areaId));
    }

    /**
     * 新增系统区域配置
     */
    @PreAuthorize("@ss.hasPermi('system:area:add')")
    @Log(title = "系统区域配置", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysArea sysArea)
    {
        if (!sysAreaService.checkAreaIdUnique(sysArea))
        {
            return error("新增区域编码【" + sysArea.getAreaId() + "】失败，区域编码已存在");
        }
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


}
