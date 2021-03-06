package com.ssh.service;

import com.ssh.model.PageBean;
import com.ssh.model.User;

import java.util.Date;
import java.util.List;

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
     * @param userId,days,reson
     * @return boolean
     */
    public boolean insertForbiddenWords(int userId,int days,String reason);


    /**
     * 解禁的实现
     * @param id
     * @return
     */
    public boolean deleteForbidden(Integer id);

    /**
     * 获得禁言结束时间
     * @param id
     * @return
     */
    public Date selectEndTime(Integer id);

    /**
     * 通过用户名获取用户信息，主要用于查找用户
     * @param username
     * @param currPage
     * @return
     */
    public PageBean<User> selectUserByName(String username,Integer currPage);

    /**
     * 根据id获取用户名
     * @param id
     * @return
     */
    public String getUsername(Integer id);


    /**
     * 根据id批量删除用户
     * @param ids
     * @return
     */
    public boolean deleteUsers(Integer[] ids);

    /**
     * 根据id获取用户信息
     */
    public User getUser(int id);
    /**
     * 根据id获取用户
     * @param id
     * @return
     */
    public User getUserByIdToPersonInfo(Integer id);


    /**
     * 更新用户
     * @param user
     * @return
     */
    public boolean updateUser(User user);


    /**
     * 更新密码
     * @param id
     * @param password
     * @return
     */
    public boolean updatePassword(Integer id,String password);


    /**
     * 根据id得到电话号码
     * @param id
     * @return
     */
    public String getPhoneById(Integer id);


}
