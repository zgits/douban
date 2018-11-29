package com.ssh.service.impl;

import com.ssh.BaseTest;
import com.ssh.model.Movie_Replycomment;
import com.ssh.service.ReplyCommentService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 */
public class ReplyMovieCommentServieImplTest extends BaseTest{

    @Autowired
    private ReplyCommentService replyCommentService;

    @Test
    public void insertReplyComment() throws Exception {
        Movie_Replycomment movieReplycomment =new Movie_Replycomment();
        movieReplycomment.setContent("testdstds");//回复的内容
        movieReplycomment.setUserId(2);//回复人的id
        movieReplycomment.setComment_id(1);//目标评论的id
        movieReplycomment.setReply_type(1);
        movieReplycomment.setTo_userId(1);
        replyCommentService.insertReplyComment(movieReplycomment);

    }

    @Test
    public void selectReplyComment() throws Exception {
    }

    @Test
    public void deleteReplyComment() throws Exception {
    }

}