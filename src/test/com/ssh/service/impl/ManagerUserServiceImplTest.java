package com.ssh.service.impl;

import com.ssh.BaseTest;
import com.ssh.service.ManagerUserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by 幻夜~星辰 on 2018/11/29.
 */
public class ManagerUserServiceImplTest extends BaseTest{
    @Test
    public void selectEndTime() throws Exception {
        System.out.println(managerUserService.selectEndTime(1));
    }


    @Autowired
    private ManagerUserService managerUserService;


    @Test
    public void insertForbiddenWords() throws Exception {
        managerUserService.insertForbiddenWords(1,40);
    }

    @Test
    public void deleteUser() throws Exception {
    }

    @Test
    public void getUsers() throws Exception {

        managerUserService.getUsers(1);
    }

}