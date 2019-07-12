/**
 * 
 */
package com.jameszow.ribbon.utils;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.client.RestTemplate;

/**
 * 描述:
 *  Ribbon 启动类
 *	该层加了注解扫描controller包下所有的controller请求
 * @author James Zow
 * @create 2019-01-9 00:00
 */
@SpringBootApplication
@EnableEurekaClient
@ComponentScan(value = "com.jameszow.ribbon")
@EnableHystrix
public class ServiceRibbonApplication {
	
	public static void main(String[] args) {
		SpringApplication.run(ServiceRibbonApplication.class, args);
	}
	
	@Bean
	@LoadBalanced
	RestTemplate restTemplate() {
		return new RestTemplate();
	}

}
