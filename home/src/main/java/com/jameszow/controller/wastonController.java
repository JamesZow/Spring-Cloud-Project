package com.jameszow.controller;

import com.jameszow.server.wastonOne;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RequestMapping(value = "/waston")
@RestController
public class wastonController {

    public Logger Log = Logger.getLogger(wastonController.class);

    @Resource
    private wastonOne waston;

    @RequestMapping(value = "/test")
    public String test(){
        String a = waston.wastonRot();
        Log.info(a);
        return a;
    }

    @RequestMapping(value = "/aa")
    public  void aVoid(){
        System.err.print("JINLAI  LE !!!!!");
    }
}
