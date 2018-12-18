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
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/5.
 */
@Controller("Trailer")
public class TrailerAction extends ActionSupport{


    @Autowired
    private TrailerService trailerService;

    @Autowired
    private MovieServie movieServie;

    /**根据id获取预告片信息，包括评论，我（zjf）的主要是评论********/

    private Integer id;

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTrailer(){

        Trailer trailer=trailerService.getMovieTrailer(id);
        ActionContext.getContext().put("OneTrailer",trailer);
        return "success";
    }
    /************根据id获取预告片及评论end**************/


    /*************后台得到所有预告片start**************/
    public String getAllTrailers() throws IOException {


        //获取数据库中所有的数据
        List<Trailer> trailers=new ArrayList<>();
        try{
            trailers=trailerService.getAllTrailer();
        }catch (Exception e){

        }
        if(trailers!=null){
            System.out.println("成功取得"+trailers.size()+"条数据...");
        }else{
            System.out.println("查询失败...");
        }
        JSONArray arr=new JSONArray();
        //判定最大的读取个数
        //读取数据
        for(Trailer trailer:trailers){
            JSONObject ob=new JSONObject();
            //将单独的数据装进json数据
            ob.put("id",trailer.getId());
            ob.put("trailername",trailer.getName());
            ob.put("time",trailer.getTime());
            ob.put("moviename",movieServie.getMovieNameById(trailer.getMovieId()));

            //装进数组
            arr.add(ob);
        }
        JSONObject ob=new JSONObject();
        //放置数据
        ob.put("rows", arr);
        //放置所有的数据个数
        ob.put("total", trailers.size());
        String returndata=ob.toString();
        System.out.println("成功转换"+returndata.length()+"大小的数据...");
        System.out.println(arr);
        System.out.println(returndata);
        //转换编码
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        PrintWriter out;
        try {
            out=ServletActionContext.getResponse().getWriter();
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
        String flag ="";
        try{
            if(trailerService.deleteTrailer(id)){
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
    /*********删除预告片end***********/


    /************得到所有电影名******************/
    public void getAllMovieName(){

    }
    /*************得到所有电影名end**************/
}
