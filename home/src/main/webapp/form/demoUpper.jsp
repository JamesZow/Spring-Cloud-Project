<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>测试</title>
    <link rel="stylesheet" href="../js/elementui/theme-chalk/index.css" type="text/css">
</head>
<body>
<div id="app">
    <p style="color: red;">两种小写转大写的方式；多个场景</p>

    <br/>
    1、显示小写转大写 ：<input id="val1" v-model="value1"> {{ value1 | upper}}

    <br/><br/>
    2、输入框中直接输入小写转大写：
    <input v-model="value2Computed">

    <br/><br/>
    3、form表单中 有校验、并且小写转大小：trigger: 'change'
    <el-form :model="ruleForm" :rules="rules">
      <el-form-item label="名称（必须包含123）" prop="name">
        <el-input v-model="nameComputed"></el-input>
      </el-form-item>
    </el-form>
</div>
<!-- 引入组件库 -->
<script type="text/javascript" src="../js/vue.js"></script>
<script type="text/javascript" src="../js/elementui/index.js"></script>

<script type="text/javascript">
    var validateName = (rule, value, callback) => {
      if (value.indexOf("123") == -1) {
        callback(new Error('请输入包含123'));
      } else {
        callback();
      }
    };
    new Vue({
        el: "#app",
        data: {
            value1: "",
            value2: "",
            ruleForm : {
              name : ""
            },
            rules : {
              'name' : [
                 { required: true, message: '请输入名称', trigger: 'change' },
                 { min: 3, max: 5, message: '长度在 3 到 5 个字符', trigger: 'change' },
                 { validator: validateName, trigger: 'change' }
              ]
            }
        },
        computed : {
            value2Computed : {
                get: function(){
                    return this.value2;
                },
                set : function(val){
                    this.value2 = val.toUpperCase();
                }
            },
            nameComputed : {
              get: function(){
                  return this.ruleForm.name;
              },
              set : function(val){
                  this.ruleForm.name = val.toUpperCase();
              }
            }
        },
        components : {

        },
        filters: {
            upper: function (value) {
                if (!value) return '';
                value = value.toString();
                return value.toUpperCase();
            }
        },
        methods: {
            clickBtn: function () {
                console.log(this.value1);
            }
        }
    });
</script>

</body>

</html>
