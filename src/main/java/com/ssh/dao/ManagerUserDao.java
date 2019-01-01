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
     * 2018-12-18,取消了后台的分页
     * int begin,int pagesize，原参数
     * @return
     */
    public List<User> getAllUser();

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


    /**
     * 根据id批量删除用户
     * @param ids
     * @return
     */
    public boolean deleteUsers(Integer[] ids);


    /**
     * 根据id得到用户的信息
     * @param id
     * @return
     */
    public User getUserByIdToPerson(Integer id);


    /**
     * 更新用户信息
     * @param user
     * @return
     */
    public boolean updateUser(User user);

    /**
     * 修改密码
     * @param id
     * @param password
     * @return
     */
    public boolean updatePassword(Integer id,String password);

    /**
     * 根据id查询电话号码
     * @param id
     * @return
     */
    public String getPhoneById(Integer id);
}
