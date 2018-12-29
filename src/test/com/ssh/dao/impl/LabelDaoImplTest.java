package com.ssh.dao.impl;

import com.ssh.BaseTest;
import com.ssh.dao.LabelDao;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by 幻夜~星辰 on 2018/12/25.
 */
public class LabelDaoImplTest extends BaseTest{

    @Autowired
    private LabelDao labelDao;
    @Test
    public void getAllLabels() throws Exception {
        System.out.println(labelDao.getLabelName());
    }


}