package com.ssh.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Image;
import com.ssh.model.Movie;
import com.ssh.model.PageBean;
import com.ssh.model.Trailer;
import com.ssh.service.MovieServie;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by 幻夜~星辰 on 2018/11/29.
 */
@Controller("MovieAction")
public class MovieAction extends ActionSupport{

    @Autowired
    private MovieServie movieServie;




    private Integer id;

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    private Movie movie;


    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    /********通过id获取电影信息,用于单击超链接时用*************/
    public String getMovieById(){
        try{
            Movie movie=movieServie.selctMovieById(id);
            ActionContext.getContext().put("oneMovie",movie);
            return "moviedetail";
        }catch (Exception e){
            return null;
        }

    }

    /*********end************/

    /*********增加电影信息***********/
    public void addMovie() throws IOException {
        System.out.println(movie);


        String flag ="";
        try{
            movieServie.insertMovie(movie);
            flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式
        }catch (Exception e){
            flag =JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }

        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);

        System.out.println("成功");

        writer.flush();

        writer.close();
    }
    /***********end************/

    /******修改电影信息*******/
    //在修改电影信息时，先获取原来的电影信息，转成特定格式
    public void getMovieToUpdate() throws IOException {

        String movie ="";
        try{
            movie = JSON.toJSONString(movieServie.ToUpdateselctMovieById(id));//使用fastjson将数据转换成json格式

        }catch (Exception e){
            movie =JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }

        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");

        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        System.out.println(movie);

        writer.write(movie);

        System.out.println("成功");

        writer.flush();

        writer.close();
    }

    public void updateMovie() throws IOException {
        String flag ="";
        System.out.println("修改的信息"+movie);
        try{
            if(movieServie.updateMovie(movie)){
                flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式
            }else{
                flag =JSON.toJSONString(2);//使用fastjson将数据转换成json格式
            }
        }catch (Exception e){
            flag =JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }



        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);

        System.out.println("成功");

        writer.flush();

        writer.close();
    }

    /*******end******/


    /********删除电影信息********/


    public void deleteMovie() throws IOException {
        String flag ="";
        try{
            if(movieServie.deleteMovie(id)){
                flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式
            }else{
                flag =JSON.toJSONString(2);//使用fastjson将数据转换成json格式
            }
        }catch (Exception e){
            flag =JSON.toJSONString(2);//使用fastjson将数据转换成json格式
        }



        PrintWriter writer = ServletActionContext.getResponse().getWriter();

        writer.write(flag);

        System.out.println("成功");

        writer.flush();

        writer.close();
    }
    /********end********/

    /*********查询电影信息************/

    private Integer currPage=1;

    public Integer getCurrPage() {
        return currPage;
    }

    public void setCurrPage(Integer currPage) {
        this.currPage = currPage;
    }

    //点击页面时所用，即全部
    public String getAllMovies() throws IOException {

//        String pagebean="";
//        try{
//            PageBean<Movie> moviePageBean=movieServie.seleceMovie(currPage);
//            pagebean = JSON.toJSONString(moviePageBean);//使用fastjson将数据转换成json格式
//        }catch (Exception e){
////            flag =JSON.toJSONString(2);//使用fastjson将数据转换成json格式
//        }


//        System.out.println("------------查看所有的软件信息------------");
        HttpServletRequest request = ServletActionContext.getRequest();
//        HttpSession session = request.getSession();
//        int id=(int) session.getAttribute("id");// 登录厂商
//        //获取一页显示的个数
        //String limit1=request.getParameter("limit");

        //获取数据库中所有的数据
        List<Movie> movies=new ArrayList<>();
        try{
            PageBean<Movie> moviePageBean=movieServie.seleceMovie(currPage);
            movies=moviePageBean.getLists();
        }catch (Exception e){

        }
//      session.setAttribute("allsoft", allsoft);
        if(movies!=null){
            System.out.println("成功取得"+movies.size()+"条数据...");
        }else{
            System.out.println("查询失败...");
        }
//      System.out.println("softInfo"+allsoft);
        JSONArray arr=new JSONArray();
        //判定最大的读取个数
        //读取数据
        for(Movie movie:movies){
            JSONObject ob=new JSONObject();
            //将单独的数据装进json数据
            ob.put("id", movie.getId());
            ob.put("moviename", movie.getMoviename());
            ob.put("release_time", movie.getRelease_time());
            String trailername="";
            for(Trailer trailer:movie.getTrailers()){
                trailername+=trailer.getName()+"<br>";
            }
            System.out.println("预告片名字合集"+trailername);
            String imageName="";
            for(Image image:movie.getImages()){
                imageName+=image.getImageName()+"<br>";
            }
            ob.put("trailer",trailername);
            ob.put("image",imageName);
            //装进数组
            arr.add(ob);
        }
        JSONObject ob=new JSONObject();
        //放置数据
        ob.put("rows", arr);
        //放置所有的数据个数
        ob.put("total", movies.size());
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
    private String movieName;

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    //通过搜索电影名查看电影信息
    public void getMoviesByName(){
        movieServie.selectMovieByName(movieName,currPage);
    }

    /*********end************/


    /************得到所有电影名******************/
    public String getAllMovieName(){

        Map<Integer,String> id_name=new HashMap<>();
        try{
            id_name=movieServie.getAllMovieName();
        }catch (Exception e){

        }
//      session.setAttribute("allsoft", allsoft);
        if(id_name!=null){
            System.out.println("成功取得"+id_name.size()+"条数据...");
        }else{
            System.out.println("查询失败...");
        }
//      System.out.println("softInfo"+allsoft);
        JSONArray arr=new JSONArray();
        //判定最大的读取个数
        //读取数据
        for(Map.Entry<Integer,String> entry:id_name.entrySet()){
            JSONObject ob=new JSONObject();
            //将单独的数据装进json数据
            System.out.println("key值："+entry.getKey()+" value值："+entry.getValue());
            ob.put("id", entry.getKey());
            ob.put("moviename", entry.getValue());
            //装进数组
            arr.add(ob);
        }
        JSONObject ob=new JSONObject();
        //放置数据
        ob.put("data", arr);
        //放置所有的数据个数
        String returndata=ob.toString();
        System.out.println("成功转换"+returndata.length()+"大小的数据...");
        System.out.println(arr);
        System.out.println(returndata);
        //转换编码
        ServletActionContext.getResponse().setCharacterEncoding("UTF-8");
        PrintWriter out;
        try {
            out=ServletActionContext.getResponse().getWriter();
            out.write(returndata);
            out.flush();
            out.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "success";

    }
    /*************得到所有电影名end**************/

    private Integer[] ids;

    public Integer[] getIds() {
        return ids;
    }

    public void setIds(Integer[] ids) {
        this.ids = ids;
    }

    public void deleteMovies() throws IOException {
        String flag ="";
        try{
            if(movieServie.deleteMovies(ids)){
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
