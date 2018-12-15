package com.ssh.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Movie;
import com.ssh.model.PageBean;
import com.ssh.service.MovieServie;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by 幻夜~星辰 on 2018/11/29.
 */
@Controller("MovieAction")
public class MovieAction extends ActionSupport{

    @Autowired
    private MovieServie movieServie;

    /***********文件上传简单版*************/
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
    /*******end*******/


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
    public void getMovieToUpdate(){
        movieServie.selctMovieById(id);
    }

    public void updateMovie(){
        movieServie.updateMovie(movie);
    }

    /*******end******/


    /********删除电影信息********/


    public void deleteMovie(){
        movieServie.deleteMovie(id);
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
        int limit=5;
        //获取已经显示的个数，然后除以一页的个数就是页数
        //String offset1=request.getParameter("offset");
        int offset=1;
        //初始化最大的读取个数
        int max=0;
        System.out.println("已经进来了...");
        System.out.println("页数为"+offset);
        System.out.println("页面大小为"+limit);
        //获取数据库中所有的数据
        //List <SoftInfo>allsoft=this.firmAdminService.firmAdminSoft(id);
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
        if(offset*limit+limit<=movies.size()){
            max=offset*limit+limit;
        }else{
            max=movies.size();
        }
        //读取数据
        for(int i=0;i<max;i++){
            JSONObject ob=new JSONObject();
            //将单独的数据装进json数据
//            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//            long lt = new Long();
//            Date date = new Date(lt);
            ob.put("id", movies.get(i).getId());
            ob.put("moviename", movies.get(i).getMoviename());
            ob.put("release_time", movies.get(i).getRelease_time());
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




}
