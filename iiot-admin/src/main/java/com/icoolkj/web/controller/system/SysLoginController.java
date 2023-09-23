package com.icoolkj.web.controller.system;

import com.icoolkj.common.constant.Constants;
import com.icoolkj.common.core.domain.AjaxResult;
import com.icoolkj.common.core.domain.entity.SysMenu;
import com.icoolkj.common.core.domain.entity.SysUser;
import com.icoolkj.common.core.domain.model.LoginBody;
import com.icoolkj.common.security.keys.RSAUtils;
import com.icoolkj.common.security.keys.RsaKeyPairHolder;
import com.icoolkj.common.utils.SecurityUtils;
import com.icoolkj.framework.web.service.SysLoginService;
import com.icoolkj.framework.web.service.SysPermissionService;
import com.icoolkj.system.service.ISysMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.security.PublicKey;
import java.util.List;
import java.util.Set;

/**
 * 登录验证
 * 
 * @author icoolkj
 */
@RestController
public class SysLoginController
{
    @Autowired
    private SysLoginService loginService;

    @Autowired
    private ISysMenuService menuService;

    @Autowired
    private SysPermissionService permissionService;

    /**
     * 获取公钥 前端用来密码加密
     *
     * @return
     */
    @GetMapping("/publicKey")
    public String publicKey() {
        PublicKey publicKey = RsaKeyPairHolder.getPublicKey();
        return RSAUtils.publicKeyToBase64(publicKey);
    }

    /**
     * 登录方法
     * 
     * @param loginBody 登录信息
     * @return 结果
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody)
    {
        AjaxResult ajax = AjaxResult.success();
        // 生成令牌
        String token = loginService.login(loginBody.getUsername(), loginBody.getPassword(), loginBody.getCode(),
                loginBody.getUuid());
        ajax.put(Constants.TOKEN, token);
        return ajax;
    }

    /**
     * 获取用户信息
     * 
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public AjaxResult getInfo()
    {
        SysUser user = SecurityUtils.getLoginUser().getUser();
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(user);
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(user);
        AjaxResult ajax = AjaxResult.success();
        ajax.put("user", user);
        ajax.put("roles", roles);
        ajax.put("permissions", permissions);
        return ajax;
    }

    /**
     * 获取路由信息
     * 
     * @return 路由信息
     */
    @GetMapping("getRouters")
    public AjaxResult getRouters()
    {
        String userId = SecurityUtils.getUserId();
        List<SysMenu> menus = menuService.selectMenuTreeByUserId(userId);
        return AjaxResult.success(menuService.buildMenus(menus));
    }
}
