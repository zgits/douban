package com.ssh.action;

import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Trailer;
import com.ssh.model.Trailer_Comment;
import com.ssh.service.Trailer_CommentService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

/**
 * Created by 幻夜~星辰 on 2018/12/4.
 *
 * 对预告片评论的action
 */
@Controller("TrailerComment")
public class TrailerCommentAction extends ActionSupport{

    @Resource
    private Trailer_CommentService trailer_commentService;

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

    /********异步刷新评论数据************/
    public void getComments(){
        trailer_commentService.findComment(trailerId,currPage);
    }

    /**********异步刷新评论数据end**********/

    /**********删除评论**********/
    Integer commentId;

    public void setCommentId(Integer commentId) {
        this.commentId = commentId;
    }

    public void delete(){
        trailer_commentService.deleteComment(commentId);
    }
    /**********删除评论end**********/

    /*********插入评论***********/
    private Trailer_Comment trailer_comment;

    public void setTrailer_comment(Trailer_Comment trailer_comment) {
        this.trailer_comment = trailer_comment;
    }

    public void insertComment(){
        trailer_commentService.insertComment(trailer_comment);

    }

    /**********插入评论end**********/
    /*******刷新问题没解决*********/


}
