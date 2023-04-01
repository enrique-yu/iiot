package com.icoolkj.web.controller.device;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;

import com.icoolkj.common.constant.SysConstants;
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
import com.icoolkj.device.domain.DcDeviceCategory;
import com.icoolkj.device.service.IDcDeviceCategoryService;
import com.icoolkj.common.utils.poi.ExcelUtil;

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
        List<DcDeviceCategory> list = dcDeviceCategoryService.selectDcDeviceCategoryList(dcDeviceCategory);
        return success(list);
    }

    @PreAuthorize("@ss.hasPermi('system:category:list')")
    @GetMapping("/getCategoryHome")
    public AjaxResult getCategoryHome()
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("categoryHome", SysConstants.DEVICE_CATEGORY_HOME);
        return success(map);
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
