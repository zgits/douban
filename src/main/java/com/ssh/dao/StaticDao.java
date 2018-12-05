package com.ssh.dao;

import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/4.
 * 用于获取地区和语言
 */
public interface StaticDao {

    /**
     * 得到全部的地区
     * @return
     */
    public List<String> getAllCountry();


    /**
     * 得到全部语言
     * @return
     */
    public List<String> getAllLanguage();

}
