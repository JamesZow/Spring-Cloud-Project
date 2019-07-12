/**
 * 
 */
package com.jameszow.ribbon.controller;

import com.jameszow.ribbon.services.HelloJamesService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 * 描述:
 *  Ribbon 测试Controller 消费服务
 *
 * @author James Zow
 * @create 2019-01-10 08:36
 */
@RestController
public class HelloController {

	public Logger log = LoggerFactory.getLogger(HelloController.class);

	@Autowired
	public HelloJamesService helloService;

	@RequestMapping(value = "/hello")
	public String Hello(@RequestParam String name) {
		log.info("访问Ribbon的名称："+name);
		return helloService.helloService(name);
	}
}
