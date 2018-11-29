package com.ssh.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.*;
import java.util.Date;

/**
 * Created by 幻夜~星辰 on 2018/11/29.
 */
@Controller("MovieAction")
public class MovieAction extends ActionSupport{

    MultipartFile file;
    private File[ ] upload;//要上传的文件对象(upload必须是页面File控件的name属性一致)
    private String[ ] uploadContentType;//要上传文件的类型(页面File控件的name属性+ContentType)
    private String[ ] uploadFileName;//要上传的文件名称(页面File控件的name属性+FileName)
    private String savePath="D:\\";//获取上传文件的保存路径
    private InputStream inputStream;//下载文件的输入流
    private Date upDate=new Date();//上传日期


    public File[] getUpload() {
        return upload;
    }

    public void setUpload(File[] upload) {
        this.upload = upload;
    }

    public String[] getUploadContentType() {
        return uploadContentType;
    }

    public void setUploadContentType(String[] uploadContentType) {
        this.uploadContentType = uploadContentType;
    }

    public String[] getUploadFileName() {
        return uploadFileName;
    }

    public void setUploadFileName(String[] uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public String getSavePath() {
        return savePath;
    }

    public void setSavePath(String savePath) {
        this.savePath = savePath;
    }

    public InputStream getInputStream() {
        return inputStream;
    }

    public void setInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    public Date getUpDate() {
        return upDate;
    }

    public void setUpDate(Date upDate) {
        this.upDate = upDate;
    }

    // 业务方法
    public String saveFile() {
//
//        byte[] buffer=new byte[1024];//缓冲数据，每秒以1kb的速度上传文件（可调）
//        for(int i=0;i<upload.length;i++){
//            try{
//                //读取要上传的文件
//                FileInputStream fis=new FileInputStream (upload[i]);
//                //获得保存的路径,将文件保存在根目录的upload的文件夹内
//                savePath=ServletActionContext.getServletContext().getRealPath("/upload");
//
//                //将读到的文件保存到指定位置
//                FileOutputStream fos=new FileOutputStream(savePath+"\\"+uploadFileName[i]);
//
//                //检查上传的文件夹是否存在，不存在则新建
//                File file=new File(savePath);
//                if(!file.exists()){
//                    file.mkdirs();
//                }
//
//                //使用缓冲读入信息并完成文件的保存工作
//                int length=fis.read(buffer);
//                while(length>0){//只要还能读到东西就一直保存
//                    fos.write(buffer,0,length);//从最开始的位置开始读，直到最后的位置
//                    length=fis.read(buffer);
//                }
//
//                //关闭配置
//                fis.close();
//                fos.flush();
//                fos.close();
//
//            }catch (FileNotFoundException e) {
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//            } catch (IOException e) {
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//            }
//        }

//        FileParam fileParam=new FileParam();
//        String path = request.getSession().getServletContext().getRealPath("upload");
//        String fileName = file.getOriginalFilename();
//        File dir = new File(path,fileName);
//        long size=file.getSize();
//        System.out.println(size);
//        if(!dir.exists()){
//            dir.mkdirs();
//        }
//        //MultipartFile自带的解析方法
//        file.transferTo(dir);
//        //获取当前时间
//        Date now = new Date();
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//可以方便地修改日期格式
//        String time = dateFormat.format( now );
//        //设置属性，存入数据库文件信息
//        fileParam.setFilename(fileName);
//        fileParam.setPath(path);
//        fileParam.setTime(time);
//        Result<Integer> result=fileService.uploadFile(fileParam);
//        if(CommonCode.HAND_SUCCESS.getCode().equals(result.getCode())){
//            return view(CommonCode.HAND_SUCCESS, result.getData());
//        }
        return "success";
    }

}
