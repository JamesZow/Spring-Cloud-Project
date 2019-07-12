package com.jameszow.zuul.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;


/**
 * 描述:
 *  Common zuul路由网关服务
 *
 * @author James Zow
 * @create 2019-02-22 13:10
 */
@SpringBootApplication
@EnableEurekaClient
@EnableZuulProxy
public class zuulApplication {

    public static Logger log = LoggerFactory.getLogger(zuulApplication.class);

    public static void main(String[] args){
        log.info("注册zuul 路由网关到Eureka");
        SpringApplication.run(zuulApplication.class, args);
    }
}
