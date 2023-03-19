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
import com.icoolkj.file.domain.FileConfig;
import com.icoolkj.file.service.IFileConfigService;
import com.icoolkj.common.utils.poi.ExcelUtil;
import com.icoolkj.common.core.page.TableDataInfo;

/**
 * 文件配置Controller
 * 
 * @author icoolkj
 * @date 2023-03-18
 */
@RestController
@RequestMapping("/file/config")
public class FileConfigController extends BaseController
{
    @Autowired
    private IFileConfigService fileConfigService;

    /**
     * 查询文件配置列表
     */
    @PreAuthorize("@ss.hasPermi('file:config:list')")
    @GetMapping("/list")
    public TableDataInfo list(FileConfig fileConfig)
    {
        startPage();
        List<FileConfig> list = fileConfigService.selectFileConfigList(fileConfig);
        return getDataTable(list);
    }

    /**
     * 导出文件配置列表
     */
    @PreAuthorize("@ss.hasPermi('file:config:export')")
    @Log(title = "文件配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FileConfig fileConfig)
    {
        List<FileConfig> list = fileConfigService.selectFileConfigList(fileConfig);
        ExcelUtil<FileConfig> util = new ExcelUtil<FileConfig>(FileConfig.class);
        util.exportExcel(response, list, "文件配置数据");
    }

    /**
     * 获取文件配置详细信息
     */
    @PreAuthorize("@ss.hasPermi('file:config:query')")
    @GetMapping(value = "/{fileConfigCode}")
    public AjaxResult getInfo(@PathVariable("fileConfigCode") String fileConfigCode)
    {
        return success(fileConfigService.selectFileConfigByFileConfigCode(fileConfigCode));
    }

    /**
     * 新增文件配置
     */
    @PreAuthorize("@ss.hasPermi('file:config:add')")
    @Log(title = "文件配置", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FileConfig fileConfig)
    {
        return toAjax(fileConfigService.insertFileConfig(fileConfig));
    }

    /**
     * 修改文件配置
     */
    @PreAuthorize("@ss.hasPermi('file:config:edit')")
    @Log(title = "文件配置", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FileConfig fileConfig)
    {
        return toAjax(fileConfigService.updateFileConfig(fileConfig));
    }

    /**
     * 删除文件配置
     */
    @PreAuthorize("@ss.hasPermi('file:config:remove')")
    @Log(title = "文件配置", businessType = BusinessType.DELETE)
	@DeleteMapping("/{fileConfigCodes}")
    public AjaxResult remove(@PathVariable String[] fileConfigCodes)
    {
        return toAjax(fileConfigService.deleteFileConfigByFileConfigCodes(fileConfigCodes));
    }
}
