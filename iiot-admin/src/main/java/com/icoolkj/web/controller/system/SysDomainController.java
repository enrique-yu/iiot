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
import com.icoolkj.system.domain.SysDomain;
import com.icoolkj.system.service.ISysDomainService;
import com.icoolkj.common.utils.poi.ExcelUtil;
import com.icoolkj.common.core.page.TableDataInfo;

/**
 * 系统组织账户Controller
 * 
 * @author icoolkj
 * @date 2023-03-08
 */
@RestController
@RequestMapping("/system/domain")
public class SysDomainController extends BaseController
{
    @Autowired
    private ISysDomainService sysDomainService;

    /**
     * 查询系统组织账户列表
     */
    @PreAuthorize("@ss.hasPermi('system:domain:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysDomain sysDomain)
    {
        startPage();
        List<SysDomain> list = sysDomainService.selectSysDomainList(sysDomain);
        return getDataTable(list);
    }

    /**
     * 导出系统组织账户列表
     */
    @PreAuthorize("@ss.hasPermi('system:domain:export')")
    @Log(title = "系统组织账户", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysDomain sysDomain)
    {
        List<SysDomain> list = sysDomainService.selectSysDomainList(sysDomain);
        ExcelUtil<SysDomain> util = new ExcelUtil<SysDomain>(SysDomain.class);
        util.exportExcel(response, list, "系统组织账户数据");
    }

    /**
     * 获取系统组织账户详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:domain:query')")
    @GetMapping(value = "/{domainId}")
    public AjaxResult getInfo(@PathVariable("domainId") String domainId)
    {
        return success(sysDomainService.selectSysDomainByDomainId(domainId));
    }

    /**
     * 新增系统组织账户
     */
    @PreAuthorize("@ss.hasPermi('system:domain:add')")
    @Log(title = "系统组织账户", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysDomain sysDomain)
    {
        return toAjax(sysDomainService.insertSysDomain(sysDomain));
    }

    /**
     * 修改系统组织账户
     */
    @PreAuthorize("@ss.hasPermi('system:domain:edit')")
    @Log(title = "系统组织账户", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysDomain sysDomain)
    {
        return toAjax(sysDomainService.updateSysDomain(sysDomain));
    }

    /**
     * 删除系统组织账户
     */
    @PreAuthorize("@ss.hasPermi('system:domain:remove')")
    @Log(title = "系统组织账户", businessType = BusinessType.DELETE)
	@DeleteMapping("/{domainIds}")
    public AjaxResult remove(@PathVariable String[] domainIds)
    {
        return toAjax(sysDomainService.deleteSysDomainByDomainIds(domainIds));
    }
}
