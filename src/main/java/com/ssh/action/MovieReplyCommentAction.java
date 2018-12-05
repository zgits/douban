package com.ssh.action;

import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Movie_Replycomment;
import com.ssh.service.Movie_ReplyCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by 幻夜~星辰 on 2018/12/5.
 */
@Controller("MovieReplyComment")
public class MovieReplyCommentAction extends ActionSupport{

    @Autowired
    private Movie_ReplyCommentService movie_replyCommentService;

    /****增加回复***/
    private Movie_Replycomment movie_replycomment;

    public void setMovie_replycomment(Movie_Replycomment movie_replycomment) {
        this.movie_replycomment = movie_replycomment;
    }

    public void insertReplyComment(){
        movie_replyCommentService.insertReplyComment(movie_replycomment);
    }
    /***增加回复end***/

    /*******删除回复*******/
    private Integer id;

    public void setId(Integer id) {
        this.id = id;
    }

    public void deleteReplyComment(){
        movie_replyCommentService.deleteReplyComment(id);

    }
    /*******删除回复end*******/
}
