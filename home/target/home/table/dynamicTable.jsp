<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>动态渲染整个表格</title>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="../js/elementui/theme-chalk/index.css" type="text/css">
</head>
<body>
<div id="app">

    <p style="color: red;">动态根据表名，渲染整个表格，使用组件；这里没用联网，所以就一个简单的静态页面</p>

    <el-row style="margin-bottom: 20px">
        <el-col :span="3">
            <el-button type="primary" @click="handleSelectTable(0)">查询表1</el-button>
        </el-col>
        <el-col :span="3">
            <el-button type="primary" @click="handleSelectTable(1)">查询表2</el-button>
        </el-col>
        <el-col :span="3">
            <el-button type="primary" @click="handleSelectTable(2)">查询表3</el-button>
        </el-col>
    </el-row>

    <table-component ref="tableRef" :table-columns="tableColumns"></table-component>
</div>
<!-- 引入组件库 -->
<script type="text/javascript" src="../js/vue.js"></script>
<script type="text/javascript" src="../js/elementui/index.js"></script>

<!--表格组件，需要分页-->
<div id="tableComponentApp">
    <div>
        <el-table
                :data="pageData"
                border
                style="width: 100%">
            <el-table-column
                    v-for="(item, index) in tableColumns"
                    :prop="item.prop"
                    :label="item.label"
                    :key="item.id"
                    sortable
                    show-overflow-tooltip
            >
            </el-table-column>
        </el-table>

    </div>
</div>
</div>
<script type="text/javascript">
    const tableComponent = {
        template: window.document.getElementById("tableComponentApp").innerHTML,
        data: function () {
            return {
                pageData: []
            }
        },
        props: {
            tableColumns: {
                type: Array,
                required: true
            }
        },
        methods: {
        }
    };
</script>

<script type="text/javascript">

    new Vue({
        el: "#app",
        data: {
            idStr : "",
            printStr : "",

            tableColumnArray:[
                [
                    {id: "id", prop: "id", label: "id：唯一标识"},
                    {id: "userName", prop: "userName", label: "userName：用户名"}
                ],
                [
                    {id: "bookName", prop: "bookName", label: "bookName: 书名"},
                    {id: "price", prop: "price", label: "price: 价格"}
                ],
                [
                    {id: "createTime", prop: "createTime", label: "createTime: 创建时间"},
                    {id: "address", prop: "address", label: "address: 地址"},
                    {id: "email", prop: "email", label: "email: 邮件"}
                ]
            ],
            tableDataArray:[
                [
                    {id: "1", userName: "xiaohua"},
                    {id: "2", userName: "小明"}
                ],
                [
                    {bookName: "大话设计模式", price: "56"},
                    {bookName: "算法导论", price: "156"},
                    {bookName: "一本书", price: "35"}
                ],
                [
                    {createTime: "2018-10-14", address: "sdf", email: "sdfsd@yule.com"}
                ]
            ],
            tableColumns : []
        },
        components: {
            'table-component': tableComponent
        },
        methods: {
            handleSelectTable(index){
                this.tableColumns = this.tableColumnArray[index];
                this.$refs.tableRef.pageData = this.tableDataArray[index];
            }
        }
    });
</script>

</body>

</html>
