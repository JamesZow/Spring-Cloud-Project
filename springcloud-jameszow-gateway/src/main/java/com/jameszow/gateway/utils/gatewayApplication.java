package com.jameszow.gateway.utils;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;

/**
 * 描述:
 *  Common zuul路由网关服务
 *
 * 该类测试通过请求路径匹配路由规则
 * @author James Zow
 * @create 2019-07-13 12:35
 */
@SpringBootApplication
public class gatewayApplication {
    public static Logger log = LoggerFactory.getLogger(gatewayApplication.class);

    public static void main(String[] args){
        SpringApplication.run(gatewayApplication.class, args);
    }

    /**
     * 这里有两种方法转发路由规则
     * 1. 在配置文件中配置路由
     * 2. 通过代码实现转发规则，不过要注意这里就需要访问到路径就是: 项目名称/test
     * 我这里默认让它跳转到Spring官网，后续可以写上项目路径
     * @param routeLocatorBuilder
     * @return
     */
    @Bean
    public RouteLocator customerRouteLocator(RouteLocatorBuilder routeLocatorBuilder){
        return routeLocatorBuilder.routes()
                .route("number2", r -> r.path("/test")
                .uri("https://spring.io/"))
                .build();
    }

    /**
     *
     * 这里可以通过gateway 到不同路由选择规则 进行转发
     *
     */

}
