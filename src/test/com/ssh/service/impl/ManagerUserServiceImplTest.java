package com.ssh.service.impl;

import com.ssh.BaseTest;
import com.ssh.service.ManagerUserService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

import static org.junit.Assert.*;

/**
 * Created by 幻夜~星辰 on 2018/11/29.
 */
public class ManagerUserServiceImplTest extends BaseTest{
    @Test
    public void selectEndTime() throws Exception {
        System.out.println(managerUserService.getUser(1));
    }


    @Autowired
    private ManagerUserService managerUserService;


    @Test
    public void insertForbiddenWords() throws Exception {
        managerUserService.insertForbiddenWords(3,20,"违反了xxxx");
    }

    @Test
    public void deleteUser() throws Exception {
    }

    @Test
    public void getUsers() throws Exception {

        System.out.println(managerUserService.getUserByIdToPersonInfo(1));
    }

    @Test
    public void compareDate() throws Exception{

        System.out.println(new Date().after(managerUserService.selectEndTime(1)));
    }

}