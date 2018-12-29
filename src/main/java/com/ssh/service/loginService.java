package com.ssh.service;

import com.ssh.model.User;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 */
public interface loginService {

//    public User login(String email, String password);
//
//    int register(String email, String password, String userName);

    /**
     * 登录
     * @param username
     * @param password
     * @return 用户的id值
     */
    public int login(String username,String password);


    /**
     * 检查用户名是否存在
     * @param username
     * @return
     */
    public boolean checkUsername(String username);


    /**
     * 检查用户名是否存在
     * @param phone
     * @return
     */
    public boolean checkPhone(String phone);
}
