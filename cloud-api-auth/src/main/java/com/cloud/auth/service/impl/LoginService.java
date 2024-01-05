package com.cloud.auth.service.impl;

import com.api.commons.result.RES;
import com.baomidou.mybatisplus.extension.service.IService;
import com.cloud.upms.entity.SysUser;

public interface LoginService extends IService<SysUser> {

   RES login(SysUser user);

    String logout();
}
