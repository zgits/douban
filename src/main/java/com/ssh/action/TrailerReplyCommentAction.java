package com.ssh.action;

import com.alibaba.fastjson.JSON;
import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Trailer_Replycomment;
import com.ssh.service.Trailer_ReplyCommentService;
import com.ssh.util.ConfirmToken;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by 幻夜~星辰 on 2018/12/5.
 */
@Controller("TrailerReplyComment")
public class TrailerReplyCommentAction extends ActionSupport{


    @Autowired
    private Trailer_ReplyCommentService trailer_replyCommentService;

    private String token;

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    /****增加回复***/
    private Trailer_Replycomment trailer_replycomment;

    public void setTrailer_replycomment(Trailer_Replycomment trailer_replycomment) {
        this.trailer_replycomment = trailer_replycomment;
    }

    public Trailer_Replycomment getTrailer_replycomment() {
        return trailer_replycomment;
    }

    public void insertReplyComment() throws IOException {

        String flag ="";
        try{
            System.out.println(token);
            if(ConfirmToken.confirmtoken(token)){
                trailer_replyCommentService.insertReplyComment(trailer_replycomment);
                flag = JSON.toJSONString(1);//使用fastjson将数据转换成json格式
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
    /***增加回复end***/

    /*******删除回复*******/
    private Integer id;

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void deleteReplyComment() throws IOException {
        String flag ="";
        try{
            trailer_replyCommentService.deleteReplyComment(id);
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
