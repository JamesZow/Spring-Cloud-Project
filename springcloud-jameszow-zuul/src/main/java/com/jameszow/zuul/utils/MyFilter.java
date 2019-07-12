package com.jameszow.zuul.utils;

import com.netflix.zuul.ZuulFilter;
import com.netflix.zuul.context.RequestContext;
import com.netflix.zuul.exception.ZuulException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;

/**
 * 描述：
 * 过滤器
 *
 * @author: James Zow
 * @create: 2019-02-25 15:11
 **/
@Component
public class MyFilter extends ZuulFilter {

    private Logger log = LoggerFactory.getLogger(MyFilter.class);

    @Override
    public String filterType() {
        return "pre";
    }

    @Override
    public int filterOrder() {
        return 0;
    }

    @Override
    public boolean shouldFilter() {
        return true;
    }

    @Override
    public Object run() throws ZuulException {
        log.info("zuul过滤开始......");
        RequestContext requestContext = new RequestContext();
        HttpServletRequest request = requestContext.getRequest();
        Object accsToken = request.getParameter("token");
        if (accsToken == null || accsToken == ""){
            log.info("token为空");
            requestContext.setSendZuulResponse(false);
            requestContext.setResponseStatusCode(401);
            try {
                requestContext.getResponse().getWriter().write("token is empty");
            } catch (Exception e) {
                log.error("MyFilter run method error !!!");
                e.printStackTrace();
                return null;
            }
        }
        log.info("zuul过滤结束......");
        return null;
    }
}
