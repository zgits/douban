package com.ssh.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.PageBean;
import com.ssh.model.Trailer;
import com.ssh.service.MovieServie;
import com.ssh.service.TrailerService;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/5.
 */
@Controller("Trailer")
public class TrailerAction extends ActionSupport {


    @Autowired
    private TrailerService trailerService;

    @Autowired
    private MovieServie movieServie;

    /**
     * 根据id获取预告片信息，包括评论，我（zjf）的主要是评论
     ********/

    private Integer id;

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public String getTrailer() {

        Trailer trailer = trailerService.getMovieTrailer(id);
        ActionContext.getContext().put("OneTrailer", trailer);
        return "success";
    }
    /************根据id获取预告片及评论end**************/


    /*************后台得到所有预告片start**************/
    public String getAllTrailers() throws IOException {


        //获取数据库中所有的数据
        List<Trailer> trailers = new ArrayList<>();
        try {
            trailers = trailerService.getAllTrailer();
        } catch (Exception e) {

        }
        if (trailers != null) {
            System.out.println("成功取得" + trailers.size() + "条数据...");
        } else {
            System.out.println("查询失败...");
        }
        JSONArray arr = new JSONArray();
        //判定最大的读取个数
        //读取数据
        for (Trailer trailer : trailers) {
            JSONObject ob = new JSONObject();
            //将单独的数据装进json数据
            ob.put("id", trailer.getId());
            ob.put("trailername", trailer.getName());
            ob.put("time", trailer.getTime());
            ob.put("moviename", movieServie.getMovieNameById(trailer.getMovieId()));

            //装进数组
            arr.add(ob);
        }
        JSONObject ob = new JSONObject();
        //放置数据
        ob.put("rows", arr);
        //放置所有的数据个数
        ob.put("total", trailers.size());
        String returndata = ob.toString();
        System.out.println("成功转换" + returndata.length() + "大小的数据...");
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
    /*************后台得到所有预告片end***************/

    /**********删除预告片start**********/
    public void deleteTrailer() throws IOException {
        String flag = "";
        try {
            if (trailerService.deleteTrailer(id)) {
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
    /*********删除预告片end***********/


    /***********文件上传简单版*************/
    private File upload;   //上传到服务器的文件对象
    private String uploadContentType;  //上传的文件类型
    private String uploadFileName;   //上传文件的名称
    private Integer movieId;//所属的电影id

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

    public String saveFile1() throws IOException {
        ///拿到上传的文件，进行处理
        System.out.println("FileUpload.execute()"+uploadFileName);
        /**
         * 把文件上传到upload目录
         */
        String path="D:/date";

        String flag ="";
        //创建目标文件对象
        try{
            File destFile = new File(path,uploadFileName);
            //把上传的文件，拷贝到目标文件中
            FileUtils.copyFile(upload, destFile);

            System.out.println("uploadend");

            List<Trailer> trailers=new ArrayList<>();

            Trailer trailer=new Trailer();
            trailer.setTime(new Date());
            trailer.setMovieId(movieId);
            trailer.setName(uploadFileName);
            trailer.setPath(path+"/"+uploadFileName);
            trailers.add(trailer);
            trailerService.insertTrailer(trailers);
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


    private Integer[] ids;

    public Integer[] getIds() {
        return ids;
    }

    public void setIds(Integer[] ids) {
        this.ids = ids;
    }

    public void deleteTrailers() throws IOException {
        String flag ="";
        try{
            if(trailerService.deleteTrailers(ids)){
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
