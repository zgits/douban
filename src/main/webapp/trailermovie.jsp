<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<c:set var="basepath" value="<%=basePath%>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>播放预告片页面</title>



    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="/static_resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="/static_resources/bootstrap/jquery/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="/static_resources/bootstrap/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="/static_resources/dist/plyr.css">

    <script src="/static_resources/dist/plyr.js"></script>
    <!--评论区-->
    <link rel="stylesheet" href="/static_resources/movieComment/css/style.css">

    <link rel="stylesheet" href="/static_resources/movieComment/css/movieComment.css">
    <!--评论区end-->

    <%----%>
    <link href="/static_resources/toastr/toastr.css" rel="stylesheet"/>
    <script src="/static_resources/toastr/toastr.min.js"></script>

    <style type="text/css">
        .m {
            margin-left: -15px;
            margin-right: auto;
            width: 840px;
            margin-top: 100px;
        }
        .loading {
            width: 50px;
            height: 50px;
            position: fixed;
            top: 50%;
            left: 50%;
            margin-top: -25px;
            margin-left: -25px;
            z-index: 9999;
        }
        #loading {
            margin-top: 10px;
        }

    </style>
</head>
<body>

<!--导航栏-->
<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="main.jsp"><img class="img-circle" src="${basepath}/image/logo.PNG"
                                                         style="width:55px;height:55px;margin-top: -15px"></a>
        </div>
        <div>
            <form class="navbar-form navbar-left" role="search">
                <div class="form-group">
                    <input class="form-control" type="text" placeholder="毒液">
                </div>
                <button type="submit"><span class="glyphicon glyphicon-search"></span></button>
                <!--<input type="submit" value="图片">-->
            </form>
            <!--<a href="" class="btn btn-primary btn-sm navbar-btn navbar-right">联系我们</a>-->
            <div class="profile navbar-right">
                <ul class="nav navbar-nav">
                    <li><a href="login.html"><span class="glyphicon glyphicon-log-out"></span>退出</a></li>
                    <li><a href="login.html" class="a globalLoginBtn"><span
                            class="glyphicon glyphicon-log-in"></span>&nbsp;登录</a></li>
                    <li><a href="register.html">注册</a></li>
                    <li>
                        <a href="tips_message.html">
                            <span class="badge pull-right">3</span>消息
                        </a>
                    </li>
                    <li>
                        <a style="width: 40px;height: 40px" href="personInfo.html"><img src="${basepath}/image/test.jpg"
                                                                                        class="img-circle img-responsive"
                                                                                        style="width: 40px;height: 40px;margin-top: -10px"></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<!--播放视频-->
<div class="container">
    <div class="row">

        <div class="m" style="margin-top: -20px;">
            <h1>${OneTrailer.name}</h1>
            <video poster="vs.png" controls>
                <%--<source src="https://video.pc6.com/v/1809/dyjxxz3.mp4" type="video/mp4">--%>
                <!-- <source src="path/to/video.webm" type="video/webm">-->
                <!-- Captions are optional -->
            </video>
            <script>plyr.setup();</script>

        </div>
    </div>
</div>

<div id="loading" style="display: block">
    <div class="loading show">
        <img src='${basepath}/image/loading1.gif' />
    </div>
</div>

<!--评论区展示-->
<div class="container">

    <div class="row">
        <ul class="list-group" style="width: 800px">
            <c:forEach items="${OneTrailer.trailerComments}" var="trailercomment" varStatus="status">
                <li class="list-group-item" style="border: none">
                    <!--显示个人信息以及评论时间-->
                    <div class="row">
                        <img class="img-circle" src="${basepath}/image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                        <span>${trailercomment.username}</span>
                        &nbsp;&nbsp;
                        <fmt:formatDate value="${trailercomment.time}" pattern="yyyy-MM-dd:HH:mm:ss"></fmt:formatDate>
                    </div>
                    <br>
                    <div class="row">
                        &nbsp;&nbsp;
                        ${trailercomment.content}
                    </div>
                    <c:choose>
                        <c:when test="${trailercomment.userId==1}">
                            <div class="row col-md-offset-10">
                                    <%--id的获取需要登录--%>
                                <a class="btn btn-sm" onclick="deletecomment(${trailercomment.id})">删除</a>


                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#${trailercomment.userId}${status.count}" class="btn btn-sm">回复</a>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="row col-md-offset-10">

                                <a class="btn btn-sm">举报</a>
                                <a data-toggle="collapse" data-parent="#accordion"
                                   href="#${trailercomment.userId}${status.count}" class="btn btn-sm">回复</a>
                            </div>
                        </c:otherwise>
                    </c:choose>

                    <div id="${trailercomment.userId}${status.count}" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="row">
                                <div class="form-horizontal">
                                    <div class="form-group col-md-8">
                                        <input id="${status.count}" class="form-control" type="text" placeholder="@${trailercomment.username}:">

                                    </div>

                                    <input type="submit" class="col-md-offset-2 btn btn-success" onclick="replyComment('${status.count}','${trailercomment.id}','${trailercomment.userId}','1',1)" value="回复">
                                </div>
                            </div>
                            <div class="row">
                                <ul class="list-group">
                                    <c:forEach items="${trailercomment.trailerReplycomments}" var="reply" varStatus="status">
                                        <li class="list-group-item">
                                            <img class="img-circle" src="${basepath}/image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                                            <span>${reply.username}</span>
                                            &nbsp;&nbsp;<fmt:formatDate value="${reply.time}" pattern="yyyy-MM-dd:HH:mm:ss"></fmt:formatDate>

                                            <br>
                                            <div class="row">
                                                <span class="col-md-offset-1">回复@${reply.to_userIdusername}:${reply.content}</span>

                                                <c:choose>
                                                    <c:when test="${reply.userId==1}">
                                                        <div class="row col-md-offset-10">

                                                            <a class="btn btn-sm" onclick="deletereplycomment(${reply.id})">删除</a>


                                                            <a class="btn btn-sm" data-toggle="collapse" data-parent="#accordion"
                                                               href="#s${trailercomment.id}${status.count}">回复</a>

                                                        </div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="row col-md-offset-10">

                                                            <a class="btn btn-sm">举报</a>
                                                            <a class="btn btn-sm" data-toggle="collapse" data-parent="#accordion"
                                                               href="#s${trailercomment.id}${status.count}">回复</a>

                                                        </div>
                                                    </c:otherwise>
                                                </c:choose>


                                            </div>
                                            <div id="s${trailercomment.id}${status.count}" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <div class="form-group col-md-8">
                                                        <input id="s${reply.id}" class="form-control" type="text" placeholder="@${reply.username}:">

                                                    </div>
                                                    <input onclick="replyComment2('s${reply.id}',${trailercomment.id},${reply.id},${reply.userId},1,2)" class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                                                </div>

                                            </div>
                                        </li>
                                    </c:forEach>

                                </ul>
                            </div>
                        </div>
                    </div>
                </li>
                <hr>
            </c:forEach>
        </ul>
    </div>

    <script>

        window.onload=function(){
            $("#loading").hide();
        }
        var messageOpts = {
            "closeButton": true,//是否显示关闭按钮
            "debug": false,//是否使用debug模式
            "positionClass": "toast-top-right",//弹出窗的位置
            "onclick": null,
            "showDuration": "3000",//显示的动画时间
            "hideDuration": "1000",//消失的动画时间
            "timeOut": "3000",//展现时间
            "extendedTimeOut": "1000",//加长展示时间
            "showEasing": "swing",//显示时的动画缓冲方式
            "hideEasing": "linear",//消失时的动画缓冲方式
            "showMethod": "fadeIn",//显示时的动画方式
            "hideMethod": "fadeOut" //消失时的动画方式
        };
        toastr.options = messageOpts;
        <%--对评论的回复的函数--%>
        function replyComment(contentId,commentId,to_userId,userId,type) {
            var content=document.getElementById(contentId).value;
            var commentId=commentId;
            var to_userId=to_userId;
            var userId=userId;
            $.ajax({
                type:"post",
                url:"${basepath}/rtrailerreplycommentinsertReplyComment",
                data:{
                    "trailer_replycomment.content":content,
                    "trailer_replycomment.comment_id":commentId,
                    "trailer_replycomment.to_userId":to_userId,
                    "trailer_replycomment.userId":userId,
                    "trailer_replycomment.reply_type":type
                },
                beforeSend: function (XMLHttpRequest) {
                    $("#loading").show(); //在后台返回success之前显示loading图标
                },
                success:function (data) {
                    $("#loading").hide();
                    if(data==1){
                        toastr.success('回复成功');
                    }else{
                        toastr.error("回复失败");
                    }
                    setTimeout("window.location.reload()",3000);
                }
            })
        }

        function replyComment2(contentId,commentId,to_id,to_userId,userId,type) {
            var content=document.getElementById(contentId).value;
            var commentId=commentId;
            var to_userId=to_userId;
            var userId=userId;
            var to_id=to_id;
            $.ajax({
                type:"post",
                url:"${basepath}/rtrailerreplycommentinsertReplyComment",
                data:{
                    "trailer_replycomment.content":content,
                    "trailer_replycomment.comment_id":commentId,
                    "trailer_replycomment.to_userId":to_userId,
                    "trailer_replycomment.userId":userId,
                    "trailer_replycomment.reply_type":type,
                    "trailer_replycomment.reply_id":to_id
                },
                beforeSend: function (XMLHttpRequest) {
                    $("#loading").show();
                    },
                success:function (data) {
                    $("#loading").hide();
                    if(data==1){
                        toastr.success('回复成功');
                    }else{
                        toastr.error("回复失败");
                    }
                    setTimeout("window.location.reload()",3000);
                }
            })
        }


        function deletecomment(commentId){
            var id=commentId;
            $.ajax({
                url:"${basepath}/trailercommentdelete",
                type:"post",
                data:{
                    "commentId":id
                },
                beforeSend: function (XMLHttpRequest) {
                    $("#loading").show(); //在后台返回success之前显示loading图标
                },
                success:function (data) {
                    $("#loading").hide();
                    if(data==1){
                        toastr.success('删除成功');
                    }else{
                        toastr.error("删除失败");
                    }
                    setTimeout("window.location.reload()",3000);
                }
            })
        }
        function deletereplycomment(id){
            $.ajax({
                url:"${basepath}/rtrailerreplycommentdeleteReplyComment",
                type:"post",
                data:{
                    "id":id
                },
                beforeSend: function (XMLHttpRequest) {
                    $("#loading").show(); //在后台返回success之前显示loading图标
                },
                success:function (data) {
                    $("#loading").hide();
                    if(data==1){
                        toastr.success('删除成功');
                    }else{
                        toastr.error("删除失败");
                    }
                    setTimeout("window.location.reload()",3000);
                }
            })
        }

    </script>

    <!--自己评论界面-->
    <div class="row ">
        <div role="form col-md-8">
            <%--id未登录时无法获取，登录后可以获取--%>
            <input id="userId" type="hidden" name="trailer_comment.userId" value="1">
            <input id="trailerId" type="hidden" name="trailer_comment.trailerId" value="${OneTrailer.id}">

            <div class="form-group" style="width: 800px;">
                <textarea id="content" class="form-control" rows="3" name="trailer_comment.content"></textarea>
            </div>
            <div class="col-md-offset-8">
                <button onclick="trailercomment()" class="btn btn-primary">发布</button>
            </div>
        </div>
    </div>
    <script>
        var messageOpts = {
            "closeButton": true,//是否显示关闭按钮
            "debug": false,//是否使用debug模式
            "positionClass": "toast-top-right",//弹出窗的位置
            "onclick": null,
            "showDuration": "3000",//显示的动画时间
            "hideDuration": "1000",//消失的动画时间
            "timeOut": "3000",//展现时间
            "extendedTimeOut": "1000",//加长展示时间
            "showEasing": "swing",//显示时的动画缓冲方式
            "hideEasing": "linear",//消失时的动画缓冲方式
            "showMethod": "fadeIn",//显示时的动画方式
            "hideMethod": "fadeOut" //消失时的动画方式
        };
        toastr.options = messageOpts;
        function trailercomment() {
            var userId=document.getElementById("userId").value;
            var trailerId=document.getElementById("trailerId").value;
            var content=document.getElementById("content").value;
            $.ajax({
                type:"post",
                url:"${basepath}/trailercommentinsertComment",
                data:{
                    "trailer_comment.userId":userId,
                    "trailer_comment.trailerId":trailerId,
                    "trailer_comment.content":content
                },
                beforeSend: function (XMLHttpRequest) {
                    $("#loading").show(); //在后台返回success之前显示loading图标
                },
                success:function (data) {
                    $("#loading").hide();
                    if(data==1){
                        toastr.success('评论成功');
                    }else{
                        toastr.error("评论失败");
                    }
                    setTimeout("window.location.reload()",3000);
                }
            })

        }
    </script>

    <!--分页界面-->
    <div class="row">
        <div class="inner clearfix">
            <section id="main-content">

                <div class="text-center">
                    <ul class="pagination">
                        <li><a href="#">&laquo;</a></li>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">&raquo;</a></li>
                        <li>
                            <!--异步传输页数，返回数据得到结果-->
                            <form class="col-sm-3" role="form">
                                <div class="input-group">
                                    <input type="text" class="form-control">
                                    <span onclick="test()" class="input-group-addon">go</span>
                                </div>
                            </form>
                        </li>
                        <li><a style="border: none">共6页</a></li>
                    </ul>
                </div>

            </section>

        </div>
    </div>
</div>
<!--底部版权信息-->
<div style="font:12px Tahoma;color: white;text-align:center;">
    <div style="background-color: #0f0f0f">
        <hr/>
        Copyright &copy; &nbsp;&nbsp;2018-2019&nbsp;
        xxx小组 ALL RIGHT RESERVED<br/>
        联系方式：xxxx@gmail.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意见反馈<br/><br/>

    </div>
</div>

</body>
</html>
