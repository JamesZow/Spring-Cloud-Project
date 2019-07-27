/**
 * 
 */
package com.jameszow.eureka.test;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 描述:
 *  Eureka启动类
 *
 * @author James Zow
 * @create 2019-01-9 13:40
 */
@Controller
@RequestMapping("/eurekaServer")
@SpringBootApplication //spring-boot 启动注解
@EnableEurekaServer // sprihttps://github.com/JamesZow/Spring-Cloud-Project.gitng-cloud 服务注解
public class RegisterMain {

	@RequestMapping(value = "/run")
	public static void main(String [] args) {
    	 new SpringApplicationBuilder(RegisterMain.class).run(args);
     }
}
