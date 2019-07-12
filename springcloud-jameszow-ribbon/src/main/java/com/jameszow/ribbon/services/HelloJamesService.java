/**
 * 
 */
package com.jameszow.ribbon.services;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

/**
 * 描述:
 *  Ribbon Service测试类
 *
 * @author James Zow
 * @create 2019-01-10 10:20
 */
@Service
public class HelloJamesService {
	
	@Autowired
	RestTemplate restTemplate;

	@HystrixCommand(fallbackMethod = "helloErrorService")
	public String helloService(String name) {
		return restTemplate.getForObject("http://spring-cloud-common/hi?name="+name, String.class);
	}

	public String helloErrorService(String name){
		return name+" Ribbon访问错误---------来自Hystrix的消息" ;
	}
}
