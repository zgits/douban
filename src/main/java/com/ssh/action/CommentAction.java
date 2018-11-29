package com.ssh.action;

import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Movie_Comment;
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

    private Movie_Comment movieComment;

    public Movie_Comment getMovieComment() {
        return movieComment;
    }

    public void setMovieComment(Movie_Comment movieComment) {
        this.movieComment = movieComment;
    }

    public String insertComment(){
        commentService.insertComment(movieComment);
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
