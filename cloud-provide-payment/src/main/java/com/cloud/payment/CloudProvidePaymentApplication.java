package com.cloud.payment;

import com.cloud.payment.fegin.FeginPaymentClient;
import org.springframework.boot.SpringApplication;
import org.springframework.cloud.client.SpringCloudApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
import springfox.documentation.swagger2.annotations.EnableSwagger2;


@SpringCloudApplication
@EnableSwagger2
@EnableFeignClients("com.cloud.*")
public class CloudProvidePaymentApplication {
    public static void main(String[] args) {
        SpringApplication.run(CloudProvidePaymentApplication.class,args);
    }

}