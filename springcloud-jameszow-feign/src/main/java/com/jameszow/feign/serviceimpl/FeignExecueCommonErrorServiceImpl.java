package com.jameszow.feign.serviceimpl;

import com.jameszow.feign.service.FeignExecueCommonService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * 描述:
 * 断路器默认错误文件
 *
 * @author James Zow
 * @create 2019-01-20 12:17
 */
@Component
public class FeignExecueCommonErrorServiceImpl implements FeignExecueCommonService {

    private Logger log = LoggerFactory.getLogger(FeignExecueCommonErrorServiceImpl.class);

    @Override
    public String hi(String name) {
        log.info("Feign 访问common服务 进断路器了");
        return name + " 访问spring-cloud-common服务错误";
    }
}