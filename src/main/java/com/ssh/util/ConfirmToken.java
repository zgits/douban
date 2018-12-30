package com.ssh.util;

/**
 * Created by 幻夜~星辰 on 2018/12/28.
 */
public class ConfirmToken {

    public static boolean confirmtoken(String token){
        if(JWT.unsign(token,Integer.class)!=null){
            return true;
        }else{
            return false;
        }
    }
}
