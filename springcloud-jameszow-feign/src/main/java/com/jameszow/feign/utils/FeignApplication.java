package com.jameszow.feign.utils;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.cloud.netflix.hystrix.dashboard.EnableHystrixDashboard;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.ComponentScan;

/**
 * 描述:
 * feign 启动类
 * 如果feign 分不同包下需要在@EnableFeignClients 注解上 加上 basePackages 扫描包用，不然会报not found
 * @ComponentScan 扫描包 是 指定controller包下的所有请求
 * @author James Zow
 * @create 2019-01-19 15:42
 * @EnableFeignClients
 */
@SpringBootApplication
@EnableEurekaClient
@EnableHystrix
@EnableHystrixDashboard
@EnableFeignClients(basePackages = {"com.jameszow.feign"})
@ComponentScan(value = "com.jameszow.feign")
public class FeignApplication {

    public static void main(String[] args){
        SpringApplication.run(FeignApplication.class,args);
    }
}