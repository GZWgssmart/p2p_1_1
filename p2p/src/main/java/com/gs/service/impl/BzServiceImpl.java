package com.gs.service.impl;

import com.gs.dao.BaseDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.BzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/12/21
 */
@Service
public class BzServiceImpl extends AbstractBaseService implements BzService {
    private BzService bzService;

    @Autowired
    public void setSwayService(BzService bzService) {
        super.setBaseDAO((BaseDAO) bzService);
        this.bzService = bzService;
    }
}
