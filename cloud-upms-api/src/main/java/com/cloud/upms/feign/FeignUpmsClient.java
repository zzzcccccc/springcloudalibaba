package com.cloud.upms.feign;


import com.api.commons.result.RES;
import com.cloud.upms.entity.SysUser;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(contextId = "feignUpmsClient", value = "cloud-upms-biz")
public interface FeignUpmsClient {

    @GetMapping("user/getInfoByUserName/{userName}")
    SysUser getInfoByUserName(@PathVariable(value = "userName") String userName);
}
