package com.cloud.payment.fegin;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(contextId = "feginPaymentClient", value = "mcroservice-payment")
public interface FeginPaymentClient {

    @GetMapping("config/info")
    String getConfigInfo();
}
