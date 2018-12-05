package com.ssh.dao;

import com.ssh.model.User;

import java.util.Date;
import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/11/28.
 *
 * 通过userId获取用户信息
 */
public interface ManagerUserDao {

    /**
     * 通过用户id获取用户信息
     * @param id
     * @return
     */
    public User getUserById(Integer id);

    /**
     * 得到所有的用户
     * @return
     */
    public List<User> getAllUser(int begin,int pagesize);

    /**
     * 根据用户id得到用户名，用来做消息提醒用
     * @param userId
     * @return
     */
    public String getUserName(Integer userId);

    /**
     * 统计数量，用于分页
     * @return
     */
    public int getUserCount();

    /**
     * 通过用户的id删除用户
     * @param id
     * @return
     */
    public boolean deleteUser(Integer id);


    /**
     * 禁言信息
     * @param user
     * @return
     */
    public boolean insertForbiddenWords(User user);

    /**
     * 删除禁言信息,即解禁
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
     * 通过模糊查询用户名得到用户信息
     * @param username
     * @return
     */
    public List<User> selectUserByName(String username,int begin,int pagesize);

    /**
     * 根据输入的用户名，得到指定用户名的数量,用于分页查询
     * @param username
     * @return
     */
    public Integer getUserCountByName(String username);
}
