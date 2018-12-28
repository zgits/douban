package com.ssh.util;

import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Created by 幻夜~星辰 on 2018/12/20.
 */
public class JavaWebTokenTest {
    @Test
    public void createJWT() throws Exception {
        JavaWebToken javaWebToken=new JavaWebToken();
        System.out.println(javaWebToken.createJWT("1","ss",12222));
    }

    @Test
    public void parseJWT() throws Exception {
        JavaWebToken javaWebToken=new JavaWebToken();

        System.out.println(javaWebToken.parseJWT(javaWebToken.createJWT("1","ss",12222)));
    }

}