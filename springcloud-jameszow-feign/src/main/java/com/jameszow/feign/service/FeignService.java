package com.jameszow.feign.service;

import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 描述:
 * Feign Service层
 * 此接口是掉用sping-cloud-deeplearning4j服务
 *
 * @author James Zow
 * @create 2019-01-19 18:38
 */
@FeignClient(value = "spring-cloud-deeplearning4j")
public interface FeignService {

    @RequestMapping(value = "/deepA")
    void excueDeeplearning();
}
