package com.jameszow.serverImpl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ibm.watson.developer_cloud.assistant.v1.Assistant;
import com.ibm.watson.developer_cloud.assistant.v1.model.InputData;
import com.ibm.watson.developer_cloud.assistant.v1.model.MessageOptions;
import com.ibm.watson.developer_cloud.assistant.v1.model.MessageResponse;
import com.ibm.watson.developer_cloud.service.security.IamOptions;
import com.jameszow.server.wastonOne;
import org.springframework.stereotype.Service;

@Service
public class wastonOneImpl implements wastonOne {

    public String wastonRot(){
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
        JSONObject jsonObject = JSON.parseObject(response.toString());
        String output = jsonObject.get("output").toString();
        JSONObject jsonObject2 = JSON.parseObject(output);
        String result = jsonObject2.get("text").toString();
        System.out.println(result);
        return result;
    }
}
