package com.jameszow.serverprovide.utils;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 描述：
 * consul 服务注册，对外提供服务调用
 *
 * @author: James Zow
 * @create: 2019-03-22 19:57
 **/
@SpringBootApplication
@EnableDiscoveryClient
@RestController
public class consulServerProvideApplication {


    @RequestMapping(value = "/test")
    public String test(){
        return "Hello Consul Server";
    }

    @RequestMapping(value = "/health")
    public String health(){
        return "health";
    }

    public static void main(String[] args){
        SpringApplication.run(consulServerProvideApplication.class, args);
    }
}
