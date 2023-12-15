package com.cloud.order.fegin;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(contextId = "feginOrderClient", value = "mcroservice-order")
public interface  FeginOrderClient {

    @GetMapping("order/config/info")
    String getConfigInfo();
}
