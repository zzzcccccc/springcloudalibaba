package com.cloud.resource;

import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;





@SpringCloudApplication
@EnableFeignClients
public class CloudApiResourceApplication {

    public static void main(String[] args) {
        SpringApplication.run(CloudApiResourceApplication.class, args);
    }

}
