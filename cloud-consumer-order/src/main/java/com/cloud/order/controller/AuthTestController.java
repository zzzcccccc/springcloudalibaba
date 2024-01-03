package com.cloud.order.controller;

import cn.hutool.core.lang.TypeReference;
import cn.hutool.http.HttpRequest;
import cn.hutool.http.HttpUtil;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import com.google.gson.reflect.TypeToken;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping
@Api(value = "测试", tags = "测试")
public class AuthTestController {
    @Autowired
    private RestTemplate restTemplate;

    /**
     *
     * @param code
     * @param model
     * @return
     */
    @GetMapping("/index.html")
    public String hello(String code, Model model) {
        if (code != null) {
            HashMap<String, Object> map = new HashMap<>();
            map.put("code", code);
            map.put("client_id", "wz-app");
            map.put("client_secret", "123");
            map.put("redirect_uri", "http://localhost:8002/index.html");
            map.put("grant_type", "authorization_code");


            //获取令牌 restTemplate方式远程调用
           // Map<String,String> resp = restTemplate.postForObject("http://localhost:8081/oauth/token", map, Map.class);
            // String access_token = resp.get("access_token");

            //hutool工具
            String resp1 = HttpUtil.post("http://localhost:8081/oauth/token", map);
            // jsonString转换成Map
             Map<String, String> res = null;
                try {
                    Gson gson = new Gson();
                    res = gson.fromJson(resp1, new TypeToken<Map<String, Object>>() {
                    }.getType());
                } catch (JsonSyntaxException e) {
                }
            String access_token = res.get("access_token");


            //请求资源
            System.out.println("令牌： "+access_token);
            HttpHeaders headers = new HttpHeaders();
            headers.add("Authorization", "Bearer " + access_token);
            HttpEntity<Object> httpEntity = new HttpEntity<>(headers);
            ResponseEntity<String> entity = restTemplate.exchange("http://localhost:8082/admin/res", HttpMethod.GET, httpEntity, String.class);
            model.addAttribute("token","令牌："+access_token);
            model.addAttribute("res", "资源"+entity.getBody());

            return entity.getBody();
            //资源二次处理入库…………


        }
        return "index";
    }

}
