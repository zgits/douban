package com.ssh.dao.impl;

import com.ssh.BaseTest;
import com.ssh.dao.Tips_messageDao;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

public class Tips_messageDapImplTest extends BaseTest {
    @Autowired
     private Tips_messageDao tips_messageDao;
    @Test
    public void insertMessage() {
        System.out.println(tips_messageDao.getCountMessage(1,1));
    }

    @Test
    public void getMessage() {
        System.out.println(tips_messageDao.getMessage(1));
    }

    @Test
    public void deleteMessage() {
        Integer[] ids={1,2};
        System.out.println(tips_messageDao.deleteMessage(ids));
    }
    @Test
  public void findMessage(){
       System.out.println(tips_messageDao.findMessage(1,1,0,5));
    }
//    @Test
//    public void getCountMessage(){
//        System.out.println(tips_messageDao.getCountMessage(1));
//    }
    @Test
    public void updateMessage(){
       Integer [] ids={45,46};
        System.out.println(tips_messageDao.updateStatus(ids));

    }
}