<%--
  Created by IntelliJ IDEA.
  User: 幻夜~星辰
  Date: 2018/11/25
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<link href="/static_resources/upload/css/fileinput.min.css" rel="stylesheet">

<script src="/static_resources/upload/js/fileinput.min.js"></script>

<script src="/static_resources/upload/js/fileinput_locale_zh.js"></script>

<div class="">

    <br>
    <form class="form-horizontal" role="form" enctype="multipart/form-data">

        <div class="form-group">
            <label for="selectname" class="col-sm-2 control-label">选择电影</label>
            <div class="col-sm-5">
                <select id="selectname" class="form-control">
                    <option>xxx电影名1</option>
                    <option>xxx电影名2</option>
                    <option>xxx电影名3</option>
                    <option>xxx电影名4</option>
                    <option>xxx电影名5</option>
                </select>
            </div>

        </div>
        <div class="form-group col-sm-8">
            <input id="file-1" type="file" multiple class="file" data-overwrite-initial="false" data-min-file-count="1">
        </div>
        <div class="form-group">
            <div class="col-sm-offset-7 col-sm-2">
                <button type="submit" class="btn btn-default" onclick="test()">上传</button>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    function test() {
        var message=$('#selectname option:selected').text();//选中的文本
        alert(message);
    }
    $("#file-1").fileinput({
        uploadUrl: '#', // you must set a valid URL here else you will get an error
        allowedFileExtensions : ['jpg', 'png','gif'],
        overwriteInitial: false,
        maxFileSize: 100000,
        maxFilesNum: 5,
        showUpload: false, //是否显示上传按钮
        showRemove:false,
        //allowedFileTypes: ['Image', 'video', 'flash'],
        slugCallback: function(filename) {
            return filename.replace('(', '_').replace(']', '_');
        },
        layoutTemplates:{
            actionUpload:'' // 预览区域的上传按钮
        }
    });

</script>