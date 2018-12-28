package com.ssh.util;

import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Created by 幻夜~星辰 on 2018/12/28.
 */
public class JWTTest {

    @Test
    public void sign() throws Exception {

        JWT jwt=new JWT();
        System.out.println(JWT.sign("788",8700000));
    }

    @Test
    public void unsign() throws Exception {

        System.out.println(JWT.unsign("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NDYwMTI1ODE5MzksInBheWxvYWQiOiJcIndlcndlclwiIn0.Y7L5X-kyjon_VESB6tdixv3tX4F_nN1ILSHYgEqjLPc",String.class));
    }

}