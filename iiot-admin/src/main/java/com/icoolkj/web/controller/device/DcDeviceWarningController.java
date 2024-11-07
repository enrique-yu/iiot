package com.icoolkj.web.controller.device;

import com.icoolkj.common.core.controller.BaseController;
import com.icoolkj.common.core.page.TableDataInfo;
import com.icoolkj.common.utils.SecurityUtils;
import com.icoolkj.device.domain.DcDeviceBasic;
import com.icoolkj.device.service.IDcDeviceBasicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author:haiwei.yu01
 * @version 1.0
 * @description 设备预警管理
 * @createDate 2023/04/02 16:34
 */
@RestController
@RequestMapping("/device/warning")
public class DcDeviceWarningController extends BaseController {
    @Autowired
    private IDcDeviceBasicService dcDeviceBasicService;

    /**
     * 查询设备基础列表
     */
    @PreAuthorize("@ss.hasPermi('device:warning:list')")
    @GetMapping("/activityIndex")
    public TableDataInfo activityIndex(DcDeviceBasic dcDeviceBasic) {
        startPage();
        dcDeviceBasic.setDomainId(SecurityUtils.getDomainId());
        List<DcDeviceBasic> list = dcDeviceBasicService.selectDcDeviceBasicList(dcDeviceBasic);
        return getDataTable(list);
    }

}
