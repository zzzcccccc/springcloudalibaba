package com.cloud.auth.filter;

import com.cloud.auth.utils.JwtUtil;
import com.cloud.auth.domain.LoginUser;
import com.cloud.auth.utils.RedisCache;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Objects;

/**
 * 过滤器，校验token（不是全局的）
 */
@Component
public class JwtAuthenticationTokenFilter extends OncePerRequestFilter {

    @Autowired
    private RedisCache redisCache;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {

        // 获取token
        String token = request.getHeader("token");
        if (!StringUtils.hasText(token)) {
            // 放行，后面还有其他过滤器
            filterChain.doFilter(request, response);
            // 所有过滤器执行完毕后，响应回来还会走到这里
            return;
        }

        // 解析token
        String id;
        try {
            Claims claims = JwtUtil.parseJWT(token);
            id = claims.getSubject();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("token非法");
        }

        // 从redis中获取用户信息
        String redisKey = "login:" + id;
        LoginUser loginUser = redisCache.getCacheObject(redisKey);
        if (Objects.isNull(loginUser)) {
            throw new RuntimeException("用户未登录");
        }

        // 后面将需要一个Authentication的对象，在这里通过实现类UsernamePasswordAuthenticationToken构造这个对象
        // 选择3个参数的构造器，principal：账号，credentials：密码，authorities：权限
        // 为什么要选择这个构造器呢？因为这个构造器中有，super.setAuthenticated(true); 标识用户为已认证。
        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(loginUser, null, null);
        // 存入SecurityContextHolder
        // 存入需要一个Authentication的对象，在登录的时候也用到过类似的方法。
        // TODO 获取权限信息封装到Authentication
        SecurityContextHolder.getContext().setAuthentication(authenticationToken);

        // 放行
        filterChain.doFilter(request, response);
    }
}