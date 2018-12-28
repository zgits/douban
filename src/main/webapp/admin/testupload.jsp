<%--
  Created by IntelliJ IDEA.
  User: 幻夜~星辰
  Date: 2018/12/3
  Time: 18:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="/static_resources/bootstrap/jquery/jquery.min.js"></script>
</head>
<body>
<form action="/upload" method="post" enctype="multipart/form-data">
    <input type="file" name="upload" id="upload"/>
    <button type="submit">提交</button>
</form>
<script>
   function test(){
       var movie=$("#upload");
       alert(movie);
   }


</script>
</body>
</html>
