package com.jameszow.deeplearning4j;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.web.bind.annotation.RestController;

/**
 * 描述:
 * spring-cloud-deeplearning4j启动类
 *
 * @author James Zow
 * @create 2019-01-19 11:57
 */
@SpringBootApplication
@EnableEurekaClient
@RestController
public class SpringCloudDepplearning4jMain {

    public static void main(String [] args){
        SpringApplication.run(SpringCloudDepplearning4jMain.class,args);
    }
}