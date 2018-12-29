package com.ssh.dao.impl;

import com.ssh.BaseTest;
import org.junit.Test;
import com.ssh.dao.*;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;

import static org.junit.Assert.*;

/**
 * Created by 幻夜~星辰 on 2018/12/29.
 */
public class loginDaoImplTest extends BaseTest{

    @Resource
    private loginDao loginDao;
    @Test
    public void register() throws Exception {
        loginDao.register("119","test4","123");
    }

}