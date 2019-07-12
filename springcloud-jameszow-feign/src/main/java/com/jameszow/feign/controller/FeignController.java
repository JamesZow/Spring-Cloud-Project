package com.jameszow.feign.controller;

import com.jameszow.feign.service.FeignExecueCommonService;
import com.jameszow.feign.service.FeignService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * 描述:
 * Feign 控制层
 *
 * @author James Zow
 * @create 2019-01-19 18:38
 */
@RestController
public class FeignController {

    private Logger log = LoggerFactory.getLogger(FeignController.class);

    @Autowired
    public FeignService feignService;

    @Autowired
    public FeignExecueCommonService feignExecueCommonService;

    @RequestMapping(value = "/excuedp4j")
    public void feignTestController(){
        log.info("-----Feign掉用deeplearning服务提供者的深度学习-----");
        feignService.excueDeeplearning();
    }

    @RequestMapping(value = "/excueCommon")
    public String feignExcueCommon(@RequestParam(value = "name") String name){
        return feignExecueCommonService.hi(name);
    }
}