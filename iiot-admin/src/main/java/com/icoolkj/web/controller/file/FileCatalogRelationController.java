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
import com.icoolkj.file.domain.FileCatalogRelation;
import com.icoolkj.file.service.IFileCatalogRelationService;
import com.icoolkj.common.utils.poi.ExcelUtil;
import com.icoolkj.common.core.page.TableDataInfo;

/**
 * 文件与目录关系Controller
 * 
 * @author icoolkj
 * @date 2023-03-18
 */
@RestController
@RequestMapping("/file/relation")
public class FileCatalogRelationController extends BaseController
{
    @Autowired
    private IFileCatalogRelationService fileCatalogRelationService;

    /**
     * 查询文件与目录关系列表
     */
    @PreAuthorize("@ss.hasPermi('file:relation:list')")
    @GetMapping("/list")
    public TableDataInfo list(FileCatalogRelation fileCatalogRelation)
    {
        startPage();
        List<FileCatalogRelation> list = fileCatalogRelationService.selectFileCatalogRelationList(fileCatalogRelation);
        return getDataTable(list);
    }

    /**
     * 导出文件与目录关系列表
     */
    @PreAuthorize("@ss.hasPermi('file:relation:export')")
    @Log(title = "文件与目录关系", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FileCatalogRelation fileCatalogRelation)
    {
        List<FileCatalogRelation> list = fileCatalogRelationService.selectFileCatalogRelationList(fileCatalogRelation);
        ExcelUtil<FileCatalogRelation> util = new ExcelUtil<FileCatalogRelation>(FileCatalogRelation.class);
        util.exportExcel(response, list, "文件与目录关系数据");
    }

    /**
     * 获取文件与目录关系详细信息
     */
    @PreAuthorize("@ss.hasPermi('file:relation:query')")
    @GetMapping(value = "/{fileCatalogRelationId}")
    public AjaxResult getInfo(@PathVariable("fileCatalogRelationId") String fileCatalogRelationId)
    {
        return success(fileCatalogRelationService.selectFileCatalogRelationByFileCatalogRelationId(fileCatalogRelationId));
    }

    /**
     * 新增文件与目录关系
     */
    @PreAuthorize("@ss.hasPermi('file:relation:add')")
    @Log(title = "文件与目录关系", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FileCatalogRelation fileCatalogRelation)
    {
        return toAjax(fileCatalogRelationService.insertFileCatalogRelation(fileCatalogRelation));
    }

    /**
     * 修改文件与目录关系
     */
    @PreAuthorize("@ss.hasPermi('file:relation:edit')")
    @Log(title = "文件与目录关系", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FileCatalogRelation fileCatalogRelation)
    {
        return toAjax(fileCatalogRelationService.updateFileCatalogRelation(fileCatalogRelation));
    }

}
