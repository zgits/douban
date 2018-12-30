package com.ssh.action;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.PageBean;
import com.ssh.model.Trailer;
import com.ssh.model.Trailer_Comment;
import com.ssh.service.Trailer_CommentService;
import com.ssh.util.ConfirmToken;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by 幻夜~星辰 on 2018/12/4.
 *
 * 对预告片评论的action
 */
@Controller("TrailerComment")
public class TrailerCommentAction extends ActionSupport{

    @Resource
    private Trailer_CommentService trailer_commentService;

    //token
    private String token;

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    //根据trailerId得到评论
    private Integer trailerId;

    private Integer currPage=1;

    public Integer getTrailerId() {
        return trailerId;
    }

    public void setTrailerId(Integer trailerId) {
        this.trailerId = trailerId;
    }

    public void setCurrPage(Integer currPage) {
        this.currPage = currPage;
    }

    public Integer getCurrPage() {
        return currPage;
    }

    /********异步刷新评论数据************/
    public String getComments(){
        PageBean<Trailer_Comment> pageBean;
        String jsonPageBean;
        try{
            pageBean=trailer_commentService.findComment(trailerId,currPage);

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
    Integer commentId;

    public Integer getCommentId() {
        return commentId;
    }

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public void delete() throws IOException {

        String flag ="";
        try{
            trailer_commentService.deleteComment(commentId);
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
    private Trailer_Comment trailer_comment;

    public Trailer_Comment getTrailer_comment() {
        return trailer_comment;
    }

    public void setTrailer_comment(Trailer_Comment trailer_comment) {
        this.trailer_comment = trailer_comment;
    }

    public void insertComment() throws IOException {

        String flag ="";
        try{
            if(ConfirmToken.confirmtoken(token)){
                if(trailer_commentService.insertComment(trailer_comment)){
                    flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式
                }else{
                    flag = JSON.toJSONString(2);
                }
            }else{
                flag = JSON.toJSONString(3);//使用fastjson将数据转换成json格式,3代表未登录

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

    /**********插入评论end**********/


}
