package com.icoolkj.web.controller.device;

import com.icoolkj.common.annotation.Log;
import com.icoolkj.common.constant.SysConstants;
import com.icoolkj.common.core.controller.BaseController;
import com.icoolkj.common.core.domain.AjaxResult;
import com.icoolkj.common.enums.BusinessType;
import com.icoolkj.common.utils.SecurityUtils;
import com.icoolkj.common.utils.poi.ExcelUtil;
import com.icoolkj.device.domain.DcDeviceCategory;
import com.icoolkj.device.service.IDcDeviceCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * 设备分类信息Controller
 * 
 * @author icoolkj
 * @date 2023-04-01
 */
@RestController
@RequestMapping("/device/category")
public class DcDeviceCategoryController extends BaseController
{
    @Autowired
    private IDcDeviceCategoryService dcDeviceCategoryService;

    /**
     * 查询设备分类信息列表
     */
    @PreAuthorize("@ss.hasPermi('device:category:list')")
    @GetMapping("/list")
    public AjaxResult list(DcDeviceCategory dcDeviceCategory)
    {
        startPage();
        dcDeviceCategory.setDomainId(SecurityUtils.getDomainId());
        List<DcDeviceCategory> list = dcDeviceCategoryService.selectDcDeviceCategoryList(dcDeviceCategory);
        return success(list);
    }

    /**
     * 查询设备分类列表（排除节点及节点下子节点）
     */
    @PreAuthorize("@ss.hasPermi('device:category:list')")
    @GetMapping("/list/exclude/{deviceCategoryId}")
    public AjaxResult excludeChild(@PathVariable(value = "deviceCategoryId", required = true) String deviceCategoryId)
    {
        DcDeviceCategory dcDeviceCategory = new DcDeviceCategory();
        dcDeviceCategory.setDomainId(SecurityUtils.getDomainId());
        dcDeviceCategory.setDeviceCategoryId(deviceCategoryId);
        List<DcDeviceCategory> categorys = dcDeviceCategoryService.selectDcDeviceCategoryExcludeChildList(dcDeviceCategory);
        return success(categorys);
    }

    @PreAuthorize("@ss.hasPermi('system:category:list')")
    @GetMapping("/getSysDefalutCategory")
    public AjaxResult getSysDefalutCategory()
    {
        return success(dcDeviceCategoryService.selectDcDeviceCategoryByDeviceCategoryId(SysConstants.SYS_DEFAULT_DEVICE_CATEGORY));
    }

    /**
     * 导出设备分类信息列表
     */
    @PreAuthorize("@ss.hasPermi('device:category:export')")
    @Log(title = "设备分类信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DcDeviceCategory dcDeviceCategory)
    {
        List<DcDeviceCategory> list = dcDeviceCategoryService.selectDcDeviceCategoryList(dcDeviceCategory);
        ExcelUtil<DcDeviceCategory> util = new ExcelUtil<DcDeviceCategory>(DcDeviceCategory.class);
        util.exportExcel(response, list, "设备分类信息数据");
    }

    /**
     * 获取设备分类信息详细信息
     */
    @PreAuthorize("@ss.hasPermi('device:category:query')")
    @GetMapping(value = "/{deviceCategoryId}")
    public AjaxResult getInfo(@PathVariable("deviceCategoryId") String deviceCategoryId)
    {
        return success(dcDeviceCategoryService.selectDcDeviceCategoryByDeviceCategoryId(deviceCategoryId));
    }

    /**
     * 新增设备分类信息
     */
    @PreAuthorize("@ss.hasPermi('device:category:add')")
    @Log(title = "设备分类信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DcDeviceCategory dcDeviceCategory)
    {
        return toAjax(dcDeviceCategoryService.insertDcDeviceCategory(dcDeviceCategory));
    }

    /**
     * 修改设备分类信息
     */
    @PreAuthorize("@ss.hasPermi('device:category:edit')")
    @Log(title = "设备分类信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DcDeviceCategory dcDeviceCategory)
    {
        return toAjax(dcDeviceCategoryService.updateDcDeviceCategory(dcDeviceCategory));
    }

    /**
     * 删除设备分类信息
     */
    @PreAuthorize("@ss.hasPermi('device:category:remove')")
    @Log(title = "设备分类信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{deviceCategoryIds}")
    public AjaxResult remove(@PathVariable String[] deviceCategoryIds)
    {
        return toAjax(dcDeviceCategoryService.deleteDcDeviceCategoryByDeviceCategoryIds(deviceCategoryIds));
    }
}
