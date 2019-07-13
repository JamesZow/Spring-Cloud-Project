/**
 * 
 */
package com.jameszow.eureka.test;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

/**
 * 描述:
 *  Eureka启动类
 *
 * @author James Zow
 * @create 2019-01-9 13:40
 */
@SpringBootApplication //spring-boot 启动注解
@EnableEurekaServer // sprihttps://github.com/JamesZow/Spring-Cloud-Project.gitng-cloud 服务注解
public class RegisterMain {
	 public static void main(String [] args) {
    	 new SpringApplicationBuilder(RegisterMain.class).run(args);
     }
}
