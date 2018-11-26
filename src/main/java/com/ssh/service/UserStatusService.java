package com.ssh.service;

import com.ssh.model.UserStatus;

/**
 * Created by 幻夜~星辰 on 2018/11/26.
 */
public interface UserStatusService {

    /**
     * 管理员禁言功能的接口,参数，从前端得到的数据
     * @param userId,days
     * @return boolean
     */
    public boolean insertForbiddenWords(int userId,int days);
}
