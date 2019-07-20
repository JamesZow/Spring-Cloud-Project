<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>本页面跳转页面test</title>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="../js/elementui/theme-chalk/index.css" type="text/css">
</head>
<body>
<div id="app">

  <p style="color: red;">这是页面2，点击返回就回到刚刚那个页面，使用window.history.go(-1)</p>

  <div>
    <el-button type="primary" plain @click="clickReturn">点击回到到页面1</el-button>
  </div>
</div>
<!-- 引入组件库 -->
<script type="text/javascript" src="../js/vue.js"></script>
<script type="text/javascript" src="../js/elementui/index.js"></script>

<script type="text/javascript">

    new Vue({
        el: "#app",
        data: {
        },
        methods: {
          clickReturn(){
            window.history.go(-1);
          }
        }
    });
</script>

</body>

</html>
