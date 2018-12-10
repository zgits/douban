<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
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

    <style type="text/css">
        .m {
            margin-left: -15px;
            margin-right: auto;
            width: 840px;
            margin-top: 100px;
        }

    </style>
</head>
<body>

<!--导航栏-->
<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="main.html"><img class="img-circle" src="image/logo.PNG"
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
                        <a style="width: 40px;height: 40px" href="personInfo.html"><img src="/image/test.jpg"
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
                <source src="https://video.pc6.com/v/1809/dyjxxz3.mp4" type="video/mp4">
                <!-- <source src="path/to/video.webm" type="video/webm">-->
                <!-- Captions are optional -->
            </video>
            <script>plyr.setup();</script>

        </div>
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
                        <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                        <span>${trailercomment.userId}</span>
                        &nbsp;&nbsp;${trailercomment.time}
                    </div>
                    <br>
                    <div class="row">
                        &nbsp;&nbsp;
                        ${trailercomment.content}
                    </div>
                    <div class="row col-md-offset-10">
                        <a class="btn btn-sm">举报</a>
                        <a data-toggle="collapse" data-parent="#accordion"
                           href="#${trailercomment.userId}${status.count}" class="btn btn-sm">回复</a>
                    </div>
                    <div id="${trailercomment.userId}${status.count}" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="row">
                                <form class="form-horizontal" action="127.0.0.1:">
                                    <div class="form-group col-md-8">
                                        <input class="form-control" type="text" value="@xxxxx用户名:">
                                    </div>

                                    <input class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                                </form>
                            </div>
                            <div class="row">
                                <ul class="list-group">
                                    <c:forEach items="${trailercomment.trailerReplycomments}" var="reply">
                                        <li class="list-group-item">
                                            <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                                            <span>xxxx用户名</span>
                                            &nbsp;&nbsp;${reply.time}
                                            <br>
                                            <div class="row">
                                                <span class="col-md-offset-1">回复@xxxx用户名:${reply.content}</span>
                                                <a class="btn btn-sm col-md-offset-10">举报</a>
                                                <a class="btn btn-sm" data-toggle="collapse" data-parent="#accordion"
                                                   href="#collapseid1">回复</a>
                                            </div>
                                            <div id="collapseid1" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    <div class="form-group col-md-8">
                                                        <input class="form-control" type="text" value="@xxx用户名:">

                                                    </div>
                                                    <input class="col-md-offset-2 btn btn-success" type="submit" value="回复">
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
            <li class="list-group-item" style="border: none">
                <!--显示个人信息以及评论时间-->
                <div class="row">
                    <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>xxxx用户名</span>
                    &nbsp;&nbsp;2018-11-20&nbsp;17:15:14
                </div>
                <br>
                <div class="row">
                    一场大规模的恐怖袭击，一个牵扯无数内幕的神秘组织，这个关乎整个东京的可怕计划即将拉开帷幕…首脑云集的东京峰会举办在即，
                    会场突然发生超大规模的爆炸事件，不仅在现场发现行踪诡异的安室透，毛利小五郎更是惨遭陷害。
                    面对最危险任务，最烧脑的推理，最艰难的博弈，柯南能否在迷雾中寻找到唯一的真相。
                </div>
                <div class="row col-md-offset-10">
                    <a class="btn btn-sm">举报</a>
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseuserId1" class="btn btn-sm">回复</a>
                </div>
                <div id="collapseuserId1" class="panel-collapse collapse">
                    <div class="panel-body">
                        <div class="row">
                            <form class="form-horizontal">
                                <div class="form-group col-md-8">
                                    <input class="form-control" type="text" value="@xxxxx用户名:">
                                </div>

                                <input class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                            </form>
                        </div>
                        <div class="row">
                            <ul class="list-group">
                                <li class="list-group-item">
                                    <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span>xxxx用户名</span>
                                    &nbsp;&nbsp;2018-11-20&nbsp;17:15:14
                                    <br>
                                    <div class="row">
                                        <span class="col-md-offset-1">回复@xxxx用户名:该用户回复的内容</span>
                                        <a class="btn btn-sm col-md-offset-10">举报</a>
                                        <a class="btn btn-sm" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapseuserId_replay_1">回复</a>
                                    </div>
                                    <div id="collapseuserId_replay_1" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <div class="form-group col-md-8">
                                                <input class="form-control" type="text" value="@xxx用户名:">

                                            </div>
                                            <input class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                                        </div>

                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span>xxxx用户名</span>
                                    &nbsp;&nbsp;2018-11-20&nbsp;17:15:14
                                    <br>
                                    <div class="row">
                                        <span class="col-md-offset-1">回复@xxxx用户名:该用户回复的内容</span>
                                        <a class="btn btn-sm col-md-offset-10">举报</a>
                                        <a class="btn btn-sm" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapseuserId_replay_2">回复</a>
                                    </div>
                                    <div id="collapseuserId_replay_2" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <div class="form-group col-md-8">
                                                <input class="form-control" type="text" value="@xxx用户名:">

                                            </div>
                                            <input class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                                        </div>

                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                                    <span>xxxx用户名</span>
                                    &nbsp;&nbsp;2018-11-20&nbsp;17:15:14
                                    <br>
                                    <div class="row">
                                        <span class="col-md-offset-1">回复@xxxx用户名:该用户回复的内容</span>
                                        <a class="btn btn-sm col-md-offset-10">举报</a>
                                        <a class="btn btn-sm" data-toggle="collapse" data-parent="#accordion"
                                           href="#collapseuserId_replay_3">回复</a>
                                    </div>
                                    <div id="collapseuserId_replay_3" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <div class="form-group col-md-8">
                                                <input class="form-control" type="text" value="@xxx用户名:">

                                            </div>
                                            <input class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                                        </div>

                                    </div>
                                </li>


                            </ul>
                        </div>
                    </div>
                </div>
            </li>
            <hr>
            <li class="list-group-item" style="border: none">
                <!--显示个人信息以及评论时间-->
                <div class="row">
                    <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>xxxx用户名</span>
                    &nbsp;&nbsp;2018-11-20&nbsp;17:15:14
                </div>
                <br>
                <div class="row">
                    一场大规模的恐怖袭击，一个牵扯无数内幕的神秘组织，这个关乎整个东京的可怕计划即将拉开帷幕…首脑云集的东京峰会举办在即，
                    会场突然发生超大规模的爆炸事件，不仅在现场发现行踪诡异的安室透，毛利小五郎更是惨遭陷害。
                    面对最危险任务，最烧脑的推理，最艰难的博弈，柯南能否在迷雾中寻找到唯一的真相。
                </div>
                <div class="row col-md-offset-10">
                    <a class="btn btn-sm">举报</a>
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseuserId3" class="btn btn-sm">回复</a>
                </div>
                <div id="collapseuserId3" class="panel-collapse collapse">
                    <div class="panel-body">
                        <div class="row">
                            <form class="form-horizontal">
                                <div class="form-group col-md-8">
                                    <input class="form-control" type="text" value="@xxxxx用户名:">
                                </div>

                                <input class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                            </form>
                        </div>
                    </div>
                </div>
            </li>
            <hr>
            <li class="list-group-item" style="border: none">
                <!--显示个人信息以及评论时间-->
                <div class="row">
                    <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>xxxx用户名</span>
                    &nbsp;&nbsp;2018-11-20&nbsp;17:15:14
                </div>

                <br>
                <div class="row">
                    一场大规模的恐怖袭击，一个牵扯无数内幕的神秘组织，这个关乎整个东京的可怕计划即将拉开帷幕…首脑云集的东京峰会举办在即，
                    会场突然发生超大规模的爆炸事件，不仅在现场发现行踪诡异的安室透，毛利小五郎更是惨遭陷害。
                    面对最危险任务，最烧脑的推理，最艰难的博弈，柯南能否在迷雾中寻找到唯一的真相。
                </div>
                <div class="row col-md-offset-10">
                    <a class="btn btn-sm">举报</a>
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseuserId4" class="btn btn-sm">回复</a>
                </div>
                <div id="collapseuserId4" class="panel-collapse collapse">
                    <div class="panel-body">
                        <div class="row">
                            <form class="form-horizontal">
                                <div class="form-group col-md-8">
                                    <input class="form-control" type="text" value="@xxxxx用户名:">
                                </div>

                                <input class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                            </form>
                        </div>
                    </div>
                </div>
            </li>
            <hr>
            <li class="list-group-item" style="border: none">
                <!--显示个人信息以及评论时间-->
                <div class="row">
                    <img class="img-circle" src="image/test.jpg" style="width:60px;height:60px;">&nbsp;&nbsp;&nbsp;&nbsp;
                    <span>xxxx用户名</span>
                    &nbsp;&nbsp;2018-11-20&nbsp;17:15:14
                </div>

                <br>
                <div class="row">
                    一场大规模的恐怖袭击，一个牵扯无数内幕的神秘组织，这个关乎整个东京的可怕计划即将拉开帷幕…首脑云集的东京峰会举办在即，
                    会场突然发生超大规模的爆炸事件，不仅在现场发现行踪诡异的安室透，毛利小五郎更是惨遭陷害。
                    面对最危险任务，最烧脑的推理，最艰难的博弈，柯南能否在迷雾中寻找到唯一的真相。
                </div>
                <div class="row col-md-offset-10">
                    <a class="btn btn-sm">举报</a>
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapseuserId5" class="btn btn-sm">回复</a>
                </div>
                <div id="collapseuserId5" class="panel-collapse collapse">
                    <div class="panel-body">
                        <div class="row">
                            <form class="form-horizontal">
                                <div class="form-group col-md-8">
                                    <input class="form-control" type="text" value="@xxxxx用户名:">
                                </div>

                                <input class="col-md-offset-2 btn btn-success" type="submit" value="回复">
                            </form>
                        </div>
                    </div>
                </div>
            </li>
            <hr>
        </ul>
    </div>

    <script>
        function getIdValue(self) {

        }
    </script>

    <!--自己评论界面-->
    <div class="row ">
        <form role="form col-md-8" action="/trailercomment_insertComment">
            <%--id未登录时无法获取，登录后可以获取--%>
            <input type="hidden" name="trailer_comment.userId" value="1">
            <input type="hidden" name="trailer_comment.trailerId" value="${OneTrailer.id}">

            <div class="form-group" style="width: 800px;">
                <textarea class="form-control" rows="3" name="trailer_comment.content"></textarea>
            </div>
            <div class="col-md-offset-8">
                <button type="submit" class="btn btn-primary">发布</button>
            </div>
        </form>
    </div>

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
