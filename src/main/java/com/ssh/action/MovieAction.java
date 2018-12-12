package com.ssh.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Movie;
import com.ssh.model.PageBean;
import com.ssh.service.MovieServie;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.*;

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

    public MovieServie getMovieServie() {
        return movieServie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    /********通过id获取电影信息,用于单击超链接时用*************/
    public String getMovie(){
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
    public void addMovie(){
        movieServie.insertMovie(movie);
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
    public String getAllMovies(){
        PageBean<Movie> moviePageBean=movieServie.seleceMovie(currPage);
        return "getAllMovies";
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
