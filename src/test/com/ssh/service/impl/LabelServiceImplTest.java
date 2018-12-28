package com.ssh.service.impl;

import com.ssh.BaseTest;
import com.ssh.service.LabelService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

public class LabelServiceImplTest extends BaseTest {
    @Autowired
    private LabelService labelService;

    @Test
    public void getAllLabels() {
        System.out.println(labelService.getAllLabels());
    }

    @Test
    public void getLabelById() {
    }
}