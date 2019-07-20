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
    <p style="color:red;">上传文件，这里将上传写为了一个组件，项目中如果需要，稍微修改就可以使用了</p>
    <p style="color:red;">这里使用了element ui官网Demo上的上传地址，所以会不稳定，也比较慢，偶尔会上传成功，偶尔会上传失败</p>
    <upload-component ref="uploadRef" :attachment-list="attachmentList"
                      upload-url="https://jsonplaceholder.typicode.com/posts/"></upload-component>

    <div style="margin-top: 20px">
        <span>打印区</span>
        <el-button size="small" type="primary" @click="getFileList">获取文件</el-button>
        <el-button size="small" type="primary" @click="setDisEditable">设置禁止编辑</el-button>
        <el-button size="small" type="primary" @click="setEditable">设置可以编辑</el-button>
        <el-input type="textarea" v-model="printStr"></el-input>
    </div>
</div>

<div id="uploadComponent" style="display: none">
    <el-upload ref="upload" class="upload-demo" :action="action" :data="data" :file-list="fileList"
               show-file-list :limit="limit" :accept="accept" :disabled="disabled" :auto-upload="true"
               :on-error="handleError" :on-success="handleSuccess" :on-remove="handleRemove" :on-exceed="handleExceed" :on-preview="handlePreview"
               :before-upload="beforeAvatarUpload" :before-remove="beforeRemove">
        <el-button size="small" type="primary">选择文件</el-button>
    </el-upload>
</div>

<!-- 引入组件库 -->
<script type="text/javascript" src="../js/vue.js"></script>
<script type="text/javascript" src="../js/elementui/index.js"></script>
<script type="text/javascript" src="../common/showMsgTool.js"></script>

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
             * 默认显示的附件
             */
            attachmentList : {
                type: Array,
                default : function(){
                    return [];
                }
            },
            /**
             * 初始化上传组件，是否禁用
             */
            uploadDisabled : {
                type: Boolean,
                default : false
            },
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
        watch:{

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
            /**
             * 设置组件可用
             */
            setEditable : function(){
                this.disabled = false;
            },
            /**
             * 设置组件不可用
             */
            setDisEditable : function(){
                this.disabled = true;
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
            },
            /**
             * 移除文件之前
             * 删除文件之前的钩子，参数为上传的文件和文件列表，若返回 false 或者返回 Promise 且被 reject，则停止上传。
             * @param file
             * @param fileList
             */
            beforeRemove : function(file, fileList){
                if(file){
                    var _self = this;
                    var result = showConfirmNoCancelCallBack.call(_self, "是否删除（" + file.name + "）？", iconConstants.QUESTION, function(){
                        showAlert.call(_self, "ajax访问后台删除，操作成功！", iconConstants.SUCCESSAUTO);
                    });
                    return result;
                }
            },
            /**
             * 删除文件
             * @param file
             * @param fileList
             */
            handleRemove : function(file, fileList){

            },
            /**
             * 文件超出个数限制时的钩子
             * @param files
             * @param fileList
             */
            handleExceed : function(files, fileList){
                showAlert.call(this, "当前限制选择 "+this.limit+" 个文件，本次选择了 "+files.length+" 个文件，共选择了 "+files.length + fileList.length+" 个文件", iconConstants.WARNING);
            },
            /**
             * 点击文件列表中已上传的文件时的钩子
             * @param file
             */
            handlePreview : function(file){
                console.log(file);
                showAlert.call(this, "访问后台下载，操作成功！", iconConstants.SUCCESSAUTO);
            },
            /**
             * 校验文件
             * 上传文件之前的钩子，参数为上传的文件，若返回 false 或者返回 Promise 且被 reject，则停止上传。
             * @param file
             * @return {boolean}
             */
            beforeAvatarUpload: function(file){

                if (file.size > this.uploadMaxSize) {
                    showAlert.call(this, "您文件大小不合法", iconConstants.ERRORAUTO);
                    return false;
                }

                if(file.name.indexOf(",") > 0){
                    //您的文件名不合法，不能包含逗号，请检查后重新上传!
                    showAlert.call(this, "您的文件名不合法，不能包含逗号，请检查后重新上传!", iconConstants.ERRORAUTO);
                    return false;
                }

                return true;
            }
        }
    };
</script>

<script type="text/javascript">
    new Vue({
        el: "#app",
        data: {
            printStr : "",
            attachmentList : [
                {"name":"初始文件1.jpg", url:""},
                {"name":"初始文件2.pdf", url:""}
            ]
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
            }
        }
    });
</script>

</body>

</html>
