<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%--<link href="/static_resources/Admin/Label/bootstrap-table.css" rel="stylesheet" media="screen">--%>
<%--<script src="/static_resources/Admin/Label/bootstrap-table.js" type="text/javascript"></script>--%>
<%--<script src="/static_resources/Admin/Label/bootstrap-table-zh-CN.js" charset="UTF-8" type="text/javascript"></script>--%>
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

<%--上传--%>

<%--参考https://www.cnblogs.com/wuhuacong/p/7284420.html--%>
<%--数据--%>
<div>
    <%--展示数据--%>
    <table class="table table-bordered" id="table_user">
        <caption class="text-center" style="color: #2f904d;font-size: 25px">分类信息表</caption>
        <thead>
        <tr>
            <th>分类名称</th>
            <th>分类等级</th>
            <th>父级分类</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <th>全部地区</th>
            <th>1</th>
            <th>无</th>
            <th>
                <button class="btn btn-success" data-toggle="modal" data-target="#addLabel">增加</button>
                <button class="btn btn-info" data-toggle="modal" onclick="return get_edit_info1(1)"
                        data-target="#edit_label">修改
                </button>
                <!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->
                <button class="btn btn-danger" onClick="delcfm()">删除</button>
            </th>
        </tr>
        <tr>
            <th>全部地区</th>
            <th>1</th>
            <th>无</th>
            <th>
                <button class="btn btn-success" data-toggle="modal" data-target="#addLabel">增加</button>
                <button class="btn btn-info" data-toggle="modal" onclick="return get_edit_info1(1)"
                        data-target="#edit_label">修改
                </button>
                <!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->
                <button class="btn btn-danger" onClick="delcfm()">删除</button>
            </th>
        </tr>
        <tr>
            <th>全部地区</th>
            <th>1</th>
            <th>无</th>
            <th>
                <button class="btn btn-success" data-toggle="modal" data-target="#addLabel">增加</button>
                <button class="btn btn-info" data-toggle="modal" onclick="return get_edit_info(1)"
                        data-target="#edit_label">修改
                </button>
                <!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->
                <button class="btn btn-danger" onClick="delcfm()">删除</button>
            </th>
        </tr>
        <tr>
            <th>全部地区</th>
            <th>1</th>
            <th>无</th>
            <th>
                <button class="btn btn-success" data-toggle="modal" data-target="#addLabel">增加
                </button>
                <button class="btn btn-info" data-toggle="modal" onclick="return get_edit_info1(1)"
                        data-target="#edit_label">修改
                </button>

                <!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->
                <button class="btn btn-danger" onClick="delcfm()">删除</button>
            </th>
        </tr>
        <tr>
            <th>中国</th>
            <th>2</th>
            <th>全部地区</th>
            <th>
                <button class="btn btn-info" data-toggle="modal" onclick="return get_edit_info1(1)"
                        data-target="#edit_label">修改
                </button>
                <!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->
                <button class="btn btn-danger" onClick="delcfm()">删除</button>
            </th>
        </tr>
        </tbody>
    </table>
    <%--展示数据end--%>
    <%--分页--%>
    <div>
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
    <%--分页end--%>
    <!--修改弹出框样式-->
    <form method="post" action="" class="form-horizontal" role="form" id="form_data" onsubmit="return check_form()"
          style="margin: 20px;">
        <div class="modal fade" id="edit_label" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            ×
                        </button>
                        <h4 class="modal-title" id="myModalLabel">
                            修改标签信息
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="edit_labelname" class="col-sm-3 control-label">标签名字</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="edit_labelname" name="edit_labelname"
                                           value="{edit_labelname}"
                                           placeholder="标签名字">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="edit_parentname" class="col-sm-3 control-label">上一级分类</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" name="edit_parentname" value=""
                                           id="edit_parentname"
                                           placeholder="上一级分类">
                                </div>
                            </div>


                            <!--语言选择-->
                            <div class="form-group">
                                <label for="edit_fenlei" class="col-sm-3 control-label">所属分类</label>
                                <div class="col-sm-9">
                                    <select id="edit_fenlei" class="form-control">
                                        <option>全部语言</option>
                                        <option>全部地区</option>
                                        <option>年代</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </div>

                            </div>
                            <!--语言选择end-->


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
    <%--得到要修改的数据的js--%>
    <script>
        // 编辑表单
        function get_edit_info1(id) {
            if (!id) {
                alert('Error！');
                return false;
            }
            // var form_data = new Array();

            $.ajax(
                {
                    url: "action/user_action.php",//后台请求接口地址
                    data: {"id": id, "act": "get"},
                    type: "post",
                    beforeSend: function () {
                        // $("#tip").html("<span style='color:blue'>正在处理...</span>");
                        return true;
                    },
                    success: function (data) {
                        if (data) {

                            // 解析json数据
                            var data = data;

                            var data_obj = eval("(" + data + ")");

                            // 赋值
                            $("#edit_labelname").val(data_obj.labelname);

                            $("#edit_parentname").val(data_obj.parentname);
                            $("#edit_fenlei").val(data_obj.fenlei);
//                            暂时这样命名
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
    </script>
    <%--修改数据end--%>
    <%--删除弹出框--%>
    <script>
        function delcfm(url) {
            $('#url').val(url);//给会话中的隐藏属性URL赋值
            $('#delcfmModel').modal();
        }
        function urlSubmit() {
            var url = $.trim($("#url").val());//获取会话中的隐藏属性URL
            window.location.href = url;
        }
    </script>
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
                    <input type="hidden" id="url"/>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <a onclick="urlSubmit()" class="btn btn-success" data-dismiss="modal">确定</a>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    <%--删除弹出框end--%>

    <%--增加模糊框--%>

    <form method="post" action="" class="form-horizontal" role="form" id="form_data" onsubmit="return check_form()"
          style="margin: 20px;">
        <div class="modal fade" id="addLabel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            ×
                        </button>
                        <h4 class="modal-title" id="addMessage">
                            增加分类
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label for="addLabelName" class="col-sm-3 control-label">分类名字</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="addLabelName" name="addLabel"
                                           placeholder="电影名字">
                                </div>
                            </div>


                            <!--复选框end-->
                            <div class="form-group">
                                <label for="edit_country" class="col-sm-3 control-label">选择分类</label>
                                <div class="col-sm-9">
                                    <select id="edit_country" class="form-control">
                                        <option>全部地区</option>
                                        <option>全部年代</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </div>

                            </div>

                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭
                        </button>
                        <button type="submit" class="btn btn-primary">
                            提交
                        </button>
                        <%--<span id="tip"> </span>--%>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>
    </form>
</div>
