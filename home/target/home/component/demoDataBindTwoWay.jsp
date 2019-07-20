<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>数据的双向绑定</title>
</head>
<body>
<div id="app">
  <p style="color:red;">vue的组件，这里实现父子组件的数据双向绑定</p>
    <input id="val1" v-model="value1">
    <button @click="clickBtn">点击打印</button>
    <p></p>
    <component-input :name.sync="value1"></component-input>
</div>
<!-- 引入组件库 -->
<script type="text/javascript" src="../js/vue.js"></script>

<script type="text/javascript">
    var componentInput = {
        template : "<div>子组件<input v-model='curName'></div>",
        data : function(){
            return {
                curName : this.name
            }
        },
        props : ['name'],
        watch : {
            'name' : function(newVal, oldVal){
                this.curName = newVal;
            },
            curName : function(newVal, oldVal){
                this.$emit("update:name", newVal);
            }
        }
    };

    new Vue({
        el: "#app",
        data: {
            value1: ""
        },
        components : {
            'component-input' : componentInput
        },
        methods: {
            clickBtn: function () {
                alert(this.value1);
            }
        }
    });
</script>

</body>

</html>
