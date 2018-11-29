package com.ssh.service;

import com.ssh.model.PageBean;
import com.ssh.model.User;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 */
public interface ManagerUserService {

    /**
     * 删除用户
     * @param id
     * @return
     */
    public boolean deleteUser(Integer id);


    /**
     * 得到分页的数据
     * @param currPage
     * @return
     */
    public PageBean<User> getUsers(Integer currPage);

    /**
     * 管理员禁言功能的接口,参数，从前端得到的数据
     * @param userId,days
     * @return boolean
     */
    public boolean insertForbiddenWords(int userId,int days);


    /**
     * 解禁的实现
     * @param id
     * @return
     */
    public boolean deleteForbidden(Integer id);


}
