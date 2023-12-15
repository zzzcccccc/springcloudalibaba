package com.cloud.order.controller;

import com.cloud.payment.fegin.FeginPaymentClient;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
@RequestMapping(value = "/order")
//@RefreshScope 该注解支持nacos的动态刷新的功能，Springcloud原生的注解，实现配置自动更新
@RefreshScope
@Api(value = "测试", tags = "测试")
public class OrderController {

    @Resource
    private FeginPaymentClient feginPaymentClient;

    @Value("${config.info}")
    private  String configInfo;

    @ApiOperation(value = "测试", notes = "测试")
    @GetMapping("/config/info")
    public String getConfigInfo(){
        System.out.println(configInfo);
        return configInfo;
    }

    @ApiOperation(value = "测试222", notes = "测试222")
    @GetMapping("/fegin/info")
    public String getConfigInfo222(){
        String configInfo1 = feginPaymentClient.getConfigInfo();
        System.out.println(configInfo1);
        return configInfo1;
    }

}
