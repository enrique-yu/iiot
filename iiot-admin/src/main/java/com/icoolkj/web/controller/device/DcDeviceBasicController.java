package com.icoolkj.web.controller.device;

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
import com.icoolkj.device.domain.DcDeviceBasic;
import com.icoolkj.device.service.IDcDeviceBasicService;
import com.icoolkj.common.utils.poi.ExcelUtil;
import com.icoolkj.common.core.page.TableDataInfo;

/**
 * 设备基础Controller
 * 
 * @author icoolkj
 * @date 2023-03-17
 */
@RestController
@RequestMapping("/device/basic")
public class DcDeviceBasicController extends BaseController
{
    @Autowired
    private IDcDeviceBasicService dcDeviceBasicService;

    /**
     * 查询设备基础列表
     */
    @PreAuthorize("@ss.hasPermi('device:basic:list')")
    @GetMapping("/list")
    public TableDataInfo list(DcDeviceBasic dcDeviceBasic)
    {
        startPage();
        List<DcDeviceBasic> list = dcDeviceBasicService.selectDcDeviceBasicList(dcDeviceBasic);
        return getDataTable(list);
    }

    /**
     * 导出设备基础列表
     */
    @PreAuthorize("@ss.hasPermi('device:basic:export')")
    @Log(title = "设备基础", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, DcDeviceBasic dcDeviceBasic)
    {
        List<DcDeviceBasic> list = dcDeviceBasicService.selectDcDeviceBasicList(dcDeviceBasic);
        ExcelUtil<DcDeviceBasic> util = new ExcelUtil<DcDeviceBasic>(DcDeviceBasic.class);
        util.exportExcel(response, list, "设备基础数据");
    }

    /**
     * 获取设备基础详细信息
     */
    @PreAuthorize("@ss.hasPermi('device:basic:query')")
    @GetMapping(value = "/{deviceBasicId}")
    public AjaxResult getInfo(@PathVariable("deviceBasicId") String deviceBasicId)
    {
        return success(dcDeviceBasicService.selectDcDeviceBasicByDeviceBasicId(deviceBasicId));
    }

    /**
     * 新增设备基础
     */
    @PreAuthorize("@ss.hasPermi('device:basic:add')")
    @Log(title = "设备基础", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody DcDeviceBasic dcDeviceBasic)
    {
        if (!dcDeviceBasicService.checkDeviceSnUnique(dcDeviceBasic))
        {
            return error("新增设备编号【" + dcDeviceBasic.getDeviceSn() + "】失败，设备编号已存在");
        }
        return toAjax(dcDeviceBasicService.insertDcDeviceBasic(dcDeviceBasic));
    }

    /**
     * 修改设备基础
     */
    @PreAuthorize("@ss.hasPermi('device:basic:edit')")
    @Log(title = "设备基础", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody DcDeviceBasic dcDeviceBasic)
    {
        return toAjax(dcDeviceBasicService.updateDcDeviceBasic(dcDeviceBasic));
    }


}
