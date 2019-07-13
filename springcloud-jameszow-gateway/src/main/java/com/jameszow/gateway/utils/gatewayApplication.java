package com.jameszow.gateway.utils;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 描述:
 *  Common zuul路由网关服务
 *
 * @author James Zow
 * @create 2019-07-13 12:35
 */
@SpringBootApplication
public class gatewayApplication {
    public static Logger log = LoggerFactory.getLogger(gatewayApplication.class);

    public static void main(String[] args){
        SpringApplication.run(gatewayApplication.class, args);
    }
}
