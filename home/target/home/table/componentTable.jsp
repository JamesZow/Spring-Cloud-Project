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
        表格上的列是采用的组件</p>

    <el-table :data="tableData" style="width: 100%">

        <!--下拉框列的组件-->
        <my-select-column :select-options="selectOptions" key-field="selectOption"></my-select-column>

        <!--输入框的组件-->
        <el-table-column label="备注" width="180">
            <template slot-scope="scope">
                <my-input :key-field.sync="scope.row.remark"></my-input>
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

<!--表格列组件-->
<div id="mySelectColumn">
    <el-table-column label="选择栏" width="200">
        <template slot-scope="scope">
            <el-select clearable placeholder="请选择" v-model="scope.row[keyField]">
                <el-option
                        v-for="item in selectOptions"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                </el-option>
            </el-select>
        </template>
    </el-table-column>
</div>
<script type="text/javascript">
    var getSelectColumn = function () {
        var component = {
            template: document.querySelector("#mySelectColumn").innerHTML,
            data: function () {
                return {}
            },
            // 声明 props
            props: {
                selectOptions: {
                    type: Array,
                    required: true
                },
                keyField : {
                    type : String,
                    required: true
                }
            },
            watch: {},
            methods: {}
        };

        return component;
    };

    window.myComponents = {
        mySelectColumn: getSelectColumn()
    };
</script>

<!--输入框组件-->
<div id="myInput">
    <el-input v-model="curKeyField" placeholder="请输入备注"></el-input>
</div>
<script type="text/javascript">
    var getInputComponent = function () {
        var component = {
            template: document.querySelector("#myInput").innerHTML,
            data: function () {
                return {
                    curKeyField : this.keyField
                }
            },
            // 声明 props
            props: {
                keyField : {
                    type : String,
                    required: true
                }
            },
            watch: {
                keyField : function(newVal, oldVal){
                    this.curKeyField = newVal;
                },
                curKeyField : function(newVal, oldVal){
                    this.$emit("update:keyField", newVal);
                }
            },
            methods: {}
        };

        return component;
    };

    window.myComponents.myInput = getInputComponent();
</script>

<!--主 js-->
<script type="text/javascript">
    window.onload = function(){
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
            components : {
                'my-select-column' : myComponents.mySelectColumn,
                'my-input' : window.myComponents.myInput
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
    };
</script>

</body>

</html>
