package com.jameszow.deeplearning4j;

import com.jameszow.deeplearning4j.server.Deeplearning4jTestAService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 描述:
 * 深度学习测试类：一
 *
 * @author James Zow
 * @create 2019-01-19 12:44
 */
@RestController
public class Deeplearning4jTestA {

    private Logger log = LoggerFactory.getLogger(Deeplearning4jTestA.class);

    @Autowired
    Deeplearning4jTestAService deeplearning4jTestAService;

    @RequestMapping(value = "/deepA")
    public void DeepA(){
        log.info("开始深度训练数据模型");
        deeplearning4jTestAService.deeplearningTest();
    }
}