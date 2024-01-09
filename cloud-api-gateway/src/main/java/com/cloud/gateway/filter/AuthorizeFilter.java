package com.cloud.gateway.filter;


import com.api.commons.jwt.JwtUtil;
import com.api.commons.exception.BizException;
import com.api.commons.exception.ExceptionEnum;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.Date;
import java.util.Objects;

/**
 * 全局过滤器校验jwt token
 */
@Component
public class AuthorizeFilter implements GlobalFilter, Ordered {

    @Autowired
    private RedisTemplate redisTemplate;

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        //1.获取请求对象和响应对象
        ServerHttpRequest request = exchange.getRequest();
        ServerHttpResponse response = exchange.getResponse();
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
//            response.setStatusCode(HttpStatus.UNAUTHORIZED);
//            return response.setComplete();

            // 传递异常信息
            throw new BizException(403,"用户未登录");

        }

        // 解析token
        String id;
        try {
            Claims claims = JwtUtil.parseJWT(jwtToken);
            Date expiration = claims.getExpiration();
            //和当前时间进行对比来判断是否过期
            boolean after = new Date(System.currentTimeMillis()).after(expiration);
            if (after){
                response.setStatusCode(HttpStatus.UNAUTHORIZED);
                return response.setComplete();
                // throw new BizException(503,"token过期");

            }
            id = claims.getSubject();
            // 从redis中获取用户信息
            String redisKey = "login:" + id;
            ValueOperations operation = redisTemplate.opsForValue();
            Object loginUser =  operation.get(redisKey);
            if (Objects.isNull(loginUser)) {
                throw new BizException(ExceptionEnum.SIGNATURE_NOT_MATCH.getResultCode(),
                        ExceptionEnum.SIGNATURE_NOT_MATCH.getResultMsg());
            }
        } catch (Exception e) {
            e.printStackTrace();
          /*  throw new BizException(ExceptionEnum.SIGNATURE_NOT_MATCH.getResultCode(),
                    ExceptionEnum.SIGNATURE_NOT_MATCH.getResultMsg());*/
        }




       /* try {
            //5.如果令牌存在，解析jwt令牌，判断该令牌是否合法，如果不合法，则向客户端返回错误信息
            Claims claims = AppJwtUtil.getClaimsBody(jwtToken);
            int result = AppJwtUtil.verifyToken(claims);
            if(result == 0 || result == -1){
                //5.1 合法，则向header中重新设置userId
                Integer id = (Integer) claims.get("id");
                log.info("find userid:{} from uri:{}",id,request.getURI());
                //重新设置token到header中
                ServerHttpRequest serverHttpRequest = request.mutate().headers(httpHeaders -> {
                    httpHeaders.add("userId", id + "");
                }).build();
                exchange.mutate().request(serverHttpRequest).build();
            }
        }catch (Exception e){
            e.printStackTrace();
            //想客户端返回错误提示信息
            response.setStatusCode(HttpStatus.UNAUTHORIZED);
            return response.setComplete();
        }
*/

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

