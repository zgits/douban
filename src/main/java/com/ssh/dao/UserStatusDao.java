package com.ssh.dao;

import com.ssh.model.UserStatus;

/**
 * Created by 幻夜~星辰 on 2018/11/26.
 */
public interface UserStatusDao {

    /**
     * 数据库插入禁言信息
     * @param userStatus
     * @return
     */
    public int insertForbiddenWords(UserStatus userStatus);
}
