<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>Notification 通知</title>
    <!-- 引入样式 -->
    <!-- <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-chalk/index.css"> -->
    <link rel="stylesheet" href="../../js/elementui/theme-chalk/index.css" type="text/css">
</head>
<body>
<div id="app">
    <!--https://htmlpreview.github.io/?https://github.com/yuleGH/hello-world/blob/master/elementNotify.html-->
    <p style="color:red;">每个弹出框都是独立的，可多次弹出，并且可以自定义html，使用vNode，同时支持传参</p>
    <br/>
    <el-button
            plain
            @click="open">
        可自动关闭
    </el-button>
    <el-button
            plain
            @click="open2">
        不会自动关闭
    </el-button>
    <el-button
            plain
            @click="closeAll">
        关闭所有的弹出框
    </el-button>
</div>
<!-- 引入组件库 -->
<script type="text/javascript" src="../../js/vue.js"></script>
<script type="text/javascript" src="../../js/elementui/index.js"></script>

<script type="text/javascript">

    new Vue({
        el: "#app",
        data: {
            dialogArr : []
        },
        methods: {
            clickA(){
                console.log(this);
                alert("处理点击标签");
            },
            clickBtn(event){
              let age = event.target.getAttribute("age");
              let name = event.target.getAttribute("name");
              alert("处理点击按钮，支持传参："+ name + "，" + age);
            },
            closeAll(){
                for(var i = 0; i < this.dialogArr.length; i++){
                    this.dialogArr[i].close();
                }
            },
            open() {
                this.dialogArr.push(this.$notify.info({
                    title: '提示',
                    message: '这是一条会自动关闭的消息'
                }));
            },
            open2() {
              //实现动态传参
              this.openVNode({
                name : "小明",
                age : 23
              });
            },
            openVNode(params){
              const h = this.$createElement;
              this.dialogArr.push(this.$notify({
                  title: '标题名称',
                  message: h('p', null, [
                      h('span', null, '内容可以是 '),
                      h('a', {
                          on:{
                              click:this.clickA
                          },
                          'class': {
                              't-btn': true //加class
                          }
                      }, "可点击的标签"),
                      h('button', {
                          on:{
                              click:this.clickBtn
                          },
                          attrs:{
                            "name": params.name,
                            "age": params.age
                          }
                      }, "按钮")
                  ]),
                  position: 'bottom-right',
                  duration: 0 //显示时间, 毫秒。设为 0 则不会自动关闭
              }));
            }
        }
    });
</script>

</body>

</html>
