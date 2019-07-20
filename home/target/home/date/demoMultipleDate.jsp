<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>多日期选择</title>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="../js/elementui/theme-chalk/index.css" type="text/css">
</head>
<body>
<div id="app">
  <p style="color: red;">时间控件年月，有默认值，设置时间控件不可输入</p>
    <span>月</span>
    <el-date-picker
      v-model="monthValue"
      type="month"
      :editable = "false"
      placeholder="选择月">
    </el-date-picker>

<p style="color: red;">时间控件选择多个日期，有默认值，设置时间控件不可输入</p>
    <p></p>
    <span class="demonstration">多个日期</span>
    <el-date-picker
      ref="datesRef"
      type="dates"
      v-model="dateArr"
      :editable = "false"
      format="yyyy-MM-dd"
      value-format="yyyy-MM-dd"
      placeholder="选择一个或多个日期">
    </el-date-picker>

    <el-button type="primary" @click="clickBtn" class="btn">打印选择的时间</el-button>

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
            monthValue : "2018-06",
            dateArr: [],
            printStr: ""
        },
        methods: {
            clickBtn: function () {
                this.printStr = this.dateArr ? this.dateArr.join() : "";
            }
        },
        mounted: function(){
          //为了解决bug，所以默认值放在了这里
          this.$nextTick(function(){
            this.dateArr = ["2018-08-03","2018-08-06"];
            this.$refs.datesRef.showPicker();
            this.$refs.datesRef.hidePicker();
          });
        }
    });
</script>

</body>

</html>
