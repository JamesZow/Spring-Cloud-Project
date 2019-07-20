<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>多选表格</title>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="../js/elementui/theme-chalk/index.css" type="text/css">
</head>
<body>
<div id="app">

  <p style="color: red;">同样借用element官网上的demo数据，但是和官网上的不同</p>

  <el-table
    ref="multipleTable"
    :data="tableData3"
    tooltip-effect="dark"
    style="width: 100%"
    @selection-change="handleSelectionChange">
    <el-table-column
      type="selection"
      width="55">
    </el-table-column>
    <el-table-column
      label="id"
      width="120">
      <template slot-scope="scope">{{ scope.row.id }}</template>
    </el-table-column>
    <el-table-column
      label="日期"
      width="120">
      <template slot-scope="scope">{{ scope.row.date }}</template>
    </el-table-column>
    <el-table-column
      prop="name"
      label="姓名"
      width="120">
    </el-table-column>
    <el-table-column
      prop="address"
      label="地址"
      show-overflow-tooltip>
    </el-table-column>
  </el-table>

  <div style="margin-top: 20px">
    <span>设置选中的id（用英文逗号分隔，eg：1,2,3,4），没有清除之前选中的</span>
    <el-input style="width:100px" v-model="idStr"></el-input>
    <el-button type="primary" plain @click="setSelected">点击选中表格设置的数据</el-button>
  </div>
  <div style="margin-top: 20px">
    <el-button type="primary" plain @click="getSelectionData">获取表格选中的数据</el-button>
    <el-button type="primary" plain @click="clearSelectionData">取消所有选中</el-button>
  </div>
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
          idStr : "",
          printStr : "",

          tableData3: [{
            id:'1',
            date: '2016-05-03',
            name: '王小虎1',
            address: '上海市普陀区金沙江路 1518 弄'
          }, {
            id:'2',
            date: '2016-05-02',
            name: '王小虎2',
            address: '上海市普陀区金沙江路 1518 弄'
          }, {
            id:'3',
            date: '2016-05-04',
            name: '王小虎3',
            address: '上海市普陀区金沙江路 1518 弄'
          }, {
            id:'4',
            date: '2016-05-01',
            name: '王小虎4',
            address: '上海市普陀区金沙江路 1518 弄'
          }],
        },
        methods: {
          handleSelectionChange(selection){
            this.printStr = "表格选中的数据：" + JSON.stringify(selection);
          },
          setSelected(){
            if(this.idStr){
              let tableDataObj = {};
              for(let i = 0; i < this.tableData3.length; i++){
                let row = this.tableData3[i];
                tableDataObj[row.id] = row;
              }

              let idArr = this.idStr.split(",");
              for(let i = 0; i < idArr.length; i++){
                //选中数据
                this.$refs.multipleTable.toggleRowSelection(tableDataObj[idArr[i]], true);
              }
            }
          },
          getSelectionData(){
            this.printStr = JSON.stringify(this.$refs.multipleTable.selection);
          },
          clearSelectionData(){
            this.$refs.multipleTable.clearSelection();
          }
        }
    });
</script>

</body>

</html>
