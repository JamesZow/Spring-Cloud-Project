<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>本页面跳转页面test</title>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="../js/elementui/theme-chalk/index.css" type="text/css">
</head>
<body>
<div id="app">

  <p style="color: red;">这是页面1，
    测试从当前页面跳到另外一个页面（使用window.location.href），
    然后点返回按钮回到当前页面，经测试会刷新页面</p>

  <div>
    <el-input style="width:100px" v-model="inputStr"></el-input>
    <el-button type="primary" plain @click="clickSkip">点击跳转到页面2</el-button>
  </div>
</div>
<!-- 引入组件库 -->
<script type="text/javascript" src="../js/vue.js"></script>
<script type="text/javascript" src="../js/elementui/index.js"></script>

<script type="text/javascript">

    new Vue({
        el: "#app",
        data: {
          inputStr : ""
        },
        methods: {
          clickSkip(){
            window.location.href = "skipPage2.jsp";
          }
        }
    });
</script>

</body>

</html>
