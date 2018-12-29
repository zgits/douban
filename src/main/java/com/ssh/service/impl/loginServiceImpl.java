package com.ssh.service.impl;

import com.ssh.dao.loginDao;
import com.ssh.model.User;
import com.ssh.service.loginService;
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
    public int login(String username, String password) {
        return logindao.login(username,password);
    }

    @Override
    public boolean checkUsername(String username) {
        return logindao.checkUsername(username);
    }

    @Override
    public boolean checkPhone(String phone) {
        return logindao.checkPhone(phone);
    }

    @Override
    public boolean register(String phone, String username, String password) {
        return logindao.register(phone,username,password);
    }


//    @Override
//    public int register(String email, String password, String userName) {
//        return 0;
//    }


//    @Override
//    public User login(String email, String password) {
//        return logindao.login(email,password);
//    }
//
//    @Override
//    public int register(String email, String password, String userName) {
//        int flag = logindao.findByEmail(email);
//        if (flag == -1) {
//            flag = logindao.register(email,password,userName);
//        }
//        return flag;
//    }
}
