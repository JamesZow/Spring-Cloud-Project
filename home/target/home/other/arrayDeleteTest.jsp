<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>js 数组删除</title>
</head>

<body>
<p style="color:red;">
    js 数组删除的两种方式
    <a targer="_blanck" href="https://www.cnblogs.com/yuxiaole/p/9483479.html">https://www.cnblogs.com/yuxiaole/p/9483479.html</a>
</p>


<script type="text/javascript">

    window.onload = function(){
        var arr = ["11", "22", "33", "44", "55"];
        console.log(arr);

        delete arr[2];
        console.log(arr);

        for(var i = 0; i < arr.length; i++){
          console.log(arr[i]);
        }

        var length = 0;
        for(var a in arr){
          length ++;
        }
        console.log("数组真实长度" + length);
    };

    window.onload = function(){
        console.log("------------------------");
        var arr = ["11", "22", "33", "44", "55"];

        //清空整个数组
        arr.splice(0, arr.length);
        console.log(arr);

        //删除一个元素
        var arr = ["11", "22", "33", "44", "55"];
        arr.splice(1, 1);
        console.log(arr);

        //删除一个，增加两个
        arr.splice(1, 1, "34", "43");
        console.log(arr);
    };

</script>
</body>

</html>
