package com.cloud.upms.service;


import com.api.commons.result.RES;
import com.cloud.upms.entity.SysUser;

public interface LoginService {


    RES login(SysUser sysUser);
}
