package com.cloud.auth.controller;

import com.api.commons.result.RES;
import com.cloud.auth.service.impl.LoginService;
import com.cloud.upms.entity.SysUser;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@Api(value = "授权管理", tags = "授权管理")
@RequestMapping("auth")
public class AuthController {

    @Autowired
    private LoginService loginService;

    @ApiOperation(value = "登录", notes = "登录")
    @PostMapping("/login")
    public RES login(@RequestBody SysUser sysUser){
        return loginService.login(sysUser);
    }

    @ApiOperation(value = "退出", notes = "退出")
    @GetMapping("/logout")
    public RES logout() {
        String msg = loginService.logout();
        return RES.ok(0,"success", "注销成功");
    }

}
