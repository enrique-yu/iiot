package com.icoolkj.web.controller.company;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.icoolkj.common.utils.CreditCodeValidator;
import io.jsonwebtoken.lang.Assert;
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
import com.icoolkj.company.domain.DcCompBasic;
import com.icoolkj.company.service.IDcCompBasicService;
import com.icoolkj.common.utils.poi.ExcelUtil;
import com.icoolkj.common.core.page.TableDataInfo;

/**
 * 企业基本信息Controller
 * 
 * @author icoolkj
 * @date 2023-03-10
 */
@RestController
@RequestMapping("/company/basic")
public class DcCompBasicController extends BaseController
{
    @Autowired
    private IDcCompBasicService dcCompBasicService;

    /**
     * 查询企业基本信息列表
     */
    @PreAuthorize("@ss.hasPermi('company:basic:list')")
    @GetMapping("/list")
    public TableDataInfo list(DcCompBasic dcCompBasic)
    {
        startPage();
        List<DcCompBasic> list = dcCompBasicService.selectDcCompBasicList(dcCompBasic);
        return getDataTable(list);
    }

    /**
     * 导出企业基本信息列表
     */
    @PreAuthorize("@ss.hasPermi('company:basic:export')")
    @Log(title = "企业基本信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DcCompBasic dcCompBasic)
    {
        List<DcCompBasic> list = dcCompBasicService.selectDcCompBasicList(dcCompBasic);
        ExcelUtil<DcCompBasic> util = new ExcelUtil<DcCompBasic>(DcCompBasic.class);
        util.exportExcel(response, list, "企业基本信息数据");
    }

    /**
     * 获取企业基本信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('company:basic:query')")
    @GetMapping(value = "/{compBasicId}")
    public AjaxResult getInfo(@PathVariable("compBasicId") String compBasicId)
    {
        return success(dcCompBasicService.selectDcCompBasicByCompBasicId(compBasicId));
    }

    /**
     * 新增企业基本信息
     */
    @PreAuthorize("@ss.hasPermi('company:basic:add')")
    @Log(title = "企业基本信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DcCompBasic dcCompBasic)
    {
        Assert.isTrue(CreditCodeValidator.CodeValidate(dcCompBasic.getCompCreditCode()), "统一社会信用代码格式不正确");
        if (!dcCompBasicService.checkCreditCodeUnique(dcCompBasic))
        {
            return error("新增企业统一社会信用代码【" + dcCompBasic.getCompCreditCode() + "】失败，统一社会信用代码已存在");
        }

        return toAjax(dcCompBasicService.insertDcCompBasic(dcCompBasic));
    }

    /**
     * 修改企业基本信息
     */
    @PreAuthorize("@ss.hasPermi('company:basic:edit')")
    @Log(title = "企业基本信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DcCompBasic dcCompBasic)
    {
        Assert.isTrue(CreditCodeValidator.CodeValidate(dcCompBasic.getCompCreditCode()), "统一社会信用代码格式不正确");
       /* DcCompBasic oldCompBasic = icCompBasicService.checkCreditCodeUnique(icCompBasic);
        if (!oldCompBasic)
        {
            return error("修改企业统一社会信用代码【" + icCompBasic.getCompCreditCode() + "】失败，统一社会信用代码已存在");
        }*/

        return toAjax(dcCompBasicService.updateDcCompBasic(dcCompBasic));
    }


}
