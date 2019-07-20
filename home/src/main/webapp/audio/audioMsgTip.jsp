<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>测试</title>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="../js/elementui/theme-chalk/index.css" type="text/css">
</head>
<body>
<div id="app">
    <p style="color: red;">播放声音提示，不自动播放，点击按钮才播放</p>

    <audio ref="msgTipAudio" controls="controls">
        <source src="tip.mp3" type="audio/mpeg"/>
        Your browser does not support the audio element.
    </audio>

    <el-button type="primary" @click="playAudio">播放</el-button>
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
            playAudio(){
                this.$refs.msgTipAudio.play().catch(this.catchException);
            },
            catchException: function(exceptionMsg){
                var _self = this;
                console.error(exceptionMsg);
                _self.$message({
                    type: 'error',
                    message: '该浏览器不支持播放声音！解决方案：1、点击该弹出框。或者 1、打开chrome；' +
                    '2、输入 chrome://flags/#autoplay-policy；3、点击default，选择 Setting No user gesture is required；' +
                    '4、重启chrome；',
                    duration: 0
                });
            }
        }
    });
</script>

</body>

</html>
