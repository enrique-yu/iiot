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
import com.icoolkj.system.domain.SysDomainRoles;
import com.icoolkj.system.service.ISysDomainRolesService;
import com.icoolkj.common.utils.poi.ExcelUtil;
import com.icoolkj.common.core.page.TableDataInfo;

/**
 * 系统组织权限Controller
 * 
 * @author icoolkj
 * @date 2023-03-08
 */
@RestController
@RequestMapping("/system/droles")
public class SysDomainRolesController extends BaseController
{
    @Autowired
    private ISysDomainRolesService sysDomainRolesService;

    /**
     * 查询系统组织权限列表
     */
    @PreAuthorize("@ss.hasPermi('system:droles:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysDomainRoles sysDomainRoles)
    {
        startPage();
        List<SysDomainRoles> list = sysDomainRolesService.selectSysDomainRolesList(sysDomainRoles);
        return getDataTable(list);
    }

    /**
     * 导出系统组织权限列表
     */
    @PreAuthorize("@ss.hasPermi('system:droles:export')")
    @Log(title = "系统组织权限", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysDomainRoles sysDomainRoles)
    {
        List<SysDomainRoles> list = sysDomainRolesService.selectSysDomainRolesList(sysDomainRoles);
        ExcelUtil<SysDomainRoles> util = new ExcelUtil<SysDomainRoles>(SysDomainRoles.class);
        util.exportExcel(response, list, "系统组织权限数据");
    }

    /**
     * 获取系统组织权限详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:droles:query')")
    @GetMapping(value = "/{drolesId}")
    public AjaxResult getInfo(@PathVariable("drolesId") String drolesId)
    {
        return success(sysDomainRolesService.selectSysDomainRolesByDrolesId(drolesId));
    }

    /**
     * 新增系统组织权限
     */
    @PreAuthorize("@ss.hasPermi('system:droles:add')")
    @Log(title = "系统组织权限", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysDomainRoles sysDomainRoles)
    {
        return toAjax(sysDomainRolesService.insertSysDomainRoles(sysDomainRoles));
    }

    /**
     * 修改系统组织权限
     */
    @PreAuthorize("@ss.hasPermi('system:droles:edit')")
    @Log(title = "系统组织权限", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysDomainRoles sysDomainRoles)
    {
        return toAjax(sysDomainRolesService.updateSysDomainRoles(sysDomainRoles));
    }


}
