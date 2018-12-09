package com.ssh.dao.impl;

import com.ssh.BaseTest;
import com.ssh.dao.ManagerUserDao;
import com.ssh.model.User;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

import static org.junit.Assert.*;

/**
 * Created by 幻夜~星辰 on 2018/11/29.
 */
public class ManagerUserDaoImplTest extends BaseTest{

    @Autowired
    private ManagerUserDao managerUserDao;
    @Test
    public void deleteForbidden() throws Exception {

        managerUserDao.deleteForbidden(2);
    }



    @Test
    public void getUserById() throws Exception {
        System.out.println(managerUserDao.getUserById(1));
    }

    @Test
    public void insertForbiddenWords() throws Exception {
        User user=new User();
        user.setId(1);
        user.setDays(40);
        user.setStartTime(new Date());
        user.setEndTime(new Date());
        managerUserDao.insertForbiddenWords(user);
    }



}