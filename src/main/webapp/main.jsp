<%@ page import="java.util.Date" %>
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
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>主页</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="/static_resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="/static_resources/bootstrap/jquery/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="/static_resources/bootstrap/js/bootstrap.min.js"></script>

    <!--显示星数-->
    <link href="static_resources/star/star.css" rel="stylesheet">

    <script src="/static_resources/cookie/jquery.cookie.min.js"></script>

    <link rel="icon" href="image/logo.PNG" type="image/x-icon"/>

    <style>
        #wapper{
            position: relative;   /*重要！保证footer是相对于wapper位置绝对*/
            height: auto;          /* 保证页面能撑开浏览器高度时显示正常*/
            min-height: 100%  /* IE6不支持，IE6要单独配置*/
        }
        #footer{
            position: absolute;  bottombottom: 0; /* 关键 */
            left:0; /* IE下一定要记得 */
            height: 60px;         /* footer的高度一定要是固定值*/
        }
        #main-content{
            padding-bottom: 60px; /*重要！给footer预留的空间*/
        }
    </style>

</head>
<body>

<!--logo,导航栏个人信息栏，---->
<nav class="navbar navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="getMoving"><img class="img-circle" src="image/logo.PNG"
                                                          style="width:55px;height:55px;margin-top: -15px"></a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="getMoving">电影</a></li>
                <li ><a href="getAllTrailer">预告片</a></li>
            </ul>

            <!--<a href="" class="btn btn-primary btn-sm navbar-btn navbar-right">联系我们</a>-->
            <div class="profile navbar-right">
                <ul class="nav navbar-nav" id="navuser">

                </ul>
            </div>
        </div>
    </div>
</nav>

<script>
    $(document).ready(function () {
        $("#navuser").empty();
        var appendhtml="";
        appendhtml+='<li><a href="bgmain"><span class="glyphicon glyphicon-cog"></span>管理入口</a></li>';
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
<!--热点内容-->
<div class="container">

</div>

<!--各个标签的简单情况-->
<div class="container">
    <div class="row">
        <div class="col-xs-2">
            <h2>电影</h2>
            <!--针对电影的标签-->
            <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="movie_getMovieByScore">排行榜</a></li>
                <li><a href="getAllTrailer">预告片</a></li>
                <!--<li><a href="#">影评</a></li>-->
                <li><a href="sort.jsp">分类</a></li>
            </ul>
        </div>
        <div class="col-md-7">
            <ul class="nav nav-tabs">
                <li>
                    <a class="btn btn-default btn-lg">正在热映</a>
                </li>
                <li>
                    <a href="movie_getMovieByDate">更多</a>
                </li>
            </ul>
            <ul class="list-inline">
                <!--设置详情介绍居中未设置，-->
                <c:set var="today">
                    <fmt:formatDate value="<%=new Date()%>" type="date"/>
                </c:set>
                <c:set var="num" value="${0}"/>
                <c:forEach items="${movies}" var="movie" >
                    <fmt:parseDate value="${today}" var="tod" pattern="yyyy-MM-dd"/>
                    <fmt:parseDate value="${movie.release_time}" var="time" pattern="yyyy-MM-dd"/>
                    <fmt:formatNumber value="${(tod.getTime()-time.getTime())/1000/60/60/24}" pattern="#0" var="date"/>
                    <c:choose>
                        <c:when test="${date>=0&&date<=30&&num<=7}">
                            <c:set value="${num+1}" var="num"/>
                <li>
                    <c:choose>
                        <c:when test="${movie.images[0]!=null}">
                      <img src="${basepath}/image/${movie.images[0].imageName}" class="img-responsive" style="width: 132px;height: 150px;">
                        </c:when>
                        <c:otherwise>
                            <img src="${basepath}/image/noimage.png" class="img-responsive" style="width: 132px;height: 150px;">
                        </c:otherwise>
                    </c:choose>
                    <div class="caption">
                        <h6>${movie.moviename}</h6>
                        <div class="text-center">
                            <div id="star_con_movie${movie.id}" class="star-vote">
                                <span id="add_star_movie${movie.id}" class="add-star"></span>
                                <span id="del_star_movie${movie.id}" class="del-star"></span>
                            </div>
                            <script>
                                window.onload = showStar(${movie.filmscore});

                                //n表示后台获取的星数
                                function showStar(n) {
                                    var con_wid = document.getElementById("star_con_movie${movie.id}").offsetWidth;
                                    var del_star = document.getElementById("del_star_movie${movie.id}");
                                    console.log(con_wid);

                                    //透明星星移动的像素
                                    var del_move = (n * con_wid) / 10;

                                    del_star.style.backgroundPosition = -del_move + "px 0px";
                                    del_star.style.left = del_move + "px";
                                }
                            </script>
                            &nbsp;${movie.filmscore}
                        </div>
                        <p>
                            <%--默认的id为1，后期更改--%>
                            <a href="${basepath}/movie_getMovieById?id=${movie.id}" class="btn btn-primary btn-xs" role="button">
                                详情介绍
                            </a>
                        </p>
                    </div>
                </li>
                        </c:when>
                    </c:choose>
                </c:forEach>

            </ul>


        </div>
        <div class="col-md-3">
            <div class="row">

                <div class="col-md-10">
                    近期热门(<a href="movie_getMovieByDate">更多</a>)
                    <ul class="nav nav-pills nav-stacked">
                        <c:set var="today">
                            <fmt:formatDate value="<%=new Date()%>" type="date"/>
                        </c:set>
                        <c:set var="num" value="${0}"/>
                        <c:forEach items="${movies}" var="movie" >
                        <fmt:parseDate value="${today}" var="tod" pattern="yyyy-MM-dd"/>
                        <fmt:parseDate value="${movie.release_time}" var="time" pattern="yyyy-MM-dd"/>
                        <fmt:formatNumber value="${(tod.getTime()-time.getTime())/1000/60/60/24}" pattern="#0" var="date"/>
                        <c:choose>
                        <c:when test="${date>=0&&date<=30&&num<=4}">
                        <c:set value="${num+1}" var="num"/>
                        <li>
                            <a href="movie_getMovieById?id=${movie.id}">${num}.${movie.moviename}</a>
                        </li>
                        </c:when>
                        </c:choose>
                        </c:forEach>
                        <%--<li>--%>
                            <%--<a href="#">2.网络谜踪</a>--%>
                        <%--</li>--%>
                    </ul>

                </div>
            </div>
        </div>
    </div>
    <!--底部版权信息-->
</div>

<div style="height: 120px">

</div>
<div class="footer navbar-fixed-bottom" style="font:12px Tahoma;color: white;text-align:center;">
    <div style="background-color: #0f0f0f">
        <hr/>
        Copyright &copy; &nbsp;&nbsp;2018-2019&nbsp;
        xxx小组 ALL RIGHT RESERVED<br/>
        联系方式：xxxx@gmail.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意见反馈<br/>

    </div>
</div>

<script>
</script>
</body>
</html>