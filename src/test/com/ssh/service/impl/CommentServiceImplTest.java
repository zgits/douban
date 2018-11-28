package com.ssh.service.impl;

import com.ssh.BaseTest;
import com.ssh.model.Comment;
import com.ssh.service.CommentService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 */
public class CommentServiceImplTest extends BaseTest{

    @Autowired
    private CommentService commentService;
    @Test
    public void insertComment() throws Exception {

        Comment comment=new Comment();
        comment.setContent("测试评论的内容");
        comment.setMovieId(1);//要评论的电影的id
        comment.setUserId(1);//评论人的id
        commentService.insertComment(comment);
    }

    @Test
    public void findComment() throws Exception {
    }

    @Test
    public void deleteComment() throws Exception {
    }

}