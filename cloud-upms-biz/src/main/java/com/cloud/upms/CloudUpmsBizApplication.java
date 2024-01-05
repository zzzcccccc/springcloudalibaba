package com.cloud.upms;

import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import springfox.documentation.swagger2.annotations.EnableSwagger2;


@SpringCloudApplication
@EnableSwagger2
@EnableFeignClients("com.cloud.*")
public class CloudUpmsBizApplication {
    public static void main(String[] args) {
        SpringApplication.run(CloudUpmsBizApplication.class,args);
    }

}