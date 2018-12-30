package com.ssh.service.impl;

import com.ssh.BaseTest;
import com.ssh.service.Movie_CommentService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by 幻夜~星辰 on 2018/12/30.
 */
public class MovieCommentServiceImplTest extends BaseTest{

    @Autowired
    private Movie_CommentService movie_commentService;
    @Test
    public void alreadyRated() throws Exception {
        System.out.println(movie_commentService.alreadyRated(1,1));
    }

}