<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>使用require的组件demo</title>
</head>
<body>
<div id="app">
    <p style="color:red;">使用require的组件demo</p>
    <input id="val1" v-model="value1">
    <button @click="clickBtn">点击打印</button>
    <p></p>
    <component-input :name.sync="value1"></component-input>
</div>
<!-- 引入组件库 -->
<script type="text/javascript" src="../../js/vue.js"></script>
<script type="text/javascript" src="../../js/elementui/index.js"></script>
<script type="text/javascript" src="../../js/requirejs/require.js"></script>

<script type="text/javascript">

    new Vue({
        el: "#app",
        data: {
            value1: ""
        },
        components : {
            'component-input' : function(resolve){
                require(['./componentInputForRequire'], resolve);
            }
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
