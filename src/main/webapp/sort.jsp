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
    <title>分类页面</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="/static_resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="/static_resources/bootstrap/jquery/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="/static_resources/bootstrap/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="static_resources/backgroud/css/crowd.css">

    <script src="/static_resources/cookie/jquery.cookie.min.js"></script>

    <link rel="icon" href="image/logo.PNG" type="image/x-icon"/>


    <style>
        .blue
        {
            color:blue;
        }
    </style>
</head>
<body>

<!--导航栏-->
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

<!--分类标签-->
<div class="container">
    <!--设置样式-->
    <div class="col-md-8" id="sort">

        <ul class="list-inline">
            <li>
                <button class="btn btn-primary btn-md active" style="border: none">全部类型</button>
            </li>

        </ul>
        <ul class="list-inline">
            <li>
                <button class="btn btn-primary btn-md active" style="border: none">全部地区</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">中国大陆</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">美国</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">香港</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">台湾</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">丹麦</button>
            </li>
        </ul>
        <ul class="list-inline">
            <li>
                <button class="btn btn-primary btn-md active" style="border: none">全部年代</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">2018</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">2017</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">70年代</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">60年代</button>
            </li>
            <li>
                <button class="btn btn-default btn-md" style="border: none">更早</button>
            </li>
        </ul>
        <ul class="list-inline">
            <li>
                <button class="btn btn-primary btn-md active" style="border: none">全部特色</button>
            </li>

        </ul>
    </div>
</div>

<div class="container">
    <div class="col-md-8" style="background-color: #2f904d">

    </div>

</div>
<!--展示分类内容标签-->
<div class="container">
    <div class="col-md-8" style="margin-top: 20px">
        <ul class="list-inline" id="showlabelmovie">
            <li style="width: 142px;height: 200px">
                <img src="/image/duye.png" class="img-responsive" style="width: 132px;height: 150px;">
                <div class="caption">
                    <h6>毒液：致命守护.&nbsp;&nbsp;7.6</h6>
                </div>
            </li>
            <li style="width: 142px;height: 200px">
                <img src="/image/duye.png" class="img-responsive" style="width: 132px;height: 150px;">
                <div class="caption">
                    <h6>毒液：致命守护.&nbsp;&nbsp;7.6</h6>
                </div>
            </li>
            <li style="width: 142px;height: 200px">
                <img src="/image/duye.png" class="img-responsive" style="width: 132px;height: 150px;">
                <div class="caption">
                    <h6>毒液：致命守护.&nbsp;&nbsp;7.6</h6>

                </div>
            </li>
            <li style="width: 142px;height: 200px">
                <img src="/image/duye.png" class="img-responsive" style="width: 132px;height: 150px;">
                <div class="caption">
                    <h6>毒液：致命守护.&nbsp;&nbsp;7.6</h6>


                </div>
            </li>
            <li style="width: 142px;height: 200px">
                <img src="/image/kenan.png" class="img-responsive" style="width: 132px;height: 150px;">
                <div class="caption">
                    <h6>毒液：致命守护.&nbsp;&nbsp;7.6</h6>


                </div>
            </li>
            <li style="width: 142px;height: 200px">
                <img src="/image/kenan.png" class="img-responsive" style="width: 132px;height: 150px;">
                <div class="caption">
                    <h6>毒液：致命守护.&nbsp;&nbsp;7.6</h6>

                </div>
            </li>
            <li style="width: 142px;height: 200px">
                <img src="/image/kenan.png" class="img-responsive" style="width: 132px;height: 150px;">
                <div class="caption">
                    <h6>柯南：零的执行者&nbsp;&nbsp;7.6</h6>
                </div>
            </li>
            <li style="width: 142px;height: 200px">
                <img src="/image/kenan.png" class="img-responsive" style="width: 132px;height: 150px;">
                <div class="caption">
                    <h6>柯南：零的执行者&nbsp;&nbsp;7.6</h6>

                </div>
            </li>
        </ul>

    </div>
</div>
<!--分页-->

<!--底部版权栏-->
<div class="footer navbar-fixed-bottom" style="font:12px Tahoma;color: white;text-align:center;">
    <div  style="background-color: #0f0f0f">
        <hr/>
        Copyright &copy; &nbsp;&nbsp;2018-2019&nbsp;
        xxx小组 ALL RIGHT RESERVED<br/>
        联系方式：xxxx@gmail.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意见反馈<br/><br/>

    </div>
</div>

<!--底部版权信息-->
</body>
</html>
<script>

    var tags=[];
    $(document).ready(function () {
        $("#sort").empty();
        $.ajax({
            url:"getAllLabelsToShow",
            type:"post",
            success:function (data) {
                var level1=[];
                var level2=[];
                var appendthml="";
                var data=JSON.parse(data);
                for(var i=0;i<data.length;i++){
                    if(data[i].level==1){
                        level1.push(data[i]);
                        tags.push(data[i])
                    }
                    if(data[i].level==2){
                        level2.push(data[i]);
                    }
                }
                for(var i=0;i<level1.length;i++){
                    var id=level1[i].id;
                    var level=level1[i].level;
                    var name=level1[i].name;
                    var parentId=level1[i].parentId;
                    appendthml+='<ul class="list-inline">'+
                                '<li class="'+level1[i].id+'" id="'+level1[i].id+'">'+
                                '<button onclick="getResult('+id+','+level+',\''+name+'\','+parentId+')" class="btn btn-primary btn-md active" style="border: none">'+level1[i].name+'</button>'+
                                '</li>';
                    for(var j=0;j<level2.length;j++){
                        if(level2[j].parentId==level1[i].id){
                            var id=level2[j].id;
                            var level=level2[j].level;
                            var name=level2[j].name;
                            var parentId=level2[j].parentId;
                            appendthml+='<li class="'+level2[j].id+'" id="'+id+'">'+
                                        '<button onclick="getResult('+id+','+level+',\''+name+'\','+parentId+')" class="btn btn-default btn-md" style="border: none">'+level2[j].name+'</button>'+
                                        '</li>';
                        }
                    }
                    appendthml+='</ul>';
                    getResult(2,1,'全部地区',1);
                }
                $("#sort").append(appendthml);

            }
        })
    })





    
    function getResult(id,level,name,parentId) {


        $("#"+id).children().removeClass("btn-default");
        $("#"+id).children().addClass("btn-primary active");
        $("#"+id).siblings().children().removeClass("btn-primary active");
        $("#"+id).siblings().children().addClass("btn-default");

        var obj={
            "id":id,
            "level":level,
            "name":name,
            "parentId":parentId
        }
        tags.push(obj);
        $.ajax({
            dataType: "json",
            url:"movie_getMoviesByLabel",
            data:{
                "labels":JSON.stringify(tags)
            },
            type:"post",
            traditional : true,
            success:function (data) {
                $("#showlabelmovie").empty();
                var appendhtml="";
                console.log(data);
                var json=data;
                if(json.length==0){
                    appendhtml+='暂无该电影';
                }
                for(var i=0;i<json.length;i++){
                    appendhtml+='<li style="width: 142px;height: 200px">';

                    if(json[i].images.length>0){
                        console.log(json[i].images[0].imageName);
                        appendhtml+='<img src="/image/'+json[i].images[0].imageName+'"';
                    }else{
                        appendhtml+='<img src="/image/noimage.png"';
                    }
                    appendhtml+='class="img-responsive" style="width: 132px;height: 150px;">'+
                                '<div class="caption">'+
                                '<h6><a href=movie_getMovieById?id='+json[i].id+'>'+json[i].moviename+'</a>&nbsp;&nbsp;评分&nbsp;&nbsp;';
                    if(json[i].filmscore!=undefined){
                        appendhtml+=json[i].filmscore;
                    }else{
                        appendhtml+='暂无评分';
                    }
                    appendhtml+='</h6></div>'+
                                '</li>';
                }
                $("#showlabelmovie").append(appendhtml);
            }
        })

    }




</script>

