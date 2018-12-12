package com.ssh.service.impl;

import com.ssh.BaseTest;
import com.ssh.model.Movie_Replycomment;
import com.ssh.service.Movie_ReplyCommentService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by 幻夜~星辰 on 2018/12/12.
 */
public class MovieReplyCommentServieImplTest extends BaseTest {

    @Autowired
    private Movie_ReplyCommentService movie_replyCommentService;

    @Test
    public void insertReplyComment() throws Exception {

        Movie_Replycomment movie_replycomment=new Movie_Replycomment();
        movie_replycomment.setTo_userId(1);
        movie_replycomment.setUserId(2);
        movie_replycomment.setContent("sdfsdfsdf");
        movie_replycomment.setReply_type(1);
        movie_replycomment.setComment_id(1);
        movie_replyCommentService.insertReplyComment(movie_replycomment);
    }

    @Test
    public void selectReplyComment() throws Exception {
    }

    @Test
    public void deleteReplyComment() throws Exception {
    }

}