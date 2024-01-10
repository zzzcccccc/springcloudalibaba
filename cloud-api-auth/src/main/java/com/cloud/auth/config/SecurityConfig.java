package com.cloud.auth.config;

//import com.cloud.auth.filter.JwtAuthenticationTokenFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.annotation.Order;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;


/**
 * @Description: SpringSecurity的基本配置
 **/

@Configuration
//@Order(99) //解决跳转/login页面失败问题
public class SecurityConfig extends WebSecurityConfigurerAdapter {

//    @Autowired
//    private JwtAuthenticationTokenFilter jwtAuthenticationTokenFilter;

    /**
     * 加密
     * @return
     */
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http
                //关闭csrf
                .csrf().disable()
                //不通过Session获取SecurityContext
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                .authorizeRequests()
                // 对于登录接口 允许匿名访问
                .antMatchers("/auth/login").anonymous()
                .antMatchers("/auth/logout").anonymous()
                .antMatchers("/doc.html",
                        "/v2/**",//此请求不放开会导致 error api-docs无法正常显示  https://songzixian.com/javalog/905.html
                        "/swagger-ui**",
                        "/swagger-ui/**",//此请求不放开没有权限请求一直失败，处于轮询接口
                        "/swagger-resources/**",//此请求不放开导致访问出现Unable to infer base url. This is common when using dynamic servlet registration or when the API is   https://blog.csdn.net/just_now_and_future/article/details/89343680
                        "/webjars/**"
                ).permitAll()
                // 除上面外的所有请求全部需要鉴权认证
                .anyRequest().authenticated();
        // 在过滤器UsernamePasswordAuthenticationFilter之前，添加我们自定义的过滤器JwtAuthenticationTokenFilter
//        http.addFilterBefore(jwtAuthenticationTokenFilter,
//                UsernamePasswordAuthenticationFilter.class);
    }


    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }


//    /**
//     * 创建两个用户绑定角色
//     */
//    @Override
//    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth.inMemoryAuthentication()
//                .withUser("admin")
//                .password(new BCryptPasswordEncoder().encode("123"))
//                .roles("admin")
//                .and()
//                .withUser("wangze")
//                .password(new BCryptPasswordEncoder().encode("123"))
//                .roles("user");
//    }
//
//    /**
//     * 配置表单登录
//     */
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http.csrf().disable().formLogin();
//    }


}
