package com.ssh.service.impl;

import com.ssh.BaseTest;
import com.ssh.model.Movie_Comment;
import com.ssh.service.CommentService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 */
public class MovieCommentServiceImplTest extends BaseTest{

    @Autowired
    private CommentService commentService;
    @Test
    public void insertComment() throws Exception {

        Movie_Comment movieComment =new Movie_Comment();
        movieComment.setContent("测试评论的内容");
        movieComment.setMovieId(1);//要评论的电影的id
        movieComment.setUserId(1);//评论人的id
        commentService.insertComment(movieComment);
    }

    @Test
    public void findComment() throws Exception {
    }

    @Test
    public void deleteComment() throws Exception {
    }

}