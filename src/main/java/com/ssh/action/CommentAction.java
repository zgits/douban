package com.ssh.action;

import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Comment;
import com.ssh.service.CommentService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

/**
 * Created by 幻夜~星辰 on 2018/11/27.
 */
@Controller("CommentAction")
public class CommentAction extends ActionSupport{

    @Resource(name="CommentService")
    private CommentService commentService;

    private Comment comment;

    public Comment getComment() {
        return comment;
    }

    public void setComment(Comment comment) {
        this.comment = comment;
    }

    public String insertComment(){
        commentService.insertComment(comment);
        return "insert";
    }

    private Integer id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String deleteComment(){
        commentService.deleteComment(id);
        return "delete";
    }


}
