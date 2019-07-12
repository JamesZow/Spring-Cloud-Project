package com.jameszow.serverconsumption.utils;

import org.apache.commons.codec.digest.PureJavaCrc32;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.cloud.client.loadbalancer.LoadBalancerClient;
import org.springframework.context.annotation.Bean;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

/**
 * 描述：
 * consul 服务消费者
 *
 * @author: James Zow
 * @create: 2019-03-22 20:22
 **/
@SpringBootApplication
@EnableDiscoveryClient
@RestController
public class consulServerConsumptionApplication {

    @Autowired
    RestTemplate restTemplate;

    @Autowired(required = true)
    private LoadBalancerClient loadBalancerClient;

    @Autowired(required = true)
    private DiscoveryClient discoveryClient;

    /**
     * 从现有服务中选择一个服务（轮询）
     * 这里的serviceID是 consul module项目里 服务提供者的 id
     */
    @RequestMapping(value = "/discover")
    public Object discover(){
        return loadBalancerClient.choose("consul-server-provide").getUri().toString();
    }

    @Bean
    @LoadBalanced
    public RestTemplate restTemplate(){
        return new RestTemplate();
    }

    @RequestMapping(value = "/test" ,method = RequestMethod.GET)
    public String hi(){
        return restTemplate.getForEntity("http://consul-server-provide/test",String.class).getBody();
    }

    /**
     * 获取所有服务
     */
    @RequestMapping(value = "/services")
    public Object services(){
        return discoveryClient.getInstances("consul-server-provide");
    }

    /**
     * 启动方法
     */
    public static void main(String [] args){
        SpringApplication.run(consulServerConsumptionApplication.class,args);
    }

}
