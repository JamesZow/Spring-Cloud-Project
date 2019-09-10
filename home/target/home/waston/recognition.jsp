<%--
  Created by IntelliJ IDEA.
  User: jameszow
  Date: 2019-08-05
  Time: 19:59
  To change this template use File | Settings | File Templates.
--%>
<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>上传文件</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="../js/elementui/theme-chalk/index.css" type="text/css">
    <style type="text/css">
        .el-upload-list__item-name {
            height: 25px;
        }
        .el-upload-list {
            width: 500px;
        }
    </style>
</head>
<body>
<div id="app">
    <p style="color:red;">图像识别，这里上传图片。</p>
    <p style="color:red;">这里使用了element ui官网Demo上的上传地址，所以会不稳定，也比较慢，偶尔会上传成功，偶尔会上传失败，望理解。</p>
    <upload-component ref="uploadRef" :attachment-list="attachmentList"
                      upload-url="https://jsonplaceholder.typicode.com/posts/"></upload-component>

    <div style="margin-top: 20px">
        <span>打印区</span>
        <el-button size="small" type="primary" @click="starIdentification">开始识别</el-button>
        <el-button size="small" type="primary" @click="getFileList">获取文件</el-button>
        <el-input type="textarea" v-model="printStr"></el-input>
    </div>
</div>

<div id="uploadComponent" style="display: none">
    <el-upload
            ref="upload"
            action="https://jsonplaceholder.typicode.com/posts/"
            list-type="picture-card"
            :on-preview="handlePictureCardPreview"
            :on-remove="handleRemove">
        <i class="el-icon-plus" style="line-height: 5;"></i>
    </el-upload>
    <el-dialog :visible.sync="dialogVisible" size="tiny">
        <img width="100%" :src="dialogImageUrl" alt="">
    </el-dialog>
</div>

<!-- 引入组件库 -->
<script type="text/javascript" src="../js/vue.js"></script>
<script type="text/javascript" src="../js/elementui/index.js"></script>
<script type="text/javascript" src="../common/showMsgTool.js"></script>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<!--上传组件-->
<script type="text/javascript">
    var uploadComponent = {
        template : document.getElementById("uploadComponent").innerHTML,
        data : function(){
            return {
                action : this.uploadUrl,
                data : {},//向后台传额外参数
                limit : this.fileLimit,
                disabled : this.uploadDisabled,

                //接收文件类型，从数据字典取值
                accept : ".jpg,.pdf",
                //文件大小，从数据字典取值
                uploadMaxSize : 1024*1024
            }
        },
        props: {
            /**
             * 上传地址
             */
            uploadUrl : {
                type : String,
                required : true
            },
            /**
             * 文件	最大允许上传个数
             */
            fileLimit : {
                type : Number,
                default : 5
            }
        },
        computed: {
            //默认文件列表
            fileList : {
                get : function(){
                    if(!this.attachmentList){
                        return [];
                    }
                    //可能会根据后台字段做一些特殊转换
                    return this.attachmentList;
                },
                set : function(){
                    console.log("set");
                }
            }
        },
        created:function () {
        },
        mounted : function(){
            var _self = this;
            this.$nextTick(function () {
            })
        },
        methods :  {
            /**
             * 获取当前所有的附件
             * @return {Array}
             */
            getUploadFilesList : function(){
                var uploadFiles = this.$refs.upload.uploadFiles;
                return uploadFiles;
            },

            handleRemove(file, fileList) {
                console.log(file, fileList);
            },
            handlePictureCardPreview(file) {
                alert("打开文件")
                this.dialogImageUrl = file.url;
                this.dialogVisible = true;
            },
            starIdentification(file){
                var uploadFiles = this.$refs.upload.uploadFiles;
                var jsonresult = JSON.stringify(uploadFiles).toString();
                var jsonObj =  JSON.parse(jsonresult)
                var url = "";
                for(var i=0;i<jsonObj.length;i++){
                    url = jsonObj[i].url;  //取json中的值
                }
                // 获取到url 后 开始传入后台进行识别
                $.ajax({
                    type : "post",
                    url : "<%=request.getContextPath()%>/waston/test2",
                    data : {},
                    success : function (data) {
                        this.printStr = data
                    },
                    error :function () {

                    }

                })
            },
            /**
             * 上传失败
             * @param err
             * @param file
             * @param fileList
             */
            handleError : function(err, file, fileList){
                showAlert.call(this, '上传失败，系统未知错误！错误码为【500】', iconConstants.ERROR);
            },
            /**
             * 上传成功
             * @param response
             * @param file
             * @param fileList
             */
            handleSuccess : function(response, file, fileList){
                if(response.id){
                    //成功
                    showAlert.call(this, "上传成功！", iconConstants.SUCCESSAUTO);
                }else{
                    //出错
                    showAlert.call(this, "上传失败！" + response.buinessMsg, iconConstants.ERROR);

                    //删除该文件
                    var i = this.getFile(file, fileList);
                    fileList.splice(fileList.indexOf(i), 1);
                }
            },
            getFile: function (file, fileList) {
                fileList.forEach((x, i)=>{
                    if(x.uid === file.uid){
                        return x;
                    }
                });

                return null;
            }
        }
    };
</script>

<script type="text/javascript">
    new Vue({
        el: "#app",
        data: {
            printStr : ""
        },
        components : {
            'upload-component' : uploadComponent
        },
        methods: {
            getFileList(){
                this.printStr = JSON.stringify(this.$refs.uploadRef.getUploadFilesList());
            },
            setEditable(){
                this.$refs.uploadRef.setEditable();
            },
            setDisEditable(){
                this.$refs.uploadRef.setDisEditable();
            },
            starIdentification(){
                this.$refs.uploadRef.starIdentification();
            }
        }
    });
</script>

</body>

</html>

