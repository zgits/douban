package com.ssh.action;

import com.ssh.service.UserStatusService;
import com.ssh.service.impl.UserStatusServiceImpl;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by 幻夜~星辰 on 2018/11/26.
 */
public class UserStatusActionTest extends BaseTest{


    @Autowired
    private UserStatusService userStatusService;
    @Test
    public void insertForbiddenWords() throws Exception {
        userStatusService.insertForbiddenWords(1,10);

    }

}