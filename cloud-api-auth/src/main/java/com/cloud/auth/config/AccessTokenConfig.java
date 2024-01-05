/*
package com.cloud.auth.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.oauth2.provider.token.TokenStore;
import org.springframework.security.oauth2.provider.token.store.InMemoryTokenStore;
import org.springframework.security.oauth2.provider.token.store.JdbcTokenStore;

import javax.sql.DataSource;

*/
/**
 * @Description: Token存储位置
 *//*

@Configuration
public class AccessTokenConfig {

    @Autowired
    private DataSource dataSource;

    @Bean
    TokenStore tokenStore() {
        return new JdbcTokenStore(dataSource);
    }

 */
/*
    InMemoryTokenStore，这是我们之前使用的，也是系统默认的，就是将 access_token 存到内存中，单机应用这个没有问题，但是在分布式环境下不推荐。
    JdbcTokenStore，看名字就知道，这种方式令牌会被保存到数据中，这样就可以方便的和其他应用共享令牌信息。
    JwtTokenStore，这个其实不是存储，因为使用了 jwt 之后，在生成的 jwt 中就有用户的所有信息，服务端不需要保存，这也是无状态登录。
    RedisTokenStore，这个很明显就是将 access_token 存到 redis 中。
    JwkTokenStore，将 access_token 保存到 JSON Web Key。
    虽然这里支持的方案比较多，但是我们常用的实际上主要是两个，RedisTokenStore 和 JwtTokenStore
*//*


}
*/
