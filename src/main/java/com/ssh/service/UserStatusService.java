package com.ssh.service;

import com.ssh.model.UserStatus;
import org.springframework.stereotype.Service;

/**
 * Created by 幻夜~星辰 on 2018/11/26.
 */

/**
 * 定义业务逻辑处理接口
 */
public interface UserStatusService {

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
