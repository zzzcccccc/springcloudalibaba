package com.cloud.upms.controller;

import com.api.commons.result.RES;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.cloud.upms.entity.SysUser;
import com.cloud.upms.mapper.UserMapper;
import com.cloud.upms.service.LoginService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping(value = "/user")
@Api(value = "用户管理", tags = "用户管理")
public class UserController {

    @Autowired
    private UserMapper userMapper;
    @Autowired
    private LoginService loginService;

    @ApiOperation(value = "登录", notes = "登录")
    @GetMapping("/login/{userName}/{password}")
    public RES login(@PathVariable(value = "userName") String userName,
                     @PathVariable(value = "password") String password ){
        SysUser sysUser = new SysUser();
        sysUser.setUserName(userName);
        sysUser.setPassword(password);
        return loginService.login(sysUser);
    }


    @ApiOperation(value = "修改密码", notes = "修改密码")
    @GetMapping("/editPassword/{userName}/{password}")
    public RES editPassword(@PathVariable(value = "userName") String userName,
                     @PathVariable(value = "password") String password ){
        // 查询用户信息
        LambdaQueryWrapper<SysUser> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(SysUser::getUserName, userName);
        SysUser user = userMapper.selectOne(queryWrapper);

        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        // 加上 {bcrypt} 这样的前缀，spring security拿到密码后就会以对应的方式进行解密
        user.setPassword(passwordEncoder.encode(password));
        int i = userMapper.updateById(user);

        return RES.ok(0,"success",i);
    }

    @ApiOperation(value = "列表", notes = "列表")
    @GetMapping("/getAll")
    public RES getAll(){
        List<SysUser> users = userMapper.selectList(null);
        return RES.ok(0,"success",users);
    }

    @ApiOperation(value = "查询用户信息", notes = "查询用户信息")
    @GetMapping("/getInfoByUserName/{userName}")
    public SysUser getInfoByUserName(@PathVariable(value = "userName") String userName){

        // 查询用户信息
        LambdaQueryWrapper<SysUser> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(SysUser::getUserName, userName);
        SysUser user = userMapper.selectOne(queryWrapper);
        return user;
    }

/*    public static void main(String[] args) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encode = passwordEncoder.encode("1234");
        String encode2 = passwordEncoder.encode("1234");

        System.out.println(encode);
        System.out.println(encode2);
    }*/

/*    public static void main(String[] args) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        boolean matches = passwordEncoder.matches("1234",
                "$2a$10$/HoyKsyy1iuwgEuEbkbwjez3hfALU1yPe7AfYlSFcRdchYQiq5W9a");

        boolean matches2 = passwordEncoder.matches("1234",
                "$2a$10$foCh1KfYfdyhDv6a6yZg.OgMI9/1UECYyLyzqiqC5j86c6yTnNUiq");

        System.out.println(matches);
        System.out.println(matches2);

    }*/


}
