<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>本人提示消息界面</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="/static_resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="/static_resources/bootstrap/jquery/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="/static_resources/bootstrap/js/bootstrap.min.js"></script>

    <!--<link rel="stylesheet" type="text/css" href="http://www.jq22.com/jquery/font-awesome.4.6.0.css">-->
    <link rel="stylesheet" type="text/css" href="static_resources/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="static_resources/checkbox/css/build.css">

    <link rel="stylesheet" href="static_resources/dialog/css/dialog.css">

    <link href="/static_resources/toastr/toastr.css" rel="stylesheet"/>
    <script src="/static_resources/toastr/toastr.min.js"></script>

    <style>
        * {
            margin: 0;
            padding: 0;
            font-size: 12px;
        }
        html, body {
            height: 100%;
            width: 100%;
        }
        #alert {
            z-index: 2;
            border: 1px solid rgba(0,0,0,.2);
            width: 598px;
            height: auto;
            border-radius: 6px;
            box-shadow: 0 5px 15px rgba(0,0,0,.5);
            background: #fff;
            z-index: 1000;
            position: absolute;
            left: 50%;
            top: 15%;
            margin-left: -299px;
            display: none;
        }
        .model-head {
            padding: 15px;
            color: #73879C;
            border-bottom: 1px solid #e5e5e5;
        }
        .close {
            padding: 0;
            cursor: pointer;
            background: 0 0;
            border: 0;
            float: right;
            font-size: 14px !important;
            font-weight: 700;
            text-shadow: 0 1px 0 #fff;
            opacity: 0.4;
            margin-top: 5px;
        }
        #close:hover {
            cursor: pointer;
            color: #000;
        }
        #mask {
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: 100%;
            background: #000;
            opacity: 0.3;
            display: none;
            z-index: 1;
        }
        .model-content {
            position: relative;
            padding: 15px;
        }
        .model-foot {
            padding: 15px;
            text-align: right;
        }
    </style>

</head>
<!--需要加一个已读的，2018-11-26-->
<body>
<!--导航栏-->
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
                <ul class="nav navbar-nav">
                    <li><a href="login.html"><span class="glyphicon glyphicon-log-out"></span>退出</a></li>
                    <li><a href="login.html" class="a globalLoginBtn"><span
                            class="glyphicon glyphicon-log-in"></span>&nbsp;登录</a></li>
                    <li><a href="register.html">注册</a></li>
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

<div class="container">
    <div class="row">
        <div class="row">
            <div class="col-md-6">
                <input type="button" value="全选" class="btn" id="selectAll">
                <input type="button" value="反选" class="btn" id="reverse">
            </div>
            <div class="col-md-5">
                <a href="#" onclick="update()">
                    标为已读
                    <span class="glyphicon glyphicon-envelope">
            </span>
                </a>
                <a href="#" onclick="deleteMessage()">
                    &nbsp;&nbsp;&nbsp;删除<span class="glyphicon glyphicon-trash"></span>
                </a>
            </div>
            <script type="text/javascript" src="static_resources/dialog/js/dialog.js"></script>
        </div>
    </div>
    <br>
    <div class="row">
        <!--注意里面的id，checkbox每个需要不同-->

        <ul class="list-group" id="owners">
            <c:forEach items="${pagebeans.lists}" var="pagebean" >
            <li class="list-group-item">
                <div class="checkbox checkbox-success">
                    <input id="${pagebean.userId}" class="styled" type="checkbox" name="message" value="${pagebean.id}">
                    <label for="${pagebean.userId}">
                       来自${pagebean.sender}的信息:${pagebean.message}
                        <br>
                        <span style="color: rgb(91, 81, 191); font-size: 14px;">${pagebean.time}</span>
                    </label>
                </div>
            </li>
            </c:forEach>
        </ul>

    </div>

    <div class="container">
        <div class="inner clearfix">
            <section id="main-content">

                <div class="text-center">
                    <ul class="pagination">
                        <li><a href="getMessage?id=1&&currpage=1">&laquo;</a></li>
                        <c:forEach var="count" begin="1" end="${pagebeans.totalPage}">
                        <li><a href="getMessage?id=1&&currpage=${count}">${count}</a></li>
                        </c:forEach>

                        <li><a href="getMessage?id=1&&currpage=${pagebeans.totalPage}">&raquo;</a></li>
                        <li>
                            <!--异步传输页数，返回数据得到结果-->
                            <form class="col-sm-3" role="form">
                                <div class="input-group">
                                    <input type="text" class="form-control">
                                    <span onclick="test()" class="input-group-addon">go</span>
                                </div>
                            </form>
                        </li>
                        <li><a style="border: none">共${pagebeans.totalPage}页</a></li>
                    </ul>
                </div>

            </section>

        </div>
    </div>
</div>
<%--模态框--%>
<div class="modal fade" id="delcfmModel">
    <div class="modal-dialog modal-sm">
        <div class="modal-content message_align">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">×</span></button>
                <h4 class="modal-title">提示信息</h4>
            </div>
            <div class="modal-body">
                <p>您确认要删除吗？</p>
            </div>
            <div class="modal-footer">
                <input type="hidden" id="deletetodel"/>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button onclick="opreatedelete()" class="btn btn-info" data-dismiss="modal">确定</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div>
<!--底部版权信息-->
<div class="navbar-fixed-bottom" style="font:12px Tahoma;color: white;text-align:center;">
    <div style="background-color: #0f0f0f">
        <hr/>
        Copyright &copy; &nbsp;&nbsp;2018-2019&nbsp;
        xxx小组 ALL RIGHT RESERVED<br/>
        联系方式：xxxx@gmail.com&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;意见反馈<br/><br/>

    </div>
</div>
<!--全选，单选-->
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
$("#selectAll").click(function () {
$("#owners input:checkbox").each(function () {
$(this).prop('checked', true);//

});
});

$("#unSelect").click(function () {
$("#owners input:checkbox").removeAttr("checked");
});

$("#reverse").click(function () {
$("#owners input:checkbox").each(function () {
this.checked = !this.checked;
});
});
function update() {
    list=document.getElementsByName("message");
     var check_val=[];
    for(i in list){
        if(list[i].checked){
            check_val.push(list[i].value);
        }
    }
    $.ajax({
        type: "get",
        url: "${basepath}/updateMessage",//后台更新的地址
        async: true,
        traditional : true,//需要加入这句代码才能正确的将数组正确的传到后台，要不然传的是Null
        data: {
            ids: check_val
         }
        }
    )
    window.location.href="getMessage?id=1"
}

function deleteMessage(){

    $("#delcfmModel").modal();
}
function opreatedelete(){
    list=document.getElementsByName("message");
    var check_val=[];
    for(i in list){
        if(list[i].checked){
            check_val.push(list[i].value);
        }
    }
    $.ajax({
            type: "post",
            url: "${basepath}/deleteMessage",//后台删除的地址
            async: true,
            traditional : true,//需要加入这句代码才能正确的将数组正确的传到后台，要不然传的是Null
            data: {
                ids: check_val
            },
            success:function (flag) {
            if(flag==1){
                toastr.success('删除成功');
            }else{
                toastr.error("删除失败");
            }
            setTimeout("window.location.reload()",1000);
        }
        }
    )

    //window.location.href="getMessage?id=1"
}



</script>


</body>
</html>
