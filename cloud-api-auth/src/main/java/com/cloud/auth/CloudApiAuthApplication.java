package com.cloud.auth;

import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;

/**
 * 认证授权中心  授权服务器
 */
@SpringCloudApplication
@EnableFeignClients
public class CloudApiAuthApplication {

    public static void main(String[] args) {
        SpringApplication.run(CloudApiAuthApplication.class, args);
    }

}
