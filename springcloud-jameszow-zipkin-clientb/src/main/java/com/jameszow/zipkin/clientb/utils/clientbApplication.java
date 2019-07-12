package com.jameszow.zipkin.clientb.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

/**
 * 描述：
 * 测试zipkin 的客户端B 启动类
 *
 * @author: James Zow
 * @create: 2019-02-27 11:31
 **/
@SpringBootApplication
@RestController
public class clientbApplication {

    public static Logger log = LoggerFactory.getLogger(clientbApplication.class);

    public static void main(String [] args){
        log.info("测试zipkin 客户端B 启动类开始......");
        SpringApplication.run(clientbApplication.class,args);
    }

    @RequestMapping(value = "/hello")
    public String hello(){
        return "hello clientb !!!!!";
    }

    @RequestMapping(value = "/info")
    public String selfinfo(){
        return restTemplate.getForObject("http://localhost:8988/hi",String.class);
    }

    @Autowired
    public RestTemplate restTemplate;

    @Bean
    public RestTemplate getRestTemplate(){
        return new RestTemplate();
    }
}
