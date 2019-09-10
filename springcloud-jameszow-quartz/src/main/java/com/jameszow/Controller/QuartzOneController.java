package com.jameszow.Controller;

import com.jameszow.quartz.QuartzOne;
import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 描述：
 * 该类是用于实现quartz包下的定时job
 *
 * @author: James Zow
 * @create: 2019-09-09 16:30
 **/
//@RestController
//public class TestQuartzOne implements Job{
//
//    private QuartzOne quartzOne;
//
//    @Override
//    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
//        System.out.println("11111");
//    }
//
//    @RequestMapping(value = "/test")
//    public void test(){
//
//    }
//}
