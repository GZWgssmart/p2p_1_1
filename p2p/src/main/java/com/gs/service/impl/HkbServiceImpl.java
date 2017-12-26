package com.gs.service.impl;

import com.gs.common.Pager;
import com.gs.dao.HkbDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.HkbService;
import com.gs.service.TzbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 创建类名：TzbServiceImpl
 * 创建时间：2017/12/21 16:15
 *
 * @author 温宁宁
 * @version 1.0
 */
@Service
public class HkbServiceImpl extends AbstractBaseService implements HkbService {

    private HkbDAO hkbDAO;

    @Autowired
    public void setHkbDAO(HkbDAO hkbDAO) {
        super.setBaseDAO(hkbDAO);
        this.hkbDAO = hkbDAO;
    }
}
