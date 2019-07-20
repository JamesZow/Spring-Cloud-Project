<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>测试</title>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="../js/elementui/theme-chalk/index.css" type="text/css">
</head>
<body>
<div id="app">
  <p style="color: red;">时间控件选择年月日时分，时间控件不可输入</p>

    <el-date-picker
            v-model="value1"
            type="datetime"
            format="yyyy-MM-dd HH:mm"
            value-format="yyyy-MM-dd HH:mm"
            :editable = "false"
            placeholder="选择日期时间">
    </el-date-picker>
    <el-button type="primary" @click="clickBtn">打印选择的时间</el-button>

    <div style="margin-top: 20px">
      <span>打印区</span>
      <el-input type="textarea" v-model="printStr"></el-input>
    </div>
</div>
<!-- 引入组件库 -->
<script type="text/javascript" src="../js/vue.js"></script>
<script type="text/javascript" src="../js/elementui/index.js"></script>

<script type="text/javascript">
    new Vue({
        el: "#app",
        data: {
            value1: "",
            printStr: ""
        },
        methods: {
            clickBtn: function () {
                this.printStr = this.value1
            }
        }
    });
</script>

</body>

</html>
