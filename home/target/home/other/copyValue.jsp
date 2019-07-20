<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>复制内容到粘贴板</title>
</head>

<body>
    <p style="color:red;">复制到剪贴板，有格式的、自定义的都可以。点击按钮后可试试哦。</p>

    <button id="btn1">复制自定义内容到粘贴板</button>

    <p></p>
    框1
    <textarea id="txt"></textarea>
    <button id="btn2">复制框1内容到粘贴板</button>

    <br/>


    <br/>
    框2
    <textarea id="txt3"></textarea>
    <button id="btn3">复制框1内容到框2，同时到粘贴板</button>

    <script type="text/javascript">

        window.onload = function(){
            function copyValue(val){
                //如果这里换为 input 则不支持换行
                var temp = document.createElement('textarea');
                temp.value = val;
                document.body.appendChild(temp);
                temp.select(); // 选择对象
                document.execCommand("Copy"); // 执行浏览器复制命令
                temp.style.display='none';
                console.log('复制成功');
            }


            document.getElementById("btn1").onclick = function () {
                copyValue("1234\n复制成功了\n而且有换行的呢");
            };

            document.getElementById("btn2").onclick = function () {
                copyValue(document.getElementById("txt").value);
            };

            function copyValue2(val){
                var oInput = document.getElementById('txt3');
                oInput.value = val;
                oInput.select(); // 选择对象
                document.execCommand("Copy"); // 执行浏览器复制命令
                console.log('复制成功');
            }
            document.getElementById("btn3").onclick = function () {
                copyValue2(document.getElementById("txt").value);
            };
        };

    </script>
</body>

</html>
