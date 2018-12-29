package com.ssh.dao;

import com.ssh.model.User;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 */

public interface loginDao {

//    public User login(String email, String password);
//
//    /**
//     * 查看邮箱是否已被注册
//     * @param email
//     * @return
//     */
//    int findByEmail(String email);
//
//    /**
//     * 注册用户信息
//     * @param email
//     * @param password
//     * @param userName
//     * @return
//     */
//    int register(String email, String password, String userName);


    /**
     * 登录验证
     * @param username
     * @param password
     * @return
     */
     public Integer login(String username,String password);


    /**
     * 查询用户名是否存在
     * @param username
     * @return
     */
    public boolean checkUsername(String username);


    /**
     * 查询电话号码是否存在
     * @param phone
     * @return
     */
    public boolean checkPhone(String phone);


    /**
     * 注册功能
     * @param phone
     * @param username
     * @param password
     * @return
     */
    public boolean register(String phone,String username,String password);
}
