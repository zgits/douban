package com.ssh.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Image;
import com.ssh.service.ImageService;
import com.ssh.service.MovieServie;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/19.
 */
@Controller("Image")
public class ImageAction extends ActionSupport{

    @Autowired
    private ImageService imageService;

    @Autowired
    private MovieServie movieServie;

    public String gerAllImage(){
        //获取数据库中所有的数据
        List<Image> images = new ArrayList<>();
        try {
            images = imageService.getAllImage();
        } catch (Exception e) {

        }
        if (images != null) {
            System.out.println("成功取得" + images.size() + "条数据...");
        } else {
            System.out.println("查询失败...");
        }
        JSONArray arr = new JSONArray();
        //判定最大的读取个数
        //读取数据
        for (Image image : images) {
            JSONObject ob = new JSONObject();
            //将单独的数据装进json数据
            ob.put("id", image.getId());
            ob.put("name", image.getName());
            ob.put("path",image.getPath());
            ob.put("imagename",image.getImageName());
            ob.put("moviename", movieServie.getMovieNameById(image.getMovieId()));
            //装进数组
            arr.add(ob);
        }
        JSONObject ob = new JSONObject();
        //放置数据
        ob.put("rows", arr);
        //放置所有的数据个数
        ob.put("total", images.size());
        String returndata = ob.toString();
        System.out.println("成功转换" + returndata.length() + "大小的数据...");
        System.out.println(arr);
        System.out.println(returndata);
        //转换编码
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        PrintWriter out;
        try {
            out = ServletActionContext.getResponse().getWriter();
            out.println(returndata);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "success";
    }

    private Integer id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void deleteImage() throws IOException {
        String flag = "";
        try {
            if (imageService.deleteImage(id)) {
                flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式
                System.out.println("成功");
            } else {
                flag = JSON.toJSONString(2);//使用fastjson将数据转换成json格式
            }
        } catch (Exception e) {
            flag = JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }

        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);

        writer.flush();

        writer.close();
    }


    private File upload;   //上传到服务器的文件对象
    private String uploadContentType;  //上传的文件类型
    private String uploadFileName;   //上传文件的名称
    private Integer movieId;//所属的电影id
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getMovieId() {
        return movieId;
    }

    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }

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
        String path="D:\\maventest\\doubanssh\\src\\main\\webapp\\image";
        String flag ="";

        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        //创建目标文件对象
        try{
            File destFile = new File(path,sdf.format(date)+uploadFileName);
            //把上传的文件，拷贝到目标文件中
            FileUtils.copyFile(upload, destFile);

            System.out.println("uploadend");

            List<Image> images=new ArrayList<>();

            Image image=new Image();
            image.setMovieId(movieId);
            image.setImageName(sdf.format(date)+uploadFileName);
            image.setName(name);
            image.setPath(path);
            images.add(image);
            imageService.insertImage(images);
            flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式

        }catch (Exception e){
            flag =JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }


        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);

        System.out.println("成功");

        writer.flush();

        writer.close();

        return "success";
    }
    /*******end*******/

    /**
     * 批量删除图片
     */
    private Integer[] ids;

    public Integer[] getIds() {
        return ids;
    }

    public void setIds(Integer[] ids) {
        this.ids = ids;
    }

    public void deleteImages() throws IOException {
        String flag ="";
        try{
            if(imageService.deleteImages(ids)){
                flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式
                System.out.println("成功");
            }else{
                flag =JSON.toJSONString(2);//使用fastjson将数据转换成json格式
            }

        }catch (Exception e){
            flag =JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }

        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);

        writer.flush();

        writer.close();

    }

}
