<html>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<head>
    <title>js Date 工具</title>
</head>

<body>
    <p style="color:red;">js Date 工具，见js</p>

    <textarea id="txt"></textarea>

    <script type="text/javascript" src="dateTool.js"></script>
    <script type="text/javascript">

        window.onload = function(){
          var days = dateToolsFun.getDateDiffDaysForMinute("2018-08-08 20:08", "2018-08-09 20:09");
          document.getElementById("txt").value = days;
        };

    </script>
</body>

</html>
