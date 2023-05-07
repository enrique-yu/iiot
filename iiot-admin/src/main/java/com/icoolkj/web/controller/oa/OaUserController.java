package com.icoolkj.web.controller.oa;

import java.util.List;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletResponse;

import com.icoolkj.common.core.domain.entity.SysDept;
import com.icoolkj.common.core.domain.entity.SysRole;
import com.icoolkj.common.core.domain.entity.SysUser;
import com.icoolkj.common.utils.SecurityUtils;
import com.icoolkj.common.utils.StringUtils;
import com.icoolkj.system.service.ISysDeptService;
import com.icoolkj.system.service.ISysPostService;
import com.icoolkj.system.service.ISysRoleService;
import com.icoolkj.system.service.ISysUserService;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import com.icoolkj.common.annotation.Log;
import com.icoolkj.common.core.controller.BaseController;
import com.icoolkj.common.core.domain.AjaxResult;
import com.icoolkj.common.enums.BusinessType;
import com.icoolkj.common.utils.poi.ExcelUtil;
import com.icoolkj.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author icoolkj
 * @version 1.0
 * @description 企业人员
 * @createDate 2023/04/22 12:02
 */
@RestController
@RequestMapping("/oa/user")
public class OaUserController extends BaseController
{

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysRoleService roleService;

    @Autowired
    private ISysDeptService deptService;

    @Autowired
    private ISysPostService postService;

    /**
     * 获取用户列表
     */
    @PreAuthorize("@ss.hasPermi('oa:user:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysUser user)
    {
        startPage();
        user.setDomainId(SecurityUtils.getDomainId());
        List<SysUser> list = userService.selectUserList(user);
        return getDataTable(list);
    }

    @Log(title = "用户管理", businessType = BusinessType.EXPORT)
    @PreAuthorize("@ss.hasPermi('oa:user:export')")
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysUser user)
    {
        user.setDomainId(SecurityUtils.getDomainId());
        List<SysUser> list = userService.selectUserList(user);
        ExcelUtil<SysUser> util = new ExcelUtil<SysUser>(SysUser.class);
        util.exportExcel(response, list, "企业用户数据");
    }

    /**
     * 根据用户编号获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('oa:user:query')")
    @GetMapping(value = { "/", "/{userId}" })
    public AjaxResult getInfo(@PathVariable(value = "userId", required = false) String userId)
    {
        userService.checkUserDataScope(userId);
        AjaxResult ajax = AjaxResult.success();
        List<SysRole> roles = roleService.selectRoleAll();
        ajax.put("roles", SysUser.isAdmin(userId) ? roles : roles.stream().filter(r -> !r.isAdmin()).collect(Collectors.toList()));
        ajax.put("posts", postService.selectDomainPostAll());
        if (StringUtils.isNotNull(userId))
        {
            SysUser sysUser = userService.selectUserById(userId);
            ajax.put(AjaxResult.DATA_TAG, sysUser);
            ajax.put("postIds", postService.selectPostListByUserId(userId));
            ajax.put("roleIds", sysUser.getRoles().stream().map(SysRole::getRoleId).collect(Collectors.toList()));
        }
        return ajax;
    }

    /**
     * 新增用户
     */
    @PreAuthorize("@ss.hasPermi('oa:user:add')")
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@Validated @RequestBody SysUser user)
    {
        if (!userService.checkUserNameUnique(user))
        {
            return error("新增用户'" + user.getUserName() + "'失败，登录账号已存在");
        }
        else if (StringUtils.isNotEmpty(user.getPhonenumber()) && !userService.checkPhoneUnique(user))
        {
            return error("新增用户'" + user.getUserName() + "'失败，手机号码已存在");
        }
        else if (StringUtils.isNotEmpty(user.getEmail()) && !userService.checkEmailUnique(user))
        {
            return error("新增用户'" + user.getUserName() + "'失败，邮箱账号已存在");
        }
        return toAjax(userService.insertUser(user));
    }

    /**
     * 修改用户
     */
    @PreAuthorize("@ss.hasPermi('oa:user:edit')")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@Validated @RequestBody SysUser user)
    {
        userService.checkUserAllowed(user);
        userService.checkUserDataScope(user.getUserId());
        if (!userService.checkUserNameUnique(user))
        {
            return error("修改用户'" + user.getUserName() + "'失败，登录账号已存在");
        }
        else if (StringUtils.isNotEmpty(user.getPhonenumber()) && !userService.checkPhoneUnique(user))
        {
            return error("修改用户'" + user.getUserName() + "'失败，手机号码已存在");
        }
        else if (StringUtils.isNotEmpty(user.getEmail()) && !userService.checkEmailUnique(user))
        {
            return error("修改用户'" + user.getUserName() + "'失败，邮箱账号已存在");
        }
        return toAjax(userService.updateUser(user));
    }

    /**
     * 删除用户
     */
    @PreAuthorize("@ss.hasPermi('oa:user:remove')")
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{userIds}")
    public AjaxResult remove(@PathVariable String[] userIds)
    {
        if (ArrayUtils.contains(userIds, getUserId()))
        {
            return error("当前用户不能删除");
        }
        return toAjax(userService.deleteUserByIds(userIds));
    }

    /**
     * 重置密码
     */
    @PreAuthorize("@ss.hasPermi('oa:user:resetPwd')")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/resetPwd")
    public AjaxResult resetPwd(@RequestBody SysUser user)
    {
        userService.checkUserAllowed(user);
        userService.checkUserDataScope(user.getUserId());
        user.setPassword(SecurityUtils.encryptPassword(user.getPassword()));
        user.setUpdateBy(getUsername());
        return toAjax(userService.resetPwd(user));
    }

    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('oa:user:edit')")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody SysUser user)
    {
        userService.checkUserAllowed(user);
        userService.checkUserDataScope(user.getUserId());
        user.setUpdateBy(getUsername());
        return toAjax(userService.updateUserStatus(user));
    }

    /**
     * 根据用户编号获取授权角色
     */
    @PreAuthorize("@ss.hasPermi('oa:user:query')")
    @GetMapping("/authRole/{userId}")
    public AjaxResult authRole(@PathVariable("userId") String userId)
    {
        AjaxResult ajax = AjaxResult.success();
        SysUser user = userService.selectUserById(userId);
        List<SysRole> roles = roleService.selectRolesByUserId(userId);
        ajax.put("user", user);
        ajax.put("roles", SysUser.isAdmin(userId) ? roles : roles.stream().filter(r -> !r.isAdmin()).collect(Collectors.toList()));
        return ajax;
    }

    /**
     * 用户授权角色
     */
    @PreAuthorize("@ss.hasPermi('oa:user:edit')")
    @Log(title = "用户管理", businessType = BusinessType.GRANT)
    @PutMapping("/authRole")
    public AjaxResult insertAuthRole(String userId, String[] roleIds)
    {
        userService.checkUserDataScope(userId);
        userService.insertUserAuth(userId, roleIds);
        return success();
    }

    /**
     * 获取部门树列表
     */
    @PreAuthorize("@ss.hasPermi('oa:user:list')")
    @GetMapping("/deptTree")
    public AjaxResult deptTree(SysDept dept)
    {
        dept.setDomainId(SecurityUtils.getDomainId());
        return success(deptService.selectDeptTreeList(dept));
    }

}
