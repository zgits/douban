package com.ssh.action;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Movie_Replycomment;
import com.ssh.service.Movie_ReplyCommentService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by 幻夜~星辰 on 2018/12/5.
 */
@Controller("MovieReplyComment")
public class MovieReplyCommentAction extends ActionSupport{

    @Autowired
    private Movie_ReplyCommentService movie_replyCommentService;

    /****增加回复***/
    private Movie_Replycomment movie_replycomment;

    public Movie_Replycomment getMovie_replycomment() {
        return movie_replycomment;
    }

    public void setMovie_replycomment(Movie_Replycomment movie_replycomment) {
        this.movie_replycomment = movie_replycomment;
    }

    public void insertReplyComment() throws IOException {

        System.out.println(movie_replycomment.getComment_id()+movie_replycomment.getContent());
        String flag ="";
        try{
            movie_replyCommentService.insertReplyComment(movie_replycomment);

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
    /***增加回复end***/

    /*******删除回复*******/
    private Integer id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void deleteReplyComment() throws IOException {

        String flag ="";
        try{
            movie_replyCommentService.deleteReplyComment(id);
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
    /*******删除回复end*******/
}
