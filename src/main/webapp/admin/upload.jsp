<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <link href="/static_resources/upload/css/iconfont.css" rel="stylesheet" type="text/css"/>

    <link href="/static_resources/upload/css/fileUpload.css" rel="stylesheet" type="text/css">

    <script type="text/javascript" src="/static_resources/upload/js/fileUpload.js"></script>


<div id="fileUploadContent" class="fileUploadContent">

</div>
<script type="text/javascript">
    $("#fileUploadContent").initUpload({
        "uploadUrl":"#",//上传文件信息地址
        "progressUrl":"#",//获取进度信息地址，可选，注意需要返回的data格式如下（{bytesRead: 102516060, contentLength: 102516060, items: 1, percent: 100, startTime: 1489223136317, useTime: 2767}）
        "selfUploadBtId":"selfUploadBt",//自定义文件上传按钮id
        "isHiddenUploadBt":false,//是否隐藏上传按钮
        "isHiddenCleanBt":false,//是否隐藏清除按钮
        "isAutoClean":false,//是否上传完成后自动清除
        "velocity":10,//模拟进度上传数据
        //"rememberUpload":true,//记住文件上传
        // "showFileItemProgress":false,
        //"showSummerProgress":false,//总进度条，默认限制
        //"scheduleStandard":true,//模拟进度的方式，设置为true是按总进度，用于控制上传时间，如果设置为false,按照文件数据的总量,默认为false
        //"size":350,//文件大小限制，单位kb,默认不限制
        //"maxFileNumber":3,//文件个数限制，为整数
        //"filelSavePath":"",//文件上传地址，后台设置的根目录
        //"beforeUpload":beforeUploadFun,//在上传前执行的函数
        "onUpload":onUploadFun,//在上传后执行的函数
        //autoCommit:true,//文件是否自动上传
        //"fileType":['png','jpg','docx','doc']，//文件类型限制，默认不限制，注意写的是文件后缀

    });

    function beforeUploadFun(opt){
        opt.otherData =[{"name":"你要上传的参数","value":"你要上传的值"}];
    }
    function onUploadFun(opt,data){
        alert(data);
        uploadTools.uploadError(opt);//显示上传错误
    }
    function testUpload(){
        var opt = uploadTools.getOpt("fileUploadContent");
        uploadEvent.uploadFileEvent(opt);
    }
    function tt() {
        var opt = uploadTools.getOpt("fileUploadContent");
        uploadTools.uploadError(opt);//显示上传错误
    }

//    //显示文件，设置删除事件
//    uploadTools.showFileResult("fileUploadContent","img/a2.png","1",true,deleteFileByMySelf);
//    //如果不需要删除
//    uploadTools.showFileResult("fileUploadContent","img/a3.png","1",false);
    //多文件需要自己进行循环
    function deleteFileByMySelf(fileId){
        alert("要删除文件了："+fileId);
    }


</script>
