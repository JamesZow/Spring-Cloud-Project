package com.jameszow.config.client.utils;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.context.annotation.Bean;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
/**
 * 描述：
 * config-client配置中心客户端启动类
 *
 * @author: James Zow
 * @create: 2019-02-26 15:12
 **/
@SpringBootApplication
@RestController
@EnableEurekaClient
public class configClientApplication {

    public static void main(String [] args){
        SpringApplication.run(configClientApplication.class,args);
    }

    /**
     * 此方法是为com/jameszow/config/client/utils/configClientApplication.java:31了解决 在多模块下进行编程时，如果有Config Client在运行时，回去配置文件找$(foo)的值
     * 在第一个application.properties下找不到的时候 就让他继续去找，以至于不会报错启动不了该springboot实例
     * @return
     */
    @Bean
    public static PropertySourcesPlaceholderConfigurer placeholderConfigurer() {
       PropertySourcesPlaceholderConfigurer c = new PropertySourcesPlaceholderConfigurer();
       c.setIgnoreUnresolvablePlaceholders(true);
       return c;
    }
    
    /**
     * 此方法 是 调用获取 config-server 下的某个属性，而config-server是从远程仓库拿取这个属性值
     */
    @Value("${name}")
    private String name;

    @RequestMapping (value = "/name")
    public String configServertTest(){
        return name;
    }


}
