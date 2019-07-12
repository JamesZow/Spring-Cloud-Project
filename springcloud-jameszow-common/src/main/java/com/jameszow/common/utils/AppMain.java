/**
 * 
 */
package com.jameszow.common.utils;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * 描述:
 *  Common 提供服务的启动类
 *
 * @author James Zow
 * @create 2019-01-9 15:21
 */
@SpringBootApplication
@EnableEurekaClient
@RestController
public class AppMain {
	public static void main(String[] args) {
        SpringApplication.run(AppMain.class, args);
    }

    /**
     * 测试服务是否可以正常掉通
     */
    @Value("${server.port}")
    String port;
    @RequestMapping("/hi")
    public String home(@RequestParam String name) {
        return "hi "+name+",i am from port:" +port;
    }

}
