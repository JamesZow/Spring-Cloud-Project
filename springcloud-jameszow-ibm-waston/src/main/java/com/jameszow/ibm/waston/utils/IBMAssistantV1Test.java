package com.jameszow.ibm.waston.utils;

import com.google.gson.JsonObject;
import com.ibm.watson.developer_cloud.assistant.v1.Assistant;
import com.ibm.watson.developer_cloud.assistant.v1.model.InputData;
import com.ibm.watson.developer_cloud.assistant.v1.model.MessageOptions;
import com.ibm.watson.developer_cloud.assistant.v1.model.MessageResponse;
import com.ibm.watson.developer_cloud.service.security.IamOptions;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 描述：
 * IBM WASTON 聊天机器人测试类1
 *
 * @author: James Zow
 * @create: 2019-03-06 13:25
 **/
@SpringBootApplication
public class IBMAssistantV1Test {

    public static void main(String [] args){

        SpringApplication.run(IBMAssistantV1Test.class,args);

        IamOptions iamOptions = new IamOptions.Builder()
                .apiKey("QClIOIi4xofqrqeA8MLcarnHB_5WJn3tbefLbTEloiXK")
                .build();

        Assistant assistant = new Assistant("2019-03-06");
        assistant.setUsernameAndPassword("apikey","QClIOIi4xofqrqeA8MLcarnHB_5WJn3tbefLbTEloiXK");
        assistant.setEndPoint("https://gateway.watsonplatform.net/assistant/api");

        InputData input = new InputData.Builder("test").build();
        MessageOptions options = new MessageOptions.Builder("2ea4a962-36dc-4f7f-af33-477d7fe6d466")
          .input(input)
          .build();
        MessageResponse response = assistant.message(options).execute();
        System.out.println(response);

        /**
         *  将返回的 response 存放在 threadLocal 变量中
         */
        ThreadLocal threadLocal = new ThreadLocal();
        threadLocal.set(response);
    }
}
