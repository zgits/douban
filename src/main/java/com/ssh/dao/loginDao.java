package com.ssh.dao;

import com.ssh.model.User;

/**
 * Created by 幻夜~星辰 on 2018/11/19.
 */

public interface loginDao {

    public User login(String email, String password);

    /**
     * 查看邮箱是否已被注册
     * @param email
     * @return
     */
    int findByEmail(String email);

    /**
     * 注册用户信息
     * @param email
     * @param password
     * @param userName
     * @return
     */
    int register(String email, String password, String userName);
}
