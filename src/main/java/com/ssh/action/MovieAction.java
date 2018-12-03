package com.ssh.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import java.io.*;

/**
 * Created by 幻夜~星辰 on 2018/11/29.
 */
@Controller("MovieAction")
public class MovieAction extends ActionSupport{

    private File upload;   //上传到服务器的文件对象
    private String uploadContentType;  //上传的文件类型
    private String uploadFileName;   //上传文件的名称

    public File getUpload() {
        return upload;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public String getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public String getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }




    public String saveFile() throws IOException {


        ///拿到上传的文件，进行处理
        System.out.println("FileUpload.execute()"+uploadFileName);
        /**
         * 把文件上传到upload目录
         */
        //获取上传的目录的路径
//        String path = ServletActionContext.getServletContext().getRealPath("d:/date");
        String path="D:/date";
        //创建目标文件对象
        File destFile = new File(path,uploadFileName);
        //把上传的文件，拷贝到目标文件中
        FileUtils.copyFile(upload, destFile);

        System.out.println("end");

        return "success";
    }

}
