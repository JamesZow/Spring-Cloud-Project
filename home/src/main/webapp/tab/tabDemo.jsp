<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>测试</title>
    <!-- 引入样式 -->
    <link rel="stylesheet" href="../js/elementui/theme-chalk/index.css" type="text/css">
</head>
<body>
<div id="app">
  <p style="color: red;">自定义增加标签页触发器，切换标签页时提示是否切换</p>

  <div style="margin-bottom: 20px;">
    <el-button size="small"  @click="addTab(editableTabsValue)">
      add tab
    </el-button>
  </div>
  <el-tabs v-model="editableTabsValue" type="card" closable
    @tab-remove="removeTab"
    :before-leave="beforeLeaveTab">
    <el-tab-pane
      v-for="(item, index) in editableTabs"
      :key="item.id"
      :label="'Tab' + (index + 1)"
      :name="item.id">
      {{item.content}}
    </el-tab-pane>
  </el-tabs>

</div>
<!-- 引入组件库 -->
<script type="text/javascript" src="../js/vue.js"></script>
<script type="text/javascript" src="../js/elementui/index.js"></script>

<script type="text/javascript">
    new Vue({
        el: "#app",
        data: {
          editableTabsValue : '1',
          editableTabs: [{
            id: '1',
            content: 'Tab 1 content'
          }, {
            id: '2',
            content: 'Tab 2 content'
          }],
          tabIndex : 2,

          isTip : true
        },
        methods: {
          addTab(targetId) {
            let newTabId = ++this.tabIndex + '';
            this.editableTabs.push({
              id: newTabId,
              content: 'New Tab content'
            });
            this.isTip = false;
            this.editableTabsValue = newTabId;
          },
          removeTab(targetId) {
            let tabs = this.editableTabs;
            let activeId = this.editableTabsValue;
            if (activeId === targetId) {
              tabs.forEach((tab, index) => {
                if (tab.id === targetId) {
                  let nextTab = tabs[index + 1] || tabs[index - 1];
                  if (nextTab) {
                    activeId = nextTab.id;
                  }
                  this.isTip = false;
                  this.editableTabsValue = activeId;
                }
              });
            }

            this.editableTabs = tabs.filter(tab => tab.id !== targetId);
          },

          beforeLeaveTab(){
            if(!this.isTip){
              this.isTip = true;
              return true;
            }

            return this.$confirm('此操作将切换tab页, 是否继续?', '提示', {
              confirmButtonText: '确定',
              cancelButtonText: '取消',
              type: 'warning'
            }).then(() => {
              this.$message({
                type: 'success',
                message: '切换成功！可以做一些其他的事情'
              });
            }).catch(() => {
              this.$message({
                type: 'success',
                message: '取消成功！可以做一些其他的事情'
              });
              throw new Error("取消成功！");
            });
          }

        }
    });
</script>

</body>

</html>
