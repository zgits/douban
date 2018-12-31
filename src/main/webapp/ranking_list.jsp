<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>

<c:set var="basepath" value="<%=basePath%>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>排行榜</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="/static_resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="/static_resources/bootstrap/jquery/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="/static_resources/bootstrap/js/bootstrap.min.js"></script>

    <!--显示星数-->
    <link href="static_resources/star/star.css" rel="stylesheet">

    <script src="/static_resources/cookie/jquery.cookie.min.js"></script>

</head>
<body>

<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="getMoving"><img class="img-circle" src="image/logo.PNG" style="width:55px;height:55px;margin-top: -15px"></a>
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
                <ul class="nav navbar-nav" id="navuser">
                    <li><a href="login.jsp"><span class="glyphicon glyphicon-log-out"></span>退出</a></li>
                    <li><a href="login.jsp" class="a globalLoginBtn"><span
                            class="glyphicon glyphicon-log-in"></span>&nbsp;登录</a></li>
                    <li><a href="register.jsp">注册</a></li>
                    <li>
                        <a href="tips_message.jsp">
                            <span class="badge pull-right">3</span>消息
                        </a>
                    </li>
                    <li>
                        <a style="width: 40px;height: 40px" href="personInfo.jsp"><img src="/image/test.jpg" class="img-circle img-responsive" style="width: 40px;height: 40px;margin-top: -10px"></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<script>
    $(document).ready(function () {
        $("#navuser").empty();
        var appendhtml="";
        var id=$.cookie("id");
        if($.cookie("id")!=0){
            if($.cookie("id")!=-1&&$.cookie("id")!=undefined){
                appendhtml+='<li><a href="login.jsp" onclick="login_out()"><span class="glyphicon glyphicon-log-out"></span>退出</a></li>';
                appendhtml+='<li>'+
                    '<a href=getMessage?id='+id+'>'+
                    '<span class="badge pull-right"><div id="count"/></span>消息'+
                    '</a>'+
                    '</li>';
                appendhtml+='<li>'+
                    '<a style="width: 40px;height: 40px" href=userMessage?id='+id+'><img src="/image/test.jpg"'+
                    'class="img-circle img-responsive"'+
                    'style="width: 40px;height: 40px;margin-top: -10px"></a>'+
                    '</li>';
                $.ajax({
                    type:"get",
                    url:"getCountMessage",
                    async: true,
                    data:{
                        id:id
                    },
                    success:function (flag) {
                        if (flag!=null){
                            $("#count").append(flag);
                        }

                    }

                })
            }
            else{
                appendhtml+='<li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span>&nbsp;登录</a></li>'+
                    '<li><a href="register.jsp">注册</a></li>';
            }
        }

        $("#navuser").append(appendhtml);


    })

    function login_out() {
        $.cookie("id",-1);
        $.cookie("token",-1);
    }
</script>

<div class="container">
    <div class="row">
        <h3 style="color: #2f904d">
            电影排行榜
        </h3>
        <div class="row">
            <ul class="nav navbar-nav">
                <li><a href="">评分最高</a></li>
                <li><a href="movie_getMovieByDate">最新</a></li>

            </ul>
        </div>
        <div class="row">
            <ul class="list-group">
                <hr>
                <c:forEach items="${rankingmovie}" var="movie">
                    <li class="list-group-item" style="border: none;height:200px">
                        <div class="col-md-2">
                            <c:choose>
                                <c:when test="${movie.images!=null&& fn:length(movie.images)>0}">
                                    <img src="${basepath}/image//${movie.images[0].imageName}" style="width: 120px;height: 150px">
                                </c:when>
                                <c:otherwise>
                                    <img src="${basepath}/image/noimage.png" style="width: 120px;height: 150px">
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="col-md-8">
                            <div class="row">
                                <a href="${basepath}/movie_getMovieById?id=${movie.id}">${movie.moviename}</a>
                            </div>
                            <br>
                            <div class="row">
                                <fmt:formatDate value="${movie.release_time}" pattern="yyyy-MM-dd"></fmt:formatDate>
                                <br>
                                ${movie.actor}
                            </div>
                            <br>
                            <div class="row">
                                <div id="star_con${movie.id}" class="star-vote">
                                    <span id="add_star${movie.id}" class="add-star"></span>
                                    <span id="del_star${movie.id}" class="del-star"></span>
                                </div>
                                <script>
                                    window.onload = showStar(${movie.filmscore});

                                    //n表示后台获取的星数
                                    function showStar(n) {
                                        var con_wid = document.getElementById("star_con${movie.id}").offsetWidth;
                                        var del_star = document.getElementById("del_star${movie.id}");
                                        console.log(con_wid);

                                        //透明星星移动的像素
                                        var del_move = (n * con_wid) / 10;

                                        del_star.style.backgroundPosition = -del_move + "px 0px";
                                        del_star.style.left = del_move + "px";
                                    }
                                </script>
                                &nbsp;${movie.filmscore}（${fn:length(movie.trailers)}人评价）
                            </div>
                        </div>
                    </li>
                    <hr>
                </c:forEach>

            </ul>
        </div>
    </div>

    <%--<div class="container">--%>
        <%--<div class="inner clearfix">--%>
            <%--<section id="main-content">--%>

                <%--<div class="text-center">--%>
                    <%--<ul class="pagination">--%>
                        <%--<li><a href="#">&laquo;</a></li>--%>
                        <%--<li class="active"><a href="#">1</a></li>--%>
                        <%--<li><a href="#">2</a></li>--%>
                        <%--<li><a href="#">3</a></li>--%>
                        <%--<li><a href="#">4</a></li>--%>
                        <%--<li><a href="#">5</a></li>--%>
                        <%--<li><a href="#">&raquo;</a></li>--%>
                        <%--<li>--%>
                            <%--<!--异步传输页数，返回数据得到结果-->--%>
                            <%--<form class="col-sm-3" role="form">--%>
                                <%--<div class="input-group">--%>
                                    <%--<input type="text" class="form-control">--%>
                                    <%--<span onclick="test()" class="input-group-addon">go</span>--%>
                                <%--</div>--%>
                            <%--</form>--%>
                        <%--</li>--%>
                        <%--<li><a style="border: none">共6页</a></li>--%>
                    <%--</ul>--%>
                <%--</div>--%>

            <%--</section>--%>

        <%--</div>--%>
    <%--</div>--%>

</div>

<!--底部版权信息-->
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