package com.ssh.service.impl;

import com.ssh.BaseTest;
import com.ssh.service.Trailer_CommentService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by 幻夜~星辰 on 2018/11/29.
 */
public class Trailer_CommentServiceImplTest extends BaseTest{

    @Autowired
    private Trailer_CommentService trailer_commentService;


    @Test
    public void insertComment() throws Exception {
    }

    @Test
    public void findComment() throws Exception {
        System.out.println(trailer_commentService.findComment(1,1));
    }

    @Test
    public void deleteComment() throws Exception {
    }

}