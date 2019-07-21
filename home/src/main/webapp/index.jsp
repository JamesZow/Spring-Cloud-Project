<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>Spring Cloud Project</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!-- 引入样式 -->
    <link rel="stylesheet" href="./js/elementui/theme-chalk/index.css" type="text/css">
    <style>
        body {
            margin: 0px;
        }

        /* 所有 */
        #app {
            width: 100%;
            height: 100%;
        }

        /* 头 */
        .header {
            color: rgba(255, 255, 255, 0.75);
            line-height: 60px;
            background-color: #24292e;
            text-align: left;
        }

        .header div {
            display: inline;
        }

        .title {
        }

        .author {
            float: right;
        }

        .author-img {
            width: 20px;
            height: 20px;
        }

        .author-github {
            cursor: pointer;
        }

        /* 内容区 */
        .container {
            min-height: 600px;
            width: 100%;
            height: 100%
        }

        /* 左边内容区 */
        .left {
            color: #4b595f;
            width: 200px;
        }

        .left .totalUl {
            height: 93%;
        }

        /* 右边内容区 */
        .right {
            min-width: 200px;
        }

        tbody {
            font-size: 15px;
            color: #4b595f;
        }

    </style>
</head>
<body>
<div id="app">
    <el-container class="container">
        <el-header class="header">
            <div class="title">
                <span>Spring Cloud Project</span>
            </div>
            <div @click="openGitHub" class="author">
                <i class="el-icon-location-outline author-github">James Zow</i>
                <img title="gitHub 主页" alt="@yuleGH" class="author-img author-github"
                     src="https://avatars3.githubusercontent.com/u/50319572?s=460&v=4">
            </div>
        </el-header>

        <el-container>
            <el-aside class="left">
                <el-menu :default-active="activeIndex" class="totalUl" background-color="#545c64" text-color="#fff" active-text-color="#ffd04b">
                    <el-menu-item index="1" @click="open(aboutMeUrl)"><i class="el-icon-service"></i>关于我</el-menu-item>
                    <el-menu-item index="2" @click="open(ibmWastonUrl)"><i class="el-icon-star-on"></i>IBM Waston</el-menu-item>
                    <el-submenu :index="firstMenu.id" v-for="firstMenu in menus" :key="firstMenu.id">
                        <template slot="title"><i :class="firstMenu.iconClass"></i>{{ firstMenu.name }}</template>
                        <el-menu-item-group v-for="secondMenu in firstMenu.children" :key="secondMenu.id">
                            <template slot="title">{{ secondMenu.name }}</template>
                            <el-menu-item v-for="thirdMenu in secondMenu.children" :index="thirdMenu.id"
                                          :key="thirdMenu.id" @click="open(thirdMenu.url)">{{ thirdMenu.name }}
                            </el-menu-item>
                        </el-menu-item-group>
                    </el-submenu>
                </el-menu>
            </el-aside>

            <el-main class="right">
                <iframe style="width:100%; height:100%; border: 0;" :src="iframeUrl"></iframe>
            </el-main>
        </el-container>
    </el-container>
</div>
<!-- 引入组件库 -->
<script type="text/javascript" src="./js/vue.js"></script>
<script type="text/javascript" src="./js/elementui/index.js"></script>

<script type="text/javascript">
    new Vue({
        el: "#app",
        data: {
            activeIndex: "1",
            aboutMeUrl: "aboutme.jsp",
            ibmWastonUrl : "./waston/waston.jsp",
            iframeUrl: "aboutme.jsp",
            menus: [
                {
                    name: "服务注册与发现",
                    id: "server",
                    iconClass: "el-icon-star-off",
                    children: [
                        {
                            name: "两种不同的服务治理组件",
                            id: "DatePicker",
                            children: [
                                {name: "Eureka", id: "DatePicker-demo1", url: ""},
                                {name: "Consul", id: "DatePicker-mutidemo", url: ""}
                            ]
                        }
                    ]
                },
                {
                    name: "时间控件",
                    id: "date",
                    iconClass: "el-icon-time",
                    children: [
                        {
                            name: "DatePicker 日期选择器",
                            id: "DatePicker",
                            children: [
                                {name: "年月日时分", id: "DatePicker-demo1", url: "./date/demoElDatePicker.jsp"},
                                {name: "多日期选择", id: "DatePicker-mutidemo", url: "./date/demoMultipleDate.jsp"}
                            ]
                        }
                    ]
                },
                {
                    name: "Form",
                    id: "form",
                    iconClass: "el-icon-edit-outline",
                    children: [
                        {
                            name: "Input",
                            id: "input",
                            children: [
                                {name: "小写转大写", id: "input-demo1", url: "./form/demoUpper.jsp"}
                            ]
                        },
                        {
                            name: "validateRules",
                            id: "validateRules",
                            children: [
                                {name: "动态修改校验规则", id: "validateRules-demo", url: "./form/validateRules.jsp"}
                            ]
                        }
                    ]
                },
                {
                    name: "Table",
                    id: "Table",
                    iconClass: "el-icon-tickets",
                    children: [
                        {
                            name: "自定义列模板",
                            id: "ZDYLMB",
                            children: [
                                {name: "全部都是自定义列", id: "zdylmb-demo1", url: "./table/defineTemplateSelf.jsp"},
                                {name: "自定义表头", id: "custom-table-header", url: "./table/customTableHeader.jsp"},
                                {name: "将列封装为组件", id: "component-demo1", url: "./table/componentTable.jsp"},
                                {name: "动态渲染整个表格", id: "dynamic-table", url: "./table/dynamicTable.jsp"}
                            ]
                        },
                        {
                            name: "多选表格",
                            id: "DXBG",
                            children: [
                                {name: "反正官网上没有这个demo", id: "DXBG-demo1", url: "./table/checkbox1.jsp"}
                            ]
                        }
                    ]
                },
                {
                    name: "Dialog",
                    id: "Dialog",
                    iconClass: "el-icon-message",
                    children: [
                        {
                            name: "Notification 通知",
                            id: "notification",
                            children: [
                                {name: "使用vNode", id: "noti-demo1", url: "./dialog/notification/notification.jsp"}
                            ]
                        }
                    ]
                },
                {
                    name: "Tabs 标签页",
                    id: "Tab",
                    iconClass: "el-icon-more",
                    children: [
                        {
                            name: "Tab",
                            id: "Tab1",
                            children: [
                                {name: "动态增减，切换时提示用户是否切换", id: "tab-demo1", url: "./tab/tabDemo.jsp"}
                            ]
                        }
                    ]
                },
                {
                    name: "组件",
                    id: "component",
                    iconClass: "el-icon-news",
                    children: [
                        {
                            name: "数据绑定",
                            id: "databind",
                            children: [
                                {name: "双向绑定", id: "databind-demo1", url: "./component/demoDataBindTwoWay.jsp"}
                            ]
                        }
                    ]
                },
                {
                    name: "上传文件",
                    id: "upload",
                    iconClass: "el-icon-news",
                    children: [
                        {
                            name: "上传文件",
                            id: "uploadFile",
                            children: [
                                {name: "上传文件-组件", id: "uploadForComponent", url: "./upload/uploadForComponent.jsp"}
                            ]
                        }
                    ]
                },
                {
                    name: "播放器提示",
                    id: "audio",
                    iconClass: "el-icon-bell",
                    children: [
                        {
                            name: "声音提示",
                            id: "tip_mp3",
                            children: [
                                {name: "声音提示", id: "tip-mp3-demo1", url: "./audio/audioMsgTip.jsp"}
                            ]
                        }
                    ]
                },
                {
                    name: "其他",
                    id: "other",
                    children: [
                        {
                            name: "跳转页面",
                            id: "other-skip-page",
                            children: [
                                {name: "在当页来回跳转", id: "other-skip-cur", url: "./other/skipPage.jsp"}
                            ]
                        },
                        {
                            name: "滚动条",
                            id: "other-scroll",
                            children: [
                                {name: "固定在可视区域", id: "other-scroll-demo1", url: "./other/demoScroll.jsp"}
                            ]
                        },
                        {
                            name: "复制",
                            id: "other-copy",
                            children: [
                                {name: "复制内容到粘贴板", id: "other-copy-demo1", url: "./other/copyValue.jsp"}
                            ]
                        },
                        {
                            name: "工具",
                            id: "other-tool",
                            children: [
                                {name: "js Date 工具", id: "other-date-tool", url: "./other/dateTool.jsp"}
                            ]
                        },
                        {
                            name: "js 数组",
                            id: "array-demo",
                            children: [
                                {name: "js 数组删除", id: "array-delete", url: "./other/arrayDeleteTest.jsp"}
                            ]
                        }
                    ]
                }
            ]
        },
        methods: {
            open(url){
                this.iframeUrl = url;
            },
            openGitHub(){
                window.open("https://github.com/JamesZow", "_blank");
            }
        }
    });
</script>

</body>

</html>
