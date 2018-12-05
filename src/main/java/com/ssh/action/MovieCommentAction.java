package com.ssh.action;

import com.opensymphony.xwork2.ActionSupport;
import com.ssh.model.Movie_Comment;
import com.ssh.service.Movie_CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

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

    public void setCurrPage(Integer currPage) {
        this.currPage = currPage;
    }

    /********异步刷新评论数据************/
    public void getComments(){
        movie_commentService.findComment(movieId,currPage);
    }

    /**********异步刷新评论数据end**********/

    /**********删除评论**********/
    private Integer id;

    public void setId(Integer id) {
        this.id = id;
    }

    public void delete(){
       movie_commentService.deleteComment(id);
    }
    /**********删除评论end**********/

    /*********插入评论***********/
    private Movie_Comment movie_comment;

    public void setMovie_comment(Movie_Comment movie_comment) {
        this.movie_comment = movie_comment;
    }

    public void insertComment(){
        movie_commentService.insertComment(movie_comment);

    }

    /**********插入评论end**********/
    /*******刷新问题没解决*********/

}
