package com.cloud.auth.service;

import com.cloud.auth.domain.LoginUser;
import com.cloud.upms.entity.SysUser;
import com.cloud.upms.feign.FeignUpmsClient;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Objects;

/**
 * security校验用户
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Resource
    private FeignUpmsClient feignUpmsClient;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        // 查询用户信息
        SysUser user = feignUpmsClient.getInfoByUserName(username);
        // 如果没有查询到用户则抛出异常,在过滤链中有异常捕获，这里抛出的异常会被捕获
        if (Objects.isNull(user)) {
            throw new RuntimeException("用户名或密码错误");
        }

        //TODO 查询对应的权限信息
        // 把数据封装成UserDetails返回
        return new LoginUser(user);
    }
}
