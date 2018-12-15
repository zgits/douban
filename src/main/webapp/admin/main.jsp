<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<c:set var="basepath" value="<%=basePath%>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员主页面</title>

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

    <link href="/static_resources/Admin/label/bootstrap-table.css" rel="stylesheet" media="screen">
    <script src="/static_resources/Admin/label/bootstrap-table.js" type="text/javascript"></script>
    <script src="/static_resources/Admin/label/bootstrap-table-zh-CN.js" charset="UTF-8" type="text/javascript"></script>

    <link href="/static_resources/toastr/toastr.css" rel="stylesheet"/>
    <script src="/static_resources/toastr/toastr.min.js"></script>


</head>
<body style="">

<!--侧边导航栏开始-->
<div  class="nav col-lg-3" style="min-height: 100%;">
    <div class="nav-top">
        <div id="mini" style="border-bottom:1px solid rgba(255,255,255,.1)"><img src="/static_resources/Admin/nav/images/mini.png" ></div>
    </div>
    <ul>
        <li class="nav-item">
            <a href="javascript:;"><i class="my-icon nav-icon icon_1"></i><span>管理电影</span><i class="my-icon nav-more"></i></a>
            <ul>
                <li id="li_one"><a href="javascript:;"><span >查看电影</span></a></li>
                <li id="li_two"><a href="javascript:;"><span >添加电影</span></a></li>
                <li id="li_five"><a href="javascript:;"><span >上传电影媒体信息</span></a></li>
            </ul>
        </li>
        <li class="nav-item" id="li_three">
            <a href="javascript:;"><i class="my-icon nav-icon icon_2"></i><span>用户管理</span><i class="my-icon nav-more"></i></a>
            <%--<ul>--%>
                <%--<li><a href="javascript:;"><span>站内新闻</span></a></li>--%>
                <%--<li><a href="javascript:;"><span>站内公告</span></a></li>--%>
                <%--<li><a href="javascript:;"><span>登录日志</span></a></li>--%>
            <%--</ul>--%>
        </li>
        <li class="nav-mini" id="li_four">
            <a href="javascript:;"><i class="my-icon nav-icon icon_3"></i><span>标签管理</span></a>
            <%--<ul>--%>
                <%--<li><a href="javascript:;"><span>订单列表</span></a></li>--%>
                <%--<li><a href="javascript:;"><span>打个酱油</span></a></li>--%>
                <%--<li><a href="javascript:;"><span>也打酱油</span></a></li>--%>
            <%--</ul>--%>
        </li>
    </ul>
</div>
<!--侧边导航栏结束-->
<!--右侧展示内容-->
<div class="container col-lg-10" style="background-color: white;">
    <div id="matter1">
        <div>
            <table style="width: 100%" class="table table-bordered" id="table_movie">
                <caption class="text-center" style="color: #2f904d;font-size: 25px">电影信息表</caption>
                <%--<thead>--%>
                <%--<tr>--%>
                <%--<th>电影名</th>--%>
                <%--<th>添加时间</th>--%>
                <%--<th>操作</th>--%>
                <%--</tr>--%>
                <%--</thead>--%>
                <%--<tbody>--%>
                <%--<tr>--%>
                <%--<th>xxxx</th>--%>
                <%--<th>2018-8-8</th>--%>
                <%--<th>--%>
                <%--<button class="btn btn-warning" data-toggle="modal" onclick="return get_edit_info(1)"--%>
                <%--data-target="#addUserModal">编辑</button>--%>
                <%--<button class="btn btn-info">查看</button>--%>
                <%--<!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->--%>
                <%--<button class="btn btn-danger" onClick="delcfm2()">删除</button>--%>
                <%--</th>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                <%--<th>xxxx</th>--%>
                <%--<th>2018-8-8</th>--%>
                <%--<th>--%>
                <%--<button class="btn btn-warning" data-toggle="modal" onclick="return get_edit_info(1)"--%>
                <%--data-target="#addUserModal">编辑</button>--%>
                <%--<button class="btn btn-info">查看</button>--%>
                <%--<!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->--%>
                <%--<button class="btn btn-danger" onClick="delcfm2()">删除</button>--%>
                <%--</th>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                <%--<th>xxxx</th>--%>
                <%--<th>2018-8-8</th>--%>
                <%--<th>--%>
                <%--<button class="btn btn-warning" data-toggle="modal" onclick="return get_edit_info(1)"--%>
                <%--data-target="#addUserModal">编辑</button>--%>
                <%--<button class="btn btn-info">查看</button>--%>
                <%--<!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->--%>
                <%--<button class="btn btn-danger" onClick="delcfm2()">删除</button>--%>
                <%--</th>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                <%--<th>xxxx</th>--%>
                <%--<th>2018-8-8</th>--%>
                <%--<th>--%>
                <%--<button class="btn btn-warning" data-toggle="modal" onclick="return get_edit_info(1)"--%>
                <%--data-target="#addUserModal">编辑</button>--%>
                <%--<button class="btn btn-info">查看</button>--%>
                <%--<!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->--%>
                <%--<button class="btn btn-danger" onClick="delcfm2()">删除</button>--%>
                <%--</th>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                <%--<th>xxxx</th>--%>
                <%--<th>2018-8-8</th>--%>
                <%--<th>--%>
                <%--<button class="btn btn-warning" data-toggle="modal" onclick="return get_edit_info(1)"--%>
                <%--data-target="#addUserModal">编辑--%>
                <%--</button>--%>
                <%--<button class="btn btn-info">查看</button>--%>
                <%--<!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->--%>
                <%--<button class="btn btn-danger" onClick="delcfm2()">删除</button>--%>
                <%--</th>--%>
                <%--</tr>--%>
                <%--</tbody>--%>
            </table>

            <%--<div class="">--%>
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

            <form method="post" action="" class="form-horizontal" role="form" id="form_data" onsubmit="return check_form()"
                  style="margin: 20px;">
                <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                    ×
                                </button>
                                <h4 class="modal-title" id="myModalLabel">
                                    修改电影信息
                                </h4>
                            </div>
                            <div class="modal-body">
                                <form class="form-horizontal" role="form">
                                    <div class="form-group">
                                        <label for="edit_moviename" class="col-sm-3 control-label">电影名字</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="edit_moviename" name="edit_moviename"
                                                   value="{edit_moviename}"
                                                   placeholder="电影名字">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="edit_directorname" class="col-sm-3 control-label">导演</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="edit_directorname" value="" id="edit_directorname"
                                                   placeholder="导演">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="edit_writername" class="col-sm-3 control-label">编剧</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" name="edit_writername" value="" id="edit_writername"
                                                   placeholder="编剧">
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label for="edit_actorname" class="col-sm-3 control-label">主演</label>
                                        <div class="col-sm-9">
                                <textarea class="form-control" name="edit_actorname" value="{edit_actorname}" id="edit_actorname"
                                          placeholder="主演">

                                </textarea>
                                        </div>
                                    </div>

                                    <!--复选框end-->
                                    <div class="form-group">
                                        <label for="edit_country" class="col-sm-3 control-label">选择制片地区/国家</label>
                                        <div class="col-sm-9">
                                            <select id="edit_country" class="form-control">
                                                <option>中国</option>
                                                <option>美国</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                            </select>
                                        </div>

                                    </div>

                                    <!--语言选择-->
                                    <div class="form-group">
                                        <label for="edit_language" class="col-sm-3 control-label">选择语言</label>
                                        <div class="col-sm-9">
                                            <select id="edit_language" class="form-control">
                                                <option>英语</option>
                                                <option>中文</option>
                                                <option>日语</option>
                                                <option>4</option>
                                                <option>5</option>
                                            </select>
                                        </div>

                                    </div>
                                    <!--语言选择end-->

                                    <!--上映时间-->
                                    <div class="form-group">
                                        <label for="edit_time" class="col-sm-3 control-label">上映时间</label>
                                        <div class="col-sm-9">
                                            <input type="date" class="form-control" id="edit_time">
                                        </div>
                                    </div>
                                    <!--上映时间end-->

                                    <!--上映时长-->
                                    <div class="form-group">
                                        <label for="edit_length" class="col-sm-3 control-label">时长(分钟)</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="edit_length"
                                                   placeholder="请输入上映时长（分钟）">
                                        </div>
                                    </div>
                                    <!--上映时长end-->
                                    <!--剧情简介-->
                                    <div class="form-group">
                                        <label for="edit_plot" class="col-sm-3 control-label">剧情简介</label>
                                        <div class="col-sm-9">
                                   <textarea rows="2" class="form-control" id="edit_plot"
                                             placeholder="剧情简介"></textarea>
                                        </div>
                                    </div>
                                    <!--剧情简介end-->
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                </button>
                                <button type="submit" class="btn btn-primary">
                                    提交
                                </button>
                                <span id="tip"> </span>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
            </form>

            <!--弹出框-->

            <div class="modal fade" id="delcfmModel2">
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
                            <input type="hidden" id="url"/>
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <a onclick="urlSubmit2()" class="btn btn-success" data-dismiss="modal">确定</a>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
            <script>
                function delcfm2(url) {
                    $('#url').val(url);//给会话中的隐藏属性URL赋值
                    $('#delcfmModel2').modal();
                }
                function urlSubmit2() {
                    var url = $.trim($("#url").val());//获取会话中的隐藏属性URL
                    window.location.href = url;
                }
            </script>
            <!--样例地址-->
            <!--https://www.cnblogs.com/shenzikun1314/p/6852928.html-->
            <%--<script src="/static_resources/Admin/dialog/js/showBo.js"></script>--%>
            <%--<script>--%>
            <%--//注册删除按钮的事件--%>
            <%--$("#btn_delete").click(function () {--%>
            <%--//取表格的选中行数据--%>
            <%--//    var arrselections = $("#tb_departments").bootstrapTable('getSelections');--%>
            <%--//    if (arrselections.length <= 0) {--%>
            <%--//    toastr.warning('请选择有效数据');--%>
            <%--//    return;--%>
            <%--//    }--%>

            <%--Ewin.confirm({message: "您确定删除该用户吗？"}).on(function (e) {--%>
            <%--alert(a);--%>
            <%--if (!e) {--%>
            <%--return;--%>
            <%--}--%>
            <%--$.ajax({--%>
            <%--type: "post",--%>
            <%--url: "/api/DepartmentApi/Delete",//提交的接口地址--%>
            <%--data: {"id": "1"},//要提交的数据--%>
            <%--success: function (data, status) {--%>
            <%--if (status == "success") {--%>
            <%--toastr.success('提交数据成功');--%>
            <%--$("#table_user").bootstrapTable('refresh');--%>
            <%--}--%>
            <%--},--%>
            <%--error: function () {--%>
            <%--toastr.error('Error');--%>
            <%--},--%>
            <%--complete: function () {--%>

            <%--}--%>

            <%--});--%>
            <%--});--%>
            <%--});--%>
            <%--</script>--%>
        </div>
        <!--增加电影之后，查看上传的电影信息，修改，删除，查找-->
        <script>
            // 提交表单
            function delete_info(id) {
                if (!id) {
                    alert('Error！');
                    return false;
                }
                // var form_data = new Array();

                $.ajax(
                    {
                        url: "action/user_action.php",
                        data: {"id": id, "act": "del"},
                        type: "post",
                        beforeSend: function () {
                            $("#tip").html("<span style='color:blue'>正在处理...</span>");
                            return true;
                        },
                        success: function (data) {
                            if (data > 0) {
                                alert('操作成功');
                                $("#tip").html("<span style='color:blueviolet'>恭喜，删除成功！</span>");

                                // document.location.href='world_system_notice.php'
                                location.reload();
                            }
                            else {
                                $("#tip").html("<span style='color:red'>失败，请重试</span>");
                                alert('操作失败');
                            }
                        },
                        error: function () {
                            alert('请求出错');
                        },
                        complete: function () {
                            // $('#tips').hide();
                        }
                    });

                return false;
            }

            // 编辑表单
            function get_edit_info(id) {
                if (!id) {
                    alert('Error！');
                    return false;
                }
                // var form_data = new Array();

                $.ajax(
                    {
                        url: "movie_getMovieToUpdate",//后台请求接口地址
                        data: {"id": id},
                        type: "post",
                        beforeSend: function () {
                            // $("#tip").html("<span style='color:blue'>正在处理...</span>");
                            return true;
                        },
                        success: function (data) {
                            alert(data);
                            if (data) {

                                // 解析json数据
                                var data = data;

                                var data_obj = eval("(" + data + ")");

                                // 赋值
                                $("#edit_moviename").val(data_obj.moviename);

                                $("#edit_directorname").val(data_obj.directorname);
                                $("#edit_writername").val(data_obj.writername);
                                $("#edit_actorname").val(data_obj.actorname);
                                $("#edit_country").val(data_obj.country);
                                $("#edit_language").val(data_obj.language);
                                $("#edit_time").val(data_obj.time);
                                $("#edit_length").val(data_obj.length);
                                $("#edit_plot").val(data_obj.plot);
                                $("#act").val("edit");

                                // 将input元素设置为readonly
                                $('#user_id').attr("readonly", "readonly")
                                // location.reload();
                            }
                            else {
                                $("#tip").html("<span style='color:red'>失败，请重试</span>");
                                //  alert('操作失败');
                            }
                        },
                        error: function () {
                            alert('请求出错');
                        },
                        complete: function () {
                            // $('#tips').hide();
                        }
                    });

                return false;
            }

            // 提交表单
            //    function check_form() {
            //        var user_id = $.trim($('#user_id').val());
            //        var act = $.trim($('#act').val());
            //
            //        if (!user_id) {
            //            alert('用户ID不能为空！');
            //            return false;
            //        }
            //        var form_data = $('#form_data').serialize();
            //
            //        // 异步提交数据到action/add_action.php页面
            //        $.ajax(
            //            {
            //                url: "action/user_action.php",
            //                data: {"form_data": form_data, "act": act},
            //                type: "post",
            //                beforeSend: function () {
            //                    $("#tip").html("<span style='color:blue'>正在处理...</span>");
            //                    return true;
            //                },
            //                success: function (data) {
            //                    if (data > 0) {
            //
            //                        var msg = "添加";
            //                        if (act == "edit") msg = "编辑";
            //                        $("#tip").html("<span style='color:blueviolet'>恭喜，" + msg + "成功！</span>");
            //                        // document.location.href='system_notice.php'
            //                        alert(msg + "OK！");
            //                        location.reload();
            //                    }
            //                    else {
            //                        $("#tip").html("<span style='color:red'>失败，请重试</span>");
            //                        alert('操作失败');
            //                    }
            //                },
            //                error: function () {
            //                    alert('请求出错');
            //                },
            //                complete: function () {
            //                    $('#acting_tips').hide();
            //                }
            //            });
            //
            //        return false;
            //    }

            $(function () {
                $('#addUserModal').on('hide.bs.modal', function () {
                    // 关闭时清空edit状态为add
                    $("#act").val("add");
                    location.reload();
                })
            });
        </script>

        <%--<div class="panel-body" style="padding-bottom:0px;">--%>
        <%--<div class="panel panel-default">--%>
        <%--<div class="panel-heading">查询条件</div>--%>
        <%--<div class="panel-body">--%>
        <%--<form id="formSearch" class="form-horizontal">--%>
        <%--<div class="form-group" style="margin-top:15px">--%>
        <%--<label class="control-label col-sm-1" for="txt_search_departmentname">部门名称</label>--%>
        <%--<div class="col-sm-3">--%>
        <%--<input type="text" class="form-control" id="txt_search_departmentname">--%>
        <%--</div>--%>
        <%--<label class="control-label col-sm-1" for="txt_search_statu">状态</label>--%>
        <%--<div class="col-sm-3">--%>
        <%--<input type="text" class="form-control" id="txt_search_statu">--%>
        <%--</div>--%>
        <%--<div class="col-sm-4" style="text-align:left;">--%>
        <%--<button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</form>--%>
        <%--</div>--%>
        <%--</div>--%>

        <div id="toolbar" class="btn-group">
        <button id="btn_add" type="button" class="btn btn-default">
        <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
        </button>
        <button id="btn_edit" type="button" class="btn btn-default">
        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>修改
        </button>
        <button id="btn_delete" type="button" class="btn btn-default">
        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
        </button>
        </div>


        <div id="reportTableDiv" >
            <table id="reportTable"></table>
        </div>
        <script type="text/javascript">

            $(function () {
                $('#reportTable').bootstrapTable({
                    url : 'getMovieTable.action', // 请求后台的URL（*）
                    pagination: true,
                    dataType: "json",
                    pagination: true, //前端处理分页
                    singleSelect: false,//是否只能单选
                    search: true, //显示搜索框，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                    toolbar: '#toolbar', //工具按钮用哪个容器
                    striped: true, //是否显示行间隔色
                    cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                    pageNumber: 1, //初始化加载第10页，默认第一页
                    pageSize: 3, //每页的记录行数（*）
                    pageList: [10, 20, 50, 100], //可供选择的每页的行数（*）
                    strictSearch: true,//设置为 true启用 全匹配搜索，false为模糊搜索
                    showColumns: true, //显示内容列下拉框
                    showRefresh: true, //显示刷新按钮
                    minimumCountColumns: 2, //当列数小于此值时，将隐藏内容列下拉框
                    clickToSelect: true, //设置true， 将在点击某行时，自动勾选rediobox 和 checkbox
                   // height: 500, //表格高度，如果没有设置height属性，表格自动根据记录条数决定表格高度#}
                    uniqueId: "id", //每一行的唯一标识，一般为主键列
                    showToggle: true, //是否显示详细视图和列表视图的切换按钮
                    cardView: false, //是否显示详细视图
                    //detailView: true, //是否显示父子表，设置为 true 可以显示详细页面模式,在每行最前边显示+号#}
                    sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
                    columns: [
                        {
                            checkbox:true
                        },
                        //定义表头,这个表头必须定义,下边field后边跟的字段名字必须与后端传递的字段名字相同.如:id、name、price
                        //跟后端的字段名id  name price是完全一样的


                        {
                            field: 'moviename',
                            title: '电影名',
                            align: 'center'
                        }, {
                            field: 'release_time',
                            title: '上映时间',
                            align: 'center',
                            formatter: function (value, row, index) {
                                return changeDateFormat(value)
                            }

                        }, {
                            title: '操作',
                            field: 'id',
                            align: 'center',
                            formatter: function (value, row, index) {
                                var e = '<button class="btn btn-warning" data-toggle="modal" onclick="return get_edit_info(1) "data-target="#addUserModal">编辑 </button> ';  //row.id为每行的id
                                var d = '<button class="btn btn-info">查看</button>';
                                var c='<button class="btn btn-danger" onClick="delcfm2()">删除</button>';
                                return e + d+c;
                            }
                        }
                    ],
                });
            });
            //转换日期格式(时间戳转换为datetime格式)
            function changeDateFormat(cellval) {
                var dateVal = cellval + "";
                if (cellval != null) {
                    var date = new Date(parseInt(dateVal.replace("/Date(", "").replace(")/", ""), 10));
                    var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
                    var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();

                    var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
                    var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
                    var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();

                    return date.getFullYear() + "-" + month + "-" + currentDate + " " + hours + ":" + minutes + ":" + seconds;
                }
            }
        </script>
    </div>
    <div id="matter2" style="display: none">
        <%--<jsp:include page="addmovie.jsp"></jsp:include>--%>
    </div>

    <div id="matter3" style="display: none">
        <div style="height:650px">
            <table class="table table-bordered" id="table_user">
                <caption class="text-center" style="color: #2f904d;font-size: 25px">用户信息表</caption>
                <%--<thead>--%>
                <%--<tr>--%>
                    <%--<th>昵称</th>--%>
                    <%--<th>邮箱</th>--%>
                    <%--<th>密码</th>--%>
                    <%--<th>个人介绍</th>--%>
                    <%--<th>状态</th>--%>
                    <%--<th>上次登录时间</th>--%>
                    <%--<th>操作</th>--%>
                <%--</tr>--%>
                </thead>
                <%--<tbody>--%>
                <%--<c:forEach items="${pageBean.lists}" var="users">--%>
                    <%--<tr>--%>
                        <%--<th id="">${users.username}</th>--%>
                        <%--<th>${users.email}</th>--%>
                        <%--<th>${users.password}</th>--%>
                        <%--<th>${users.person_profile}</th>--%>
                        <%--<th>--%>
                            <%--<c:choose>--%>
                                <%--<c:when test="${!empty users.endTime}">--%>
                                    <%--禁言结束日期${users.endTime}--%>
                                <%--</c:when>--%>
                                <%--<c:otherwise>--%>
                                    <%--正常--%>
                                <%--</c:otherwise>--%>
                            <%--</c:choose>--%>
                        <%--</th>--%>
                        <%--<th>${users.last_login}</th>--%>
                        <%--<th>--%>
                            <%--<c:choose>--%>
                                <%--<c:when test="${!empty users.endTime}">--%>
                                    <%--<button class="btn btn-info" onclick="deleteForbidden('${users.id}')">解禁</button>--%>
                                <%--</c:when>--%>
                                <%--<c:otherwise>--%>
                                    <%--<button class="btn btn-warning" data-toggle="modal" data-target="#myModal"--%>
                                            <%--onclick="Values('${users.id}')">禁言--%>
                                    <%--</button>--%>
                                <%--</c:otherwise>--%>
                            <%--</c:choose>--%>
                                <%--&lt;%&ndash;<!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->&ndash;%&gt;--%>
                            <%--<button class="btn btn-danger" onClick="delcfm1('${users.id}')">删除</button>--%>
                        <%--</th>--%>
                    <%--</tr>--%>
                <%--</c:forEach>--%>
                <%--</tbody>--%>
            </table>

            <div id="userTableDiv" >
                <table id="userTable"></table>
            </div>



            <div id="loading" class="col-md-offset-5" style="position: absolute; z-index: 100;"></div>

            <%--<div>--%>
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

            <!-- 模态框（Modal） -->
            <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content" style="width: 400px">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                ×
                            </button>
                            <h4 class="modal-title" id="myModalLabel3">
                                请输入禁言天数
                            </h4>
                        </div>
                        <form id="form_data3">
                            <div class="modal-body">
                                禁言天数: <input class="form-control" type="text" id="days" name="days"/>
                                <input type="hidden" id="id" value="" name="id"/><!---禁言用户的id-->
                                禁言原因: <input class="form-control" type="text" id="reason" name="reason"/>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                                </button>
                                <button type="button" onclick="add_info()" data-dismiss="modal" class="btn btn-primary">
                                    禁言
                                </button>
                            </div>
                        </form>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>

            <script>
                //绑定模态框展示的方法 
                $("#myModal3").modal("hide");
                function Values(id) {
                    $("#id").val(id);
                }
            </script>
              
            <%--模糊框--%>
            <div class="modal fade" id="delcfmModel1">
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
                            <input type="hidden" id="url3"/>
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <a onclick="urlSubmit1()" class="btn btn-danger" data-dismiss="modal">确定</a>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

            <%--解禁模态框--%>
            <div class="modal fade" id="deleteForbidden">
                <div class="modal-dialog modal-sm">
                    <div class="modal-content message_align">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">×</span></button>
                            <h4 class="modal-title">提示信息</h4>
                        </div>
                        <div class="modal-body">
                            <p>您确认要解禁吗？</p>
                        </div>
                        <div class="modal-footer">
                            <input type="hidden" id="id1"/>
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <a onclick="submitDelForbidden()" class="btn btn-success" data-dismiss="modal">确定</a>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

            <script type="text/javascript">

                $(function () {
                    $('#userTable').bootstrapTable({
                        url : 'getAllUserToTable.action', // 请求后台的URL（*）
                        pagination: true,
                        dataType: "json",
                        pagination: true, //前端处理分页
                        singleSelect: false,//是否只能单选
                        search: true, //显示搜索框，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
                        toolbar: '#toolbar', //工具按钮用哪个容器
                        striped: true, //是否显示行间隔色
                        cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
                        pageNumber: 1, //初始化加载第10页，默认第一页
                        pageSize: 3, //每页的记录行数（*）
                        pageList: [10, 20, 50, 100], //可供选择的每页的行数（*）
                        strictSearch: true,//设置为 true启用 全匹配搜索，false为模糊搜索
                        showColumns: true, //显示内容列下拉框
                        showRefresh: true, //显示刷新按钮
                        minimumCountColumns: 2, //当列数小于此值时，将隐藏内容列下拉框
                        clickToSelect: true, //设置true， 将在点击某行时，自动勾选rediobox 和 checkbox
                        // height: 500, //表格高度，如果没有设置height属性，表格自动根据记录条数决定表格高度#}
                        uniqueId: "id", //每一行的唯一标识，一般为主键列
                        showToggle: true, //是否显示详细视图和列表视图的切换按钮
                        cardView: false, //是否显示详细视图
                        //detailView: true, //是否显示父子表，设置为 true 可以显示详细页面模式,在每行最前边显示+号#}
                        sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
                        columns: [
                            {
                                checkbox:true
                            },
                            //定义表头,这个表头必须定义,下边field后边跟的字段名字必须与后端传递的字段名字相同.如:id、name、price
                            //跟后端的字段名id  name price是完全一样的


                            {
                                field: 'username',
                                title: '昵称',
                                align: 'center'
                            },

                            {
                                field: 'email',
                                title: '邮箱',
                                align: 'center'
                            },

                            {
                                field: 'password',
                                title: '密码',
                                align: 'center'
                            },

                            {
                                field: 'endtime',
                                title: '状态',
                                align: 'center'
                            }, {
                                field: 'last_login',
                                title: '上次登录时间',
                                align: 'center',
                                formatter: function (value, row, index) {
                                    return changeDateFormat(value)
                                }

                            }, {
                                title: '操作',
                                field: 'id',
                                align: 'center',
                                formatter: function (value, row, index) {
                                    var e = '<button class="btn btn-warning" data-toggle="modal" onclick="return get_edit_info(1) "data-target="#addUserModal">编辑 </button> ';  //row.id为每行的id
                                    var d = '<button class="btn btn-info">查看</button>';
                                    var c='<button class="btn btn-danger" onClick="delcfm2()">删除</button>';
                                    return e + d+c;
                                }
                            }
                        ],
                    });
                });
                //转换日期格式(时间戳转换为datetime格式)
                function changeDateFormat(cellval) {
                    var dateVal = cellval + "";
                    if (cellval != null) {
                        var date = new Date(parseInt(dateVal.replace("/Date(", "").replace(")/", ""), 10));
                        var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
                        var currentDate = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();

                        var hours = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
                        var minutes = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
                        var seconds = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();

                        return date.getFullYear() + "-" + month + "-" + currentDate + " " + hours + ":" + minutes + ":" + seconds;
                    }
                }
            </script>
            <script>
                function delcfm1(url) {
                    $('#url3').val(url);//给会话中的隐藏属性URL赋值
                    $('#delcfmModel1').modal();
                }
                function urlSubmit1() {
                    var id = $.trim($("#url3").val());//获取会话中的隐藏属性URL
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

                    $.ajax({
                        type: "get",
                        url: "${basepath}/manageruserdeleteUser",
                        async: true,
                        data: {
                            id:id
                        },
                        beforeSend: function (XMLHttpRequest) {
                            $("#loading").html("<img src='/image/loading1.gif' />"); //在后台返回success之前显示loading图标
                        },
                        success: function (flag) {
                            $("#loading").empty();
                            if (flag == 1) {
                                toastr.success('删除成功');
                            } else {

                                toastr.error('删除失败');
                            }
                            setTimeout("window.location.reload()",3000);

                        }
                    })
                }
            </script>

            <script>
                function deleteForbidden(id) {
                    $('#id1').val(id);//给会话中的隐藏属性URL赋值
                    $('#deleteForbidden').modal();
                }
                function submitDelForbidden() {
                    var id = $.trim($("#id1").val());//获取会话中的隐藏属性URL
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

                    $.ajax({
                        type: "get",
                        url: "${basepath}/manageruserdeleteForbidden",
                        async: true,
                        data: {
                            id:id
                        },
                        beforeSend: function (XMLHttpRequest) {
                            $("#loading").html("<img src='/image/loading1.gif' />"); //在后台返回success之前显示loading图标
                        },
                        success: function (flag) {
                            $("#loading").empty();
                            if (flag == 1) {
                                toastr.success('解禁成功');
                            } else {

                                toastr.error('解禁失败');
                            }
                            setTimeout("window.location.reload()",3000);

                        }
                    })
                }
            </script>
            <script>

                // update表单
                function update_info(id) {
                    var id = id;
                    //复杂一点的json的另一种形式
                    var value2 = {"user_id": "123456", "username": "coolcooldool"};


                    // $('input[name=username]').removeAttr("readonly");//去除input元素的readonly属性
                    var obj2 = eval(value2);
                    // alert(obj2);

                    // 赋值
                    $("#user_id").val(obj2.user_id);
                    $("#user_name").val(obj2.username);
                    $("#act").val("edit");

                    // 将input元素设置为readonly
                    $('#user_id').attr("readonly", "readonly")

                }


                // 添加入库操作
                function add_info() {

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
                    var form_data = $("#form_data").serialize();

                    $.ajax({
                        type: "get",
                        url: "${basepath}/manageruserinsertForbidden",
                        async: true,
                        data: form_data,
                        beforeSend: function (XMLHttpRequest) {
                            $("#loading").html("<img src='/image/loading1.gif' />"); //在后台返回success之前显示loading图标
                        },
                        success: function (flag) {
                            $("#loading").empty();
                            if (flag == 1) {
                                toastr.success('禁言成功');
                            } else {

                                toastr.error('禁言失败');
                            }
                            setTimeout("window.location.reload()",3000);

                        }
                    })

                }


            </script>
        </div>
    </div>
    <div id="matter4" style="display: none">
        <%--<jsp:include page="label.jsp"></jsp:include>--%>
    </div>
    <div id="matter5" style="display: none">
        <%--<jsp:include page="upload.jsp"></jsp:include>--%>
    </div>
    <%--&lt;%&ndash;src="${basepath}/manageruserfindAll"&ndash;%&gt;--%>
        <%--<iframe  frameborder='0' scrolling="no" class="container col-lg-12 " style="height:650px;margin:0px;float:left;">    //右栏原始页面--%>
        <%--</iframe>--%>
</div>
<!--右侧展示内容end-->

<script type="text/javascript">
    <%--$(function () {--%>
<%--//        $("#li_one").click(function(){--%>
<%--//            $("iframe").attr("src", "movie.jsp");--%>
<%--//        });--%>
        <%--$("#li_two").click(function(){--%>

            <%--$("iframe").attr("src", "addmovie.jsp");--%>
        <%--});--%>
        <%--&lt;%&ndash;$("#li_three").click(function(){&ndash;%&gt;--%>

            <%--&lt;%&ndash;$("iframe").attr("src", "${basepath}/manageruserfindAll");&ndash;%&gt;--%>
        <%--&lt;%&ndash;});&ndash;%&gt;--%>
        <%--$("#li_four").click(function(){--%>

            <%--$("iframe").attr("src", "label.jsp");--%>
        <%--});--%>
        <%--$("#li_five").click(function(){--%>

            <%--$("iframe").attr("src", "upload.jsp");--%>
        <%--});--%>
    <%--});--%>
</script>


<script>
    $(document).ready(function() {
        var temp = "none";

        $("#li_one").click(function () {
            openMatter(1);
        });
        $("#li_two").click(function () {
            openMatter(2);
        });
        $("#li_three").click(function () {
            openMatter(3);
        });
        $("#li_four").click(function () {
            openMatter(4);
        });
        $("#li_five").click(function () {
            openMatter(5);
        });
        function openMatter(obj) {
            for (var i = 1; i < 6; i++) {
                if (i == obj) {
                    temp = "block";
                } else {
                    temp = "none";
                }
                document.getElementById("matter" + i).style.display = temp;

            }
        }
    });
</script>
</body>
</html>