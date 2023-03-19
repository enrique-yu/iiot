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
import com.icoolkj.file.domain.FileCatalogConfig;
import com.icoolkj.file.service.IFileCatalogConfigService;
import com.icoolkj.common.utils.poi.ExcelUtil;
import com.icoolkj.common.core.page.TableDataInfo;

/**
 * 文件目录配置Controller
 * 
 * @author icoolkj
 * @date 2023-03-18
 */
@RestController
@RequestMapping("/file/catalog")
public class FileCatalogConfigController extends BaseController
{
    @Autowired
    private IFileCatalogConfigService fileCatalogConfigService;

    /**
     * 查询文件目录配置列表
     */
    @PreAuthorize("@ss.hasPermi('file:catalog:list')")
    @GetMapping("/list")
    public TableDataInfo list(FileCatalogConfig fileCatalogConfig)
    {
        startPage();
        List<FileCatalogConfig> list = fileCatalogConfigService.selectFileCatalogConfigList(fileCatalogConfig);
        return getDataTable(list);
    }

    /**
     * 导出文件目录配置列表
     */
    @PreAuthorize("@ss.hasPermi('file:catalog:export')")
    @Log(title = "文件目录配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FileCatalogConfig fileCatalogConfig)
    {
        List<FileCatalogConfig> list = fileCatalogConfigService.selectFileCatalogConfigList(fileCatalogConfig);
        ExcelUtil<FileCatalogConfig> util = new ExcelUtil<FileCatalogConfig>(FileCatalogConfig.class);
        util.exportExcel(response, list, "文件目录配置数据");
    }

    /**
     * 获取文件目录配置详细信息
     */
    @PreAuthorize("@ss.hasPermi('file:catalog:query')")
    @GetMapping(value = "/{fileCatalogCode}")
    public AjaxResult getInfo(@PathVariable("fileCatalogCode") String fileCatalogCode)
    {
        return success(fileCatalogConfigService.selectFileCatalogConfigByFileCatalogCode(fileCatalogCode));
    }

    /**
     * 新增文件目录配置
     */
    @PreAuthorize("@ss.hasPermi('file:catalog:add')")
    @Log(title = "文件目录配置", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FileCatalogConfig fileCatalogConfig)
    {
        return toAjax(fileCatalogConfigService.insertFileCatalogConfig(fileCatalogConfig));
    }

    /**
     * 修改文件目录配置
     */
    @PreAuthorize("@ss.hasPermi('file:catalog:edit')")
    @Log(title = "文件目录配置", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FileCatalogConfig fileCatalogConfig)
    {
        return toAjax(fileCatalogConfigService.updateFileCatalogConfig(fileCatalogConfig));
    }

}
