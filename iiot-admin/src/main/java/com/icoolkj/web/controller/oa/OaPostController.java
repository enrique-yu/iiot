package com.icoolkj.web.controller.oa;

import com.icoolkj.common.annotation.Log;
import com.icoolkj.common.core.controller.BaseController;
import com.icoolkj.common.core.domain.AjaxResult;
import com.icoolkj.common.core.page.TableDataInfo;
import com.icoolkj.common.enums.BusinessType;
import com.icoolkj.common.utils.SecurityUtils;
import com.icoolkj.system.domain.SysPost;
import com.icoolkj.system.service.ISysPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author icoolkj
 * @version 1.0
 * @description OA行政办公-岗位管理
 * @createDate 2023/04/05 20:20
 */
@RestController
@RequestMapping("/oa/post")
public class OaPostController extends BaseController {

    @Autowired
    private ISysPostService postService;

    /**
     * 获取岗位列表
     */
    @PreAuthorize("@ss.hasPermi('oa:post:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysPost post) {
        startPage();
        post.setDomainId(SecurityUtils.getDomainId());
        List<SysPost> list = postService.selectPostList(post);
        return getDataTable(list);
    }

    /**
     * 根据岗位编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('oa:post:query')")
    @GetMapping(value = "/{postId}")
    public AjaxResult getInfo(@PathVariable String postId)
    {
        return success(postService.selectPostById(postId));
    }

    /**
     * 新增岗位
     */
    @PreAuthorize("@ss.hasPermi('oa:post:add')")
    @Log(title = "岗位管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody SysPost post) {
        if (!postService.checkPostNameUnique(post)) {
            return error("新增岗位'" + post.getPostName() + "'失败，岗位名称已存在");
        } else if (!postService.checkPostCodeUnique(post)) {
            return error("新增岗位'" + post.getPostName() + "'失败，岗位编码已存在");
        }
        post.setDomainId(SecurityUtils.getDomainId());
        post.setCreateBy(getUsername());
        return toAjax(postService.insertPost(post));
    }

    /**
     * 修改岗位
     */
    @PreAuthorize("@ss.hasPermi('oa:post:edit')")
    @Log(title = "岗位管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody SysPost post) {
        if (!postService.checkPostNameUnique(post)) {
            return error("修改岗位'" + post.getPostName() + "'失败，岗位名称已存在");
        } else if (!postService.checkPostCodeUnique(post)) {
            return error("修改岗位'" + post.getPostName() + "'失败，岗位编码已存在");
        }
        post.setUpdateBy(getUsername());
        return toAjax(postService.updatePost(post));
    }

    /**
     * 删除岗位
     */
    @PreAuthorize("@ss.hasPermi('oa:post:remove')")
    @Log(title = "岗位管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{postId}")
    public AjaxResult remove(@PathVariable String postId) {
        return toAjax(postService.deletePostById(postId));
    }


}
