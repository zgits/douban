package com.ssh.dao;

import com.ssh.model.UserStatus;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


/**
 * Created by 幻夜~星辰 on 2018/11/26.
 */

/**
 * 首先定义数据库的实现接口
 *
 */

public interface UserStatusDao {


    /**
     * 数据库插入禁言信息
     * @param userStatus
     * @return
     */
    public int insertForbiddenWords(UserStatus userStatus);

    /**
     * 数据库删除禁言信息,即解禁
     * @param id
     * @return
     */
    public boolean deleteForbidden(Integer id);

    /**
     * 根据userId查询用户信息
     * @param userId
     * @return
     */
    public UserStatus selectUserStatus(Integer userId);
}
