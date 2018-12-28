package com.ssh.service.impl;

import com.ssh.BaseTest;
import com.ssh.service.Message_Service;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

public class Message_ServiceImplTest extends BaseTest {
    @Autowired
    private Message_Service message_service;

    @Test
    public void getMessage() {
        System.out.println(message_service.getMessage(1));
    }

    @Test
    public void findMessage(){
        System.out.println(message_service.findMessage(1,1,1));
    }
}