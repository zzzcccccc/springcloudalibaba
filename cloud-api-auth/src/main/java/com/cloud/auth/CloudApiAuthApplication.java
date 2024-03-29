package com.cloud.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

/**
 * 认证授权中心  授权服务器
 */
@SpringCloudApplication
@EnableFeignClients("com.cloud.*")
@EnableSwagger2
public class CloudApiAuthApplication {

    public static void main(String[] args) {
        SpringApplication.run(CloudApiAuthApplication.class, args);
    }

}
