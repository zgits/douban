<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<c:set var="basepath" value="<%=basePath%>" />

<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="/static_resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="/static_resources/bootstrap/jquery/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="/static_resources/bootstrap/js/bootstrap.min.js"></script>

<%--<link href="/static_resources/font-awesome/css/font-awesome.css" rel="stylesheet">--%>

<link href="/static_resources/Admin/nav/css/nav.css" rel="stylesheet">

<link href="/static_resources/Admin/nav/fonts/iconfont.css" rel="stylesheet">

<script src="/static_resources/Admin/nav/js/nav.js"></script>

<link href="/static_resources/toastr/toastr.css" rel="stylesheet"/>
<script src="/static_resources/toastr/toastr.min.js"></script>
<style>
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
<br>

<div id="loading" style="display: none">
    <div class="loading show">
        <img src='/image/loading1.gif' />
    </div>
</div>

<div  class="form-horizontal" role="form">
    <div class="form-group">
        <label for="moviename" class="col-sm-2 control-label">电影名字</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="moviename"
                   placeholder="请输入电影名字">
        </div>
    </div>
    <div class="form-group">
        <label for="directorname" class="col-sm-2 control-label">导演</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="directorname"
                   placeholder="请输入导演名字，以/分隔">
        </div>
    </div>
    <div class="form-group">
        <label for="writername" class="col-sm-2 control-label">编剧</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="writername"
                   placeholder="请输入编剧名字，以/分隔">
        </div>
    </div>
    <div class="form-group">
        <label for="actorname" class="col-sm-2 control-label">主演</label>
        <div class="col-sm-8">
            <textarea rows="2" class="form-control" id="actorname"
                      placeholder="请输入主演名字，以/分隔"></textarea>
        </div>
    </div>
    <!--这里有个类型的复选框-->
    <!--复选框end-->
    <div class="form-group">
        <label for="country" class="col-sm-2 control-label">选择制片地区/国家</label>
        <div class="col-sm-5">
            <select id="country" class="form-control">
                <option value="中国">中国</option>
                <option value="美国">美国</option>
            </select>
        </div>

    </div>

    <!--语言选择-->
    <div class="form-group">
        <label for="language" class="col-sm-2 control-label">选择语言</label>
        <div class="col-sm-5">
            <select id="language" class="form-control">
                <option value="英语">英语</option>
                <option value="中文">中文</option>
                <option value="日语">日语</option>

            </select>
        </div>

    </div>
    <!--语言选择end-->

    <!--上映时间-->
    <div class="form-group">
        <label for="time" class="col-sm-2 control-label">上映时间</label>
        <div class="col-sm-5">
            <input type="date" class="form-control" id="time">
        </div>
    </div>
    <!--上映时间end-->

    <!--上映时长-->
    <div class="form-group">
        <label for="length" class="col-sm-2 control-label">时长(分钟)</label>
        <div class="col-sm-5">
            <input type="text" class="form-control" id="length"
                   placeholder="请输入上映时长（分钟）">
        </div>
    </div>
    <!--上映时长end-->
    <!--剧情简介-->
    <div class="form-group">
        <label for="plot" class="col-sm-2 control-label">剧情简介</label>
        <div class="col-sm-8">
            <textarea rows="2" class="form-control" id="plot"
                      placeholder="剧情简介"></textarea>
        </div>
    </div>
    <!--剧情简介end-->

    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-10">
            <button type="submit" class="btn btn-default" onclick="addmovie()">添加</button>
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

    function addmovie() {
        var moviename=$("#moviename").val();
        var directorname=$("#directorname").val();
        var writername=$("#writername").val();
        var actorname=$("#actorname").val();
        var options=$("#country option:selected");
        var country=options.val();
        var loptions=$("#language option:selected");
        var language=loptions.val();
        var time=$("#time").val();
        var length=$("#length").val();
        var plot=$("#plot").val();
        $.ajax({
            type:"post",
            url:"${basepath}/movie_addMovie",
            data:{
                "movie.moviename":moviename,
                "movie.director":directorname,
                "movie.writername":writername,
                "movie.actor":actorname,
                "movie.region":country,
                "movie.language":language,
                "movie.release_time":time,
                "movie.length":length,
                "movie.plot_introduction":plot
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

        });
    }

</script>



