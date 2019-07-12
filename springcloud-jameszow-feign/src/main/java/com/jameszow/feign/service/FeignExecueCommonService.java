package com.jameszow.feign.service;

import com.jameszow.feign.serviceimpl.FeignExecueCommonErrorServiceImpl;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * 描述:
 * Feign Service层
 * 此接口是掉用sping-cloud-common服务
 * 添加了对Feign配置的Hystrix断路器的支持,Dalston版本应该 添加一个properties文件 并且声明
 * feign.hystrix.enabled=true 然后开启断路器
 * @author James Zow
 * @create 2019-01-19 18:38
 */
@FeignClient(value = "spring-cloud-common",fallback = FeignExecueCommonErrorServiceImpl.class)
public interface FeignExecueCommonService {

    @RequestMapping(value = "/hi")
    String hi(@RequestParam(value = "name") String name);
}
