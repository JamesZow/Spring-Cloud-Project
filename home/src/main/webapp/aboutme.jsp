<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>关于我</title>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="lib/elementui/theme-chalk/index.css" type="text/css">
    <style>
      .abbox { margin: 20px auto; width: 1100px; overflow: hidden; clear: both }
      .aboutme { background: #FFF; border-radius: 10px; overflow: hidden; width: 300px;margin: auto;}
      .ab_title { text-align: center; position: relative; margin: 20px; }
      .ab_title:before { content: ""; width: 25%; height: 2px; background: #000; position: absolute; left: 0; bottom: 8px }
      .ab_title:after { content: ""; width: 25%; height: 2px; background: #000; position: absolute; right: 0; bottom: 8px }
      .ab_con { line-height: 30px; padding: 10px; }
      .ab_con p { background: #f6f6f6; margin: 5px 0; padding-left: 10px; border-radius: 5px; text-shadow: rgba(255, 255, 255, 0.3) 0px 1px 0px; }
      .avatar { width: 100px; height: 100px; overflow: hidden; border-radius: 50px; margin: auto; }
      .avatar img { width: 100px; height: 100px }
    </style>
</head>
<body>
<div id="app">
  <div class="aboutme">
    <h2 class="ab_title">关于我</h2>
    <div class="avatar"><img src="img/touxiang.jpg"></div>
    <div class="ab_con">
      <p>职业：java 开发工程师</p>
      <p>籍贯：中国</p>
      <p>邮箱：18601701547@163.com</p>
      <p>github：<a href="https://github.com/JamesZow" target="_blank">JamesZow</a></p>
      <p style="color:red;">查看源码请到github，喜欢记得star哦,谢谢</p>
    </div>
  </div>
</div>
<!-- 引入组件库 -->
<script type="text/javascript" src="lib/vue.js"></script>
<script type="text/javascript" src="lib/elementui/index.js"></script>

<script type="text/javascript">
    new Vue({
        el: "#app",
        data: {

        },
        methods: {

        }
    });
</script>

</body>

</html>
