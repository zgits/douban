package com.ssh.dao.impl;

import com.ssh.BaseTest;
import com.ssh.dao.CommentDao;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by 幻夜~星辰 on 2018/11/27.
 */
public class CommentDaoImplTest extends BaseTest{

    @Autowired
    private CommentDao commentDao;

    @Test
    public void insertComment() throws Exception {
    }

    @Test
    public void findComment() throws Exception {
    }

    @Test
    public void deleteComment() throws Exception {

        commentDao.deleteComment(1);

    }

}