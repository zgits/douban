<%@ page contentType="text/html;charset=UTF-8" language="java" %>


    <link href="/static_resources/Admin/label/bootstrap-table.css" rel="stylesheet" media="screen">
    <script src="/static_resources/Admin/label/bootstrap-table.js" type="text/javascript"></script>
    <script src="/static_resources/Admin/label/bootstrap-table-zh-CN.js" charset="UTF-8" type="text/javascript"></script>



<table id="table"></table>
<script>
    $(function () {
        //先销毁表格，在初始化
        $('#table').bootstrapTable('destroy').bootstrapTable({
            columns: [{checkbox: true}, {
                title: '标签名',
                field: 'id',
                align: 'center',
            }, {
                title: '列名二',
                field: 'name',
                align: 'center',
                formatter: function (value, row, index) {
                    //处理格式化数据
                }
            },
                {
                    title: '添加时间',
                    field: 'createDate',
                    align: 'center',
                }],
            url: "user/list/", //请求数据的地址URL
            method: 'post',//请求方式(*)
            striped: true, //是否显示行间隔色
            cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性(*)
            pagination: true, //是否显示分页(*)
            sortable: true, //是否启用排序
            sortOrder: "desc", //排序方式
            sidePagination: "server", //分页方式：client客户端分页，server服务端分页(*)
            pageNumber: 1, //初始化加载第一页，默认第一页
            pageSize: 10, //每页的记录行数(*)
            pageList: [20, 50, 100], //可供选择的每页的行数(*)
            showColumns: false, //是否显示所有的列
            showRefresh: false, //是否显示刷新按钮
            minimumCountColumns: 2, //最少允许的列数
            clickToSelect: true, //是否启用点击选中行
            height: 800,
            detailView: true, //是否显示父子表    *关键位置*
            queryParamsType: "limit",
            contentType: "application/x-www-form-urlencoded; charset=UTF-8",
            checkboxHeader: true,
            search: false,
            singleSelect: true,
            striped: true,
            showColumns: true, // 开启自定义列显示功能
            responseHandler: function responseHandler(sourceData) {
                //这里要做分页，所以对返回的数据进行了处理
                return {
                    "total": sourceData.total, // 总条数
                    "rows": sourceData.rows // 返回的数据列表（后台返回一个list集合）
                };
            },
            queryParams: function queryParams(params) {
                //设置查询参数,就是把页面需要查询的字段通过jquery取值后传到后台
                var param = {
                    id: $("input[name='id']").val(),
                    name: $("input[name='name']").val(),
                    pageSize: params.limit, // 页面大小
                    pageNumber: (params.offset) / 10 + 1 // 页码
                };
                return param;
            },
            //注册加载子表的事件。你可以理解为点击父表中+号时触发的事件
            onExpandRow: function (index, row, $detail) {
                //这一步就是相当于在当前点击列下新创建一个table
                var cur_table = $detail.html('<table></table>').find('table');
                var html = "";
                html += "<table class='table'>";
                html += "<thead>";
                html += "<tr style='height: 40px;'>";
                html += "<th>用户id</th>";
                html += "<th>用户姓名</th>";
                html += "</tr>";
                html += "</thead>";
                $.ajax({
                    type: "post",
                    url: "user/list", //子表请求的地址
                    data: {id: row.id, name: row.name},//我这里是点击父表后，传递父表列id和nama到后台查询子表数据
                    async: false, //很重要，这里要使用同步请求
                    success: function (data) {
                        html += '<ul class="list-group" >'; //遍历子表数据
                        $.each(data.rows, function (n, value) {
                            html += "<tr  align='center'>" + "<td>" + value.id + "</td>" + "<td>" + value.name + "</td>" + "</tr>";
                        });
                        html += '</table>';
                        $detail.html(html); // 关键地方
                    }
                });
            },
        });
    });

</script>