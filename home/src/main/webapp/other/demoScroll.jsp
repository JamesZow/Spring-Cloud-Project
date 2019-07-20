<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>测试</title>
    <style>
        #div1{
            border: 1px solid;
            height: 200px;
            width: 200px;
            padding: 10px;
            margin: 200px;

            /*浮动*/
            overflow: auto;
        }
        #fixDiv{
            background-color: antiquewhite;
        }
    </style>
</head>
<body>
  <p style="color:red;">随便滚动条在哪个位置，都可以将数据固定在可视区域，想试试就滚动滚动条，然后点击按钮即可。</p>

<div id="div1">
    <div>sdf</div>
    <div>地方</div>
    <div>水电费</div>
    <div>史蒂夫</div>
    <div>鬼地方个</div>
    <div>史3玩儿</div>
    <div>史3水电费玩儿</div>
    <div>212</div>
    <div>435 </div>
    <div>电饭锅</div>
    <div>规划局</div>
    <div>好久</div>
    <div>水电费</div>
    <div>史3水电费玩儿</div>
    <div>34</div>
    <div>的</div>
    <div>45</div>
    <div>sdf</div>
    <div>地方</div>
    <div>水电费</div>
    <div>史蒂夫</div>
    <div id="fixDiv">固定在可视区域上方</div>
    <div>史3玩儿</div>
    <div>史3水电费玩儿</div>
    <div>212</div>
    <div>435 </div>
    <div>电饭锅</div>
    <div>规划局</div>
    <div>好久</div>
    <div>水电费</div>
    <div>史3水电费玩儿</div>
    <div>34</div>
    <div>的</div>
    <div>45</div>
</div>

<button id="btn">点击到固定元素处</button>

<script type="text/javascript" src="../js/jquery.js"></script>

<script type="text/javascript">

    var $div = $("#div1");
    //262 222 220 200
    console.log($div.outerHeight(true), $div.outerHeight(false), $div.outerHeight(), $div.innerHeight(), $div.height());

    var div = $div[0];
    //220 222 734 20 0
    console.log(div.clientHeight, div.offsetHeight, div.scrollHeight, div.offsetTop, div.scrollTop);

    $("#btn").click(function(){
        //判断一个元素是否在滚动的可视区域内，不在就固定到可视区域的上方。
        var fixDiv = $("#fixDiv");
        var divs = $("#div1").find("div");
        var fixDivIndex = divs.index(fixDiv);
        var oneDivHeight = fixDiv.height();
        var fixDivScrollTop = fixDivIndex * oneDivHeight;//这个元素正好在可视区域上方的scrollTop值
        var divCurrentScrollTop = $("#div1").scrollTop();
        if(fixDivScrollTop > divCurrentScrollTop > fixDivScrollTop - $("#div1").height()){
            //在可视区域内
        }else if(fixDivScrollTop < divCurrentScrollTop || divCurrentScrollTop < fixDivScrollTop - $("#div1").height()){
            $("#div1").scrollTop(fixDivScrollTop);
        }
    });
</script>

</body>

</html>
