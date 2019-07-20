<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>自定义表头</title>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="../js/elementui/theme-chalk/index.css" type="text/css">
</head>
<body>
<div id="app">

    <p style="color: red;">所有的打印数据，均在打印区里。
        表格上的表头可以自定义表头，比如加个按钮，或者加一些其他的标签，甚至可以使用 elementUI 的其他标签，也可以添加事件。</p>

    <el-table :data="tableData" style="width: 100%">

        <el-table-column label="姓名" width="100" prop="name">
        </el-table-column>

        <el-table-column label="备注" width="180" prop="remark" :render-header="remarkRenderHeader">
        </el-table-column>


        <el-table-column label="操作" :render-header="optRenderHeader">
        </el-table-column>

    </el-table>

    <br/>

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
            printStr: "",

            selectOptions : [
                {value : "1", label : "选择一"},
                {value : "2", label : "选择二"},
                {value : "3", label : "选择三"},
            ],

            tableData: [{
                date: '2000-10-27',
                name: '余小乐',
                address: '北京',
                isRich: false,
                remark : "我是备注",
                selectOption : "2",
                sex : "0"
            }, {
                date: '2016-05-04',
                name: '王小虎',
                address: '上海市普陀区金沙江路 1517 弄',
                isRich: true,
                remark : "",
                selectOption : "",
                sex : "1"
            }, {
                date: '2016-05-01',
                name: '小花',
                address: '重庆市璧山区',
                isRich: true,
                remark : "",
                selectOption : "",
                sex : "0"
            }, {
                date: '1998-05-03',
                name: '二哈',
                address: '成都',
                isRich: false,
                remark : "",
                selectOption : "",
                sex : "1"
            }]
        },
        methods: {
            //在渲染表头的时候，会调用此方法，h为createElement的缩写版
            remarkRenderHeader(h, {column, $index}){
                return h("div", [
                    h("span", {}, "备注"),
                    h("el-button", {
                        attrs: {
                            "size" : "small"
                        },
                        on: {
                            click: this.handleClick
                        }
                    }, "按钮")
                ])
            },
            handleClick(){
                this.printStr = "点击按钮了";
            },
            optRenderHeader(h, {column, $index}){
                return h("span",[
                    h("span",{
                        "class":{
                            "red-star":true
                        }
                    },"*"),
                    h("span","加个星号操作列"),
                ])
            }
        }
    });
</script>

</body>

</html>
