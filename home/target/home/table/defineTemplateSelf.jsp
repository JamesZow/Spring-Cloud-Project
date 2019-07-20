<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>自定义列模板</title>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="../js/elementui/theme-chalk/index.css" type="text/css">
</head>
<body>
<div id="app">

    <p style="color: red;">所有的打印数据，均在打印区里。
        表格上是否有钱这列是el-checkbox，绑定了v-model</p>

    <el-table :data="tableData" style="width: 100%">

        <el-table-column label="出生日期" width="180">
            <template slot-scope="scope">
                <i class="el-icon-time"></i>
                <span style="margin-left: 10px">{{ scope.row.date }}</span>
            </template>
        </el-table-column>

        <el-table-column label="姓名" width="100">
            <template slot-scope="scope">
                <el-popover trigger="hover" placement="top">
                    <p>姓名: {{ scope.row.name }}</p>
                    <p>住址: {{ scope.row.address }}</p>
                    <div slot="reference" class="name-wrapper">
                        <el-tag size="medium">{{ scope.row.name }}</el-tag>
                    </div>
                </el-popover>
            </template>
        </el-table-column>

        <el-table-column label="是否有钱" width="100">
            <template slot-scope="scope">
                <el-checkbox v-model="scope.row.isRich">是</el-checkbox>
            </template>
        </el-table-column>

        <el-table-column label="备注" width="180">
            <template slot-scope="scope">
                <el-input v-model="scope.row.remark" placeholder="请输入备注"></el-input>
            </template>
        </el-table-column>

        <el-table-column label="选择框" width="180">
            <template slot-scope="scope">
                <el-select v-model="scope.row.selectOption" clearable placeholder="请选择">
                    <el-option
                            v-for="item in selectOptions"
                            :key="item.value"
                            :label="item.label"
                            :value="item.value">
                    </el-option>
                </el-select>
            </template>
        </el-table-column>

        <el-table-column label="性别" width="180">
            <template slot-scope="scope">
                <el-radio v-model="scope.row.sex" label="0">女</el-radio>
                <el-radio v-model="scope.row.sex" label="1">男</el-radio>
            </template>
        </el-table-column>

        <el-table-column label="操作">
            <template slot-scope="scope">
                <el-button size="mini" @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
                <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除                </el-button>
            </template>
        </el-table-column>

    </el-table>

    <br/>

    <el-button type="primary" plain @click="getTabelData">获取表格数据</el-button>
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
            handleEdit(index, row) {
                this.printStr = "点击编辑；index=" + index + "；row=" + JSON.stringify(row);
            },
            handleDelete(index, row) {
                this.printStr = "点击删除；index=" + index + "；row=" + JSON.stringify(row);
            },
            getTabelData(){
                this.printStr = "表格数据：" + JSON.stringify(this.tableData);
            }
        }
    });
</script>

</body>

</html>
