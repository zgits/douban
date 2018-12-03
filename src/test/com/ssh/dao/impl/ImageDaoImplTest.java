package com.ssh.dao.impl;

import com.ssh.BaseTest;
import com.ssh.dao.ImageDao;
import com.ssh.model.Image;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by 幻夜~星辰 on 2018/12/3.
 */
public class ImageDaoImplTest extends BaseTest{

    @Autowired
    private ImageDao imageDao;


    @Test
    public void insertImage() throws Exception {

        List<Image> images=new ArrayList<>();
        for(int i=0;i<3;i++){
            Image image=new Image();
            image.setMovieId(1);
            image.setPath("test"+i);
            images.add(image);
        }
        System.out.print(imageDao.insertImage(images));

    }

    @Test
    public void deleteImage() throws Exception {
    }

    @Test
    public void updateImage() throws Exception {
    }

    @Test
    public void getMovieImage() throws Exception {
    }

}