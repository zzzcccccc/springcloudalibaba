package com.cloud.auth.service;

import com.cloud.auth.utils.JwtUtil;
import com.api.commons.result.RES;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.cloud.auth.domain.LoginUser;
import com.cloud.auth.mapper.LoginMapper;
import com.cloud.auth.service.impl.LoginService;
import com.cloud.auth.utils.RedisCache;
import com.cloud.upms.entity.SysUser;

import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

/**
 * 登录相关逻辑
 */
@Service
public class LoginServiceImpl  extends ServiceImpl<LoginMapper, SysUser>  implements LoginService {
    @Resource
    private AuthenticationManager authenticationManager;

    @Resource
    public RedisCache redisCache;


    @Override
    public RES login(SysUser user) {
        // 认证的时候需要Authentication对象，所以需要一个Authentication的实现类，这里选择了UsernamePasswordAuthenticationToken
        UsernamePasswordAuthenticationToken authenticationToken =
                new UsernamePasswordAuthenticationToken(user.getUserName(),user.getPassword());

        // AuthenticationManager authenticate方法进行认证。在SecurityConfig配置类中，我们将AuthenticationManager注入到容器中。
        Authentication authenticate = authenticationManager.authenticate(authenticationToken);

        // 如果认证通过，authenticate里将包含principal属性，该属性的值就是LoginUser，
        // 如果认证没通过，给出对应的提示
        if (Objects.isNull(authenticate)) {
            throw new RuntimeException("登录失败");
        }

        // 如果认证通过了，使用userid生成一个jwt jwt存入ResponseResult返回
        LoginUser loginUser = (LoginUser) authenticate.getPrincipal();
        String id = loginUser.getUser().getId().toString();
        String jwt = JwtUtil.createJWT(id);
        Map<String, String> map = new HashMap<>();
        map.put("token", jwt);

        // 把完整的用户信息存入redis，userid作为key
        redisCache.setCacheObject("login:" + id, loginUser);
        return new RES(200, "登陆成功", map);

    }

    @Override
    public String logout() {
        // 获取SecurityContextHolder中的用户id
        UsernamePasswordAuthenticationToken authentication =
                (UsernamePasswordAuthenticationToken) SecurityContextHolder.getContext().getAuthentication();
        LoginUser loginUser = (LoginUser) authentication.getPrincipal();
        Long id = loginUser.getUser().getId();

        // 删除redis当中的值
        redisCache.deleteObject("login:" + id);
        return "注销成功";
    }
}
