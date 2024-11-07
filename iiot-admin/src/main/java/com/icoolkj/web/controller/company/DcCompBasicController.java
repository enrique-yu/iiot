package com.icoolkj.web.controller.company;

import com.icoolkj.common.annotation.Log;
import com.icoolkj.common.core.controller.BaseController;
import com.icoolkj.common.core.domain.AjaxResult;
import com.icoolkj.common.core.domain.model.LoginUser;
import com.icoolkj.common.core.page.TableDataInfo;
import com.icoolkj.common.enums.BusinessType;
import com.icoolkj.common.utils.CreditCodeValidator;
import com.icoolkj.common.utils.SecurityUtils;
import com.icoolkj.common.utils.poi.ExcelUtil;
import com.icoolkj.company.domain.DcCompBasic;
import com.icoolkj.company.service.IDcCompBasicService;
import io.jsonwebtoken.lang.Assert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 企业基本信息Controller
 * 
 * @author:haiwei.yu01
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
        if ( dcCompBasicService.getDcCompBasicByCreditCode(dcCompBasic) != null )
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
        DcCompBasic oldCompBasic = dcCompBasicService.getDcCompBasicByCreditCode(dcCompBasic);
        if (oldCompBasic != null && !dcCompBasic.getCompBasicId().equals(oldCompBasic.getCompBasicId() ))
        {
            return error("修改企业统一社会信用代码【" + dcCompBasic.getCompCreditCode() + "】失败，统一社会信用代码已存在");
        }

        return toAjax(dcCompBasicService.updateDcCompBasic(dcCompBasic));
    }


    /**
     * 通过当前企业用户，获取企业详细信息
     */
    @GetMapping(value = "/getCompUserInfo")
    public AjaxResult getCompUserInfo()
    {
        LoginUser loginUser = SecurityUtils.getLoginUser();
        return success(dcCompBasicService.selectDcCompBasicByCompBasicId(loginUser.getUser().getUserRelationId()));
    }

    /**
     * 完善企业基本信息
     */
    @PreAuthorize("@ss.hasPermi('company:basic:perfectInfo')")
    @Log(title = "完善企业基本信息", businessType = BusinessType.UPDATE)
    @PutMapping("/perfectInfo")
    public AjaxResult perfectInfo(@RequestBody DcCompBasic dcCompBasic)
    {
        Assert.isTrue(CreditCodeValidator.CodeValidate(dcCompBasic.getCompCreditCode()), "统一社会信用代码格式不正确");
        DcCompBasic oldCompBasic = dcCompBasicService.getDcCompBasicByCreditCode(dcCompBasic);
        if (oldCompBasic != null && !dcCompBasic.getCompBasicId().equals(oldCompBasic.getCompBasicId() ))
        {
            return error("修改企业统一社会信用代码【" + dcCompBasic.getCompCreditCode() + "】失败，统一社会信用代码已存在");
        }

        return toAjax(dcCompBasicService.updateDcCompBasic(dcCompBasic));
    }


}
