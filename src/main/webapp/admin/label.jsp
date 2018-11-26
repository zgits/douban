<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%--<link href="/static_resources/Admin/label/bootstrap-table.css" rel="stylesheet" media="screen">--%>
<%--<script src="/static_resources/Admin/label/bootstrap-table.js" type="text/javascript"></script>--%>
<%--<script src="/static_resources/Admin/label/bootstrap-table-zh-CN.js" charset="UTF-8" type="text/javascript"></script>--%>


<%--参考https://www.cnblogs.com/wuhuacong/p/7284420.html--%>
<%--数据--%>
<div>
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
                <button class="btn btn-success">增加</button>
                <button class="btn btn-info">修改</button>
                <!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->
                <button class="btn btn-danger" onClick="delcfm()">删除 </button>            </th>
        </tr>
        <tr>
            <th>全部地区</th>
            <th>1</th>
            <th>无</th>
            <th>
                <button class="btn btn-success">增加</button>
                <button class="btn btn-info">修改</button>
                <!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->
                <button class="btn btn-danger" onClick="delcfm()">删除     </button>       </th>
        </tr>
        <tr>
            <th>全部地区</th>
            <th>1</th>
            <th>无</th>
            <th>
                <button class="btn btn-success">增加</button>
                <button class="btn btn-info">修改</button>
                <!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->
                <button class="btn btn-danger" onClick="delcfm()">删除     </button>       </th>
        </tr>
        <tr>
            <th>全部地区</th>
            <th>1</th>
            <th>无</th>
            <th>
                <button class="btn btn-success">增加</button>
                <button class="btn btn-info">修改</button>

                <!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->
                <button class="btn btn-danger" onClick="delcfm()">删除 </button>
            </th>
        </tr>
        <tr>
            <th>中国</th>
            <th>2</th>
            <th>全部地区</th>
            <th>
                <button class="btn btn-info">修改</button>
                <!--onClick="delcfm('${ctxPath}/manager/project/delete?id=${vo.id?default("")}')"-->
                <button class="btn btn-danger" onClick="delcfm()">删除</button>
            </th>
        </tr>
        </tbody>
    </table>

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

    <%--<jsp:include page="dialog.jsp"></jsp:include>--%>
<script>
    function delcfm(url) {
        $('#url').val(url);//给会话中的隐藏属性URL赋值
        $('#delcfmModel').modal();
    }
    function urlSubmit(){
        var url=$.trim($("#url").val());//获取会话中的隐藏属性URL
        window.location.href=url;
    }
</script>
    <div class="modal fade" id="delcfmModel">
        <div class="modal-dialog modal-sm">
            <div class="modal-content message_align">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                    <h4 class="modal-title">提示信息</h4>
                </div>
                <div class="modal-body">
                    <p>您确认要删除吗？</p>
                </div>
                <div class="modal-footer">
                    <input type="hidden" id="url"/>
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                    <a  onclick="urlSubmit()" class="btn btn-success" data-dismiss="modal">确定</a>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <!--弹出框-->
    <!--样例地址-->
    <!--https://www.cnblogs.com/shenzikun1314/p/6852928.html-->
    <%--<script src="/static_resources/Admin/dialog/js/showBo.js"></script>--%>
    <%--<script>--%>
        <%--//注册删除按钮的事件--%>

        <%--$("#btn_delete1").click(function () {--%>
            <%--//取表格的选中行数据--%>
<%--//    var arrselections = $("#tb_departments").bootstrapTable('getSelections');--%>
<%--//    if (arrselections.length <= 0) {--%>
<%--//    toastr.warning('请选择有效数据');--%>
<%--//    return;--%>
<%--//    }--%>

            <%--Ewin.confirm({message: "您确定删除该标签吗？"}).on(function (e) {--%>
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
    <%--<script>--%>
        <%--//注册删除按钮的事件--%>

        <%--$("#btn_delete2").click(function () {--%>
            <%--//取表格的选中行数据--%>
<%--//    var arrselections = $("#tb_departments").bootstrapTable('getSelections');--%>
<%--//    if (arrselections.length <= 0) {--%>
<%--//    toastr.warning('请选择有效数据');--%>
<%--//    return;--%>
<%--//    }--%>

            <%--Ewin.confirm({message: "您确定删除该标签吗？"}).on(function (e) {--%>
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
    <%--<script>--%>
        <%--//注册删除按钮的事件--%>

        <%--$("#btn_delete3").click(function () {--%>
            <%--//取表格的选中行数据--%>
<%--//    var arrselections = $("#tb_departments").bootstrapTable('getSelections');--%>
<%--//    if (arrselections.length <= 0) {--%>
<%--//    toastr.warning('请选择有效数据');--%>
<%--//    return;--%>
<%--//    }--%>

            <%--Ewin.confirm({message: "您确定删除该标签吗？"}).on(function (e) {--%>
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
    <%--<script>--%>
        <%--//注册删除按钮的事件--%>

        <%--$("#btn_delete4").click(function () {--%>
            <%--//取表格的选中行数据--%>
<%--//    var arrselections = $("#tb_departments").bootstrapTable('getSelections');--%>
<%--//    if (arrselections.length <= 0) {--%>
<%--//    toastr.warning('请选择有效数据');--%>
<%--//    return;--%>
<%--//    }--%>

            <%--Ewin.confirm({message: "您确定删除该标签吗？"}).on(function (e) {--%>
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
    <%--<script>--%>
        <%--//注册删除按钮的事件--%>

        <%--$("#btn_delete5").click(function () {--%>
            <%--//取表格的选中行数据--%>
<%--//    var arrselections = $("#tb_departments").bootstrapTable('getSelections');--%>
<%--//    if (arrselections.length <= 0) {--%>
<%--//    toastr.warning('请选择有效数据');--%>
<%--//    return;--%>
<%--//    }--%>

            <%--Ewin.confirm({message: "您确定删除该标签吗？"}).on(function (e) {--%>
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
