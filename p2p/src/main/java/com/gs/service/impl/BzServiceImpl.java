package com.gs.service.impl;

import com.gs.dao.BaseDAO;
import com.gs.dao.BzDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.BzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/12/21
 */
@Service
public class BzServiceImpl extends AbstractBaseService implements BzService {
    private BzDAO bzDAO;

    @Autowired
    public void setBzDAO(BzDAO bzDAO) {
        super.setBaseDAO(bzDAO);
        this.bzDAO = bzDAO;
    }
}
