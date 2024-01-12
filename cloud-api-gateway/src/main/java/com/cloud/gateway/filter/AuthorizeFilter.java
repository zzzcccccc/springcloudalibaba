package com.cloud.gateway.filter;


import cn.hutool.json.JSONObject;
import com.api.commons.exception.ExceptionEnum;
import com.api.commons.jwt.JwtUtil;
import com.cloud.gateway.utils.RedisCache;
import io.jsonwebtoken.Claims;
import javafx.scene.SubScene;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.Objects;
import java.util.Set;

/**
 * 全局过滤器校验jwt token
 */
@Component
public class AuthorizeFilter implements GlobalFilter, Ordered {


    @Autowired
    private RedisCache redisCache;

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {

        //1.获取请求对象和响应对象
        ServerHttpRequest request = exchange.getRequest();
        ServerHttpResponse response = exchange.getResponse();

        //1.1.处理返回结果
        JSONObject message = new JSONObject();
        message.put("code", ExceptionEnum.SIGNATURE_NOT_MATCH.getResultCode());
        message.put("msg",  ExceptionEnum.SIGNATURE_NOT_MATCH.getResultMsg());
        byte[] bits = message.toString().getBytes(StandardCharsets.UTF_8);
        DataBuffer buffer = response.bufferFactory().wrap(bits);
        response.setStatusCode(HttpStatus.UNAUTHORIZED);
        //指定编码，否则在浏览器中会中文乱码
        response.getHeaders().add("Content-Type", "text/plain;charset=UTF-8");

        //2.判断当前的请求是否为登录，如果是，直接放行
        if(request.getURI().getPath().contains("/auth/login")||
           request.getURI().getPath().contains("/v2/api-docs")){
            //放行
            return chain.filter(exchange);
        }

        //3.获取当前用户的请求头jwt信息
        HttpHeaders headers = request.getHeaders();
        String jwtToken = headers.getFirst("token");

        //4.判断当前令牌是否存在
        if(StringUtils.isEmpty(jwtToken)){
            //如果不存在，向客户端返回错误提示信息
            System.out.println("----未传token---");
            return response.writeWith(Mono.just(buffer));
        }

        //5.如果令牌存在，解析jwt令牌，判断该令牌是否合法，如果不合法，则向客户端返回错误信息
        String id;
        try {
            Claims claims = JwtUtil.parseJWT(jwtToken);
            Date expiration = claims.getExpiration();  //解决token过期
            Date issuedAt = claims.getIssuedAt();
            //和当前时间进行对比来判断是否过期
            boolean after = new Date(System.currentTimeMillis()).after(expiration);
            id = claims.getSubject();
            if (after){
               //token过期
                System.out.println("-----token过期----");
                //如果当前时间减去JWT过期的时间，大于允许过期时间，说明不允许重新申请了，就得重新登录了，此时返回null，
                // 否则就是可以重新申请，开始在后台重新生成新的JWT。(30分钟)
                if ((System.currentTimeMillis()-expiration.getTime())>JwtUtil.ALLOW_EXPIRES_TIME) {
                    return response.writeWith(Mono.just(buffer));
                }else{
                    //生成新token，存到header中返回给前端
                    String jwt = JwtUtil.createJWT(id);
                    response.getHeaders().add("token", jwt);
                }
            }

            // 从redis中获取用户信息
            String redisKey = "login:"+id;
            Object loginUser = redisCache.getCacheObject(redisKey);
            if (Objects.isNull(loginUser)) {
                System.out.println("-----token错误----");
                return response.writeWith(Mono.just(buffer));
            }

            //5.1 合法，则向header中重新设置userId （还不太清楚作用）
            //重新设置token到header中
//            ServerHttpRequest serverHttpRequest = request.mutate().headers(httpHeaders -> {
//                httpHeaders.add("userId", id + "");
//            }).build();
//            exchange.mutate().request(serverHttpRequest).build();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("-----异常----");
            return response.writeWith(Mono.just(buffer));
        }

        //6.放行
        return chain.filter(exchange);

    }

    /**
     * 优先级设置
     * 值越小，优先级越高
     * @return
     */
    @Override
    public int getOrder() {
        return 0;
    }
}

