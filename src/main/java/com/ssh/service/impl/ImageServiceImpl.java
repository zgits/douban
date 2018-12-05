package com.ssh.service.impl;

import com.ssh.dao.ImageDao;
import com.ssh.model.Image;
import com.ssh.service.ImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by 幻夜~星辰 on 2018/12/4.
 */
@Transactional
@Service("ImageServie")
public class ImageServiceImpl implements ImageService{

    @Autowired
    private ImageDao imageDao;

    @Override
    public boolean insertImage(List<Image> images) {
        return imageDao.insertImage(images);
    }

    @Override
    public boolean deleteImage(Integer id) {
        return imageDao.deleteImage(id);
    }

    @Override
    public boolean updateImage(Image image) {
        return imageDao.updateImage(image);
    }

    @Override
    public List<Image> getMovieImages(Integer movieId) {
        return imageDao.getMovieImages(movieId);
    }
}
