<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>测试</title>
    <link rel="stylesheet" href="../js/elementui/theme-chalk/index.css" type="text/css">
</head>
<body>
<div id="app">
    <p style="color: red;">动态修改校验规则</p>

    <br/>
    <el-form :model="ruleForm" :rules="rules" ref="formRef">
      <el-form-item label="名称（必须包含123）" prop="name">
        <el-input v-model="ruleForm.name"></el-input>
      </el-form-item>
    </el-form>
    <el-button type="primary" @click="submitBtn">提交</el-button>
    <el-button @click="clickBtn">更改校验规则</el-button>
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
            ruleForm : {
              name : ""
            },
            rules : {
              'name' : [
                 { required: true, message: '请输入名称', trigger: ['change', 'blue'] },
                 { validator: validateName, trigger:  ['change', 'blue'] }
              ]
            }
        },
        methods: {
          submitBtn : function(){
            this.$refs["formRef"].validate((valid) => {
              if(valid){

              }
            });
          },
          clickBtn : function(){
            this.$refs.formRef.clearValidate();
            this.$refs.formRef.rules.name = [
              { min: 3, max: 5, message: '长度在 3 到 5 个字符', trigger:  ['change', 'blue'] }
            ]
          }
        }
    });
</script>

</body>

</html>
