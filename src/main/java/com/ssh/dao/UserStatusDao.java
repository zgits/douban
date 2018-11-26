package com.ssh.dao;

import com.ssh.model.UserStatus;
import org.springframework.stereotype.Service;

/**
 * Created by 幻夜~星辰 on 2018/11/26.
 */

/**
 * 首先定义数据库的实现接口
 */
public interface UserStatusDao {

    /**
     * 数据库插入禁言信息
     * @param userStatus
     * @return
     */
    public int insertForbiddenWords(UserStatus userStatus);
}
