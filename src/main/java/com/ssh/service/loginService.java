package com.ssh.service;

import com.ssh.model.User;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 */
public interface loginService {

    public User login(String email, String password);

    int register(String email, String password, String userName);
}
