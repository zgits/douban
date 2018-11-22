package com.ssh.service.impl;

import com.ssh.dao.loginDao;
import com.ssh.model.login;
import com.ssh.service.loginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 */
@Service("loginService")
public class loginServiceImpl implements loginService {

    @Resource
    private loginDao logindao;


    @Override
    public login login(int id) {
        return logindao.loginDao(id);
    }
}
