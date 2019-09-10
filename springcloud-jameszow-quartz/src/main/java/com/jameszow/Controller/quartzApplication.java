package com.jameszow.job;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;

@SpringBootApplication
public class quartzApplication {
    public static void main(String [] args) {
        new SpringApplicationBuilder(quartzApplication.class).run(args);
    }
}
