package com.cloud.upms.service.impl;


import com.api.commons.result.RES;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import com.cloud.upms.entity.SysUser;
import com.cloud.upms.mapper.UserMapper;
import com.cloud.upms.service.LoginService;

import org.springframework.stereotype.Service;



@Service
public class LoginServiceImpl extends ServiceImpl<UserMapper, SysUser> implements LoginService {


    @Override
    public RES login(SysUser sysUser) {
        return null;
    }
}
