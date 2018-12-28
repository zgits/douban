package com.ssh.action;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Movie_Comment;
import com.ssh.model.PageBean;
import com.ssh.service.Movie_CommentService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by 幻夜~星辰 on 2018/12/5.
 */
@Controller("MovieComment")
public class MovieCommentAction extends ActionSupport{

    @Autowired
    private Movie_CommentService movie_commentService;

    //根据movieId得到评论
    private Integer movieId;

    private Integer currPage=1;

    public Integer getMovieId() {
        return movieId;
    }

    public void setMovieId(Integer movieId) {
        this.movieId = movieId;
    }

    public Integer getCurrPage() {
        return currPage;
    }

    public void setCurrPage(Integer currPage) {
        this.currPage = currPage;
    }

    /********异步刷新评论数据************/
    public String getComments(){

        PageBean<Movie_Comment> pageBean;
        String jsonPageBean;
        try{
            pageBean=movie_commentService.findComment(movieId,currPage);

            jsonPageBean= JSON.toJSONString(pageBean);
            if(pageBean!=null){
                System.out.println("成功取得第"+currPage+"页的数据,数据为：\r\n"+pageBean);
            }else{
                System.out.println("查询失败...");
            }

            ServletActionContext.getResponse().setCharacterEncoding("UTF-8");

            PrintWriter writer = ServletActionContext.getResponse().getWriter();

            System.out.println(jsonPageBean);

            writer.write(jsonPageBean);

            System.out.println("成功");

            writer.flush();

            writer.close();

        }catch (Exception e){

        }
        return SUCCESS;
    }

    /**********异步刷新评论数据end**********/

    /**********删除评论**********/
    private Integer id;

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void delete() throws IOException {


        String flag ="";
        try{
            movie_commentService.deleteComment(id);
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
    /**********删除评论end**********/

    /*********插入评论***********/
    private Movie_Comment movie_comment;

    public Movie_Comment getMovie_comment() {
        return movie_comment;
    }

    public void setMovie_comment(Movie_Comment movie_comment) {
        this.movie_comment = movie_comment;
    }

    public void insertComment() throws IOException {

        String flag ="";
        try{
            movie_commentService.insertComment(movie_comment);
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

    /**********插入评论end**********/
    /*******刷新问题没解决*********/

}
