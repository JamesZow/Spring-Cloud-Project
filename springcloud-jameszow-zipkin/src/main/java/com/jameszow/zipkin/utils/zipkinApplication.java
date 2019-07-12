package com.jameszow.zipkin.utils;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import zipkin.server.internal.EnableZipkinServer;

/**
 * 描述：
 * zipkin服务端 启动类
 *
 * @author: James Zow
 * @create: 2019-02-27 11:15
 **/
@SpringBootApplication
@EnableZipkinServer
public class zipkinApplication {

    public static void main(String [] args){
        SpringApplication.run(zipkinApplication.class, args);
    }
}
