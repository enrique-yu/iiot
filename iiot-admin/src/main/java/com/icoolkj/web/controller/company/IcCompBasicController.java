package com.icoolkj.web.controller.company;

import com.icoolkj.common.annotation.Log;
import com.icoolkj.common.core.controller.BaseController;
import com.icoolkj.common.core.domain.AjaxResult;
import com.icoolkj.common.core.page.TableDataInfo;
import com.icoolkj.common.enums.BusinessType;
import com.icoolkj.common.utils.CreditCodeValidator;
import com.icoolkj.common.utils.poi.ExcelUtil;
import com.icoolkj.company.domain.IcCompBasic;
import com.icoolkj.company.service.IIcCompBasicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 企业基本信息Controller
 * 
 * @author icoolkj
 * @date 2023-03-05
 */
@RestController
@RequestMapping("/company/basic")
public class IcCompBasicController extends BaseController
{
    @Autowired
    private IIcCompBasicService icCompBasicService;

    /**
     * 查询企业基本信息列表
     */
    @PreAuthorize("@ss.hasPermi('company:basic:list')")
    @GetMapping("/list")
    public TableDataInfo list(IcCompBasic icCompBasic)
    {
        startPage();
        List<IcCompBasic> list = icCompBasicService.selectIcCompBasicList(icCompBasic);
        return getDataTable(list);
    }

    /**
     * 导出企业基本信息列表
     */
    @PreAuthorize("@ss.hasPermi('company:basic:export')")
    @Log(title = "企业基本信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, IcCompBasic icCompBasic)
    {
        List<IcCompBasic> list = icCompBasicService.selectIcCompBasicList(icCompBasic);
        ExcelUtil<IcCompBasic> util = new ExcelUtil<IcCompBasic>(IcCompBasic.class);
        util.exportExcel(response, list, "企业基本信息数据");
    }

    /**
     * 获取企业基本信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('company:basic:query')")
    @GetMapping(value = "/{compBasicId}")
    public AjaxResult getInfo(@PathVariable("compBasicId") String compBasicId)
    {
        return success(icCompBasicService.selectIcCompBasicByCompBasicId(compBasicId));
    }

    /**
     * 新增企业基本信息
     */
    @PreAuthorize("@ss.hasPermi('company:basic:add')")
    @Log(title = "企业基本信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody IcCompBasic icCompBasic)
    {
        Assert.isTrue(CreditCodeValidator.CodeValidate(icCompBasic.getCompCreditCode()), "统一社会信用代码格式不正确");

        return toAjax(icCompBasicService.insertIcCompBasic(icCompBasic));
    }

    /**
     * 修改企业基本信息
     */
    @PreAuthorize("@ss.hasPermi('company:basic:edit')")
    @Log(title = "企业基本信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody IcCompBasic icCompBasic)
    {
        return toAjax(icCompBasicService.updateIcCompBasic(icCompBasic));
    }


}
