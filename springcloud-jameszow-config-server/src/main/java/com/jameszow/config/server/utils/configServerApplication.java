package com.jameszow.config.server.utils;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

/**
 * 描述：
 * springcloud 配置中心服务启动类
 *
 * @author: James Zow
 * @create: 2019-02-26 14:31
 **/
@SpringBootApplication
@EnableConfigServer
@EnableEurekaClient
public class configServerApplication {

    public static void main(String [] args){
        SpringApplication.run(configServerApplication.class,args);
    }

}
