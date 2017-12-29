package com.gs.service.impl;

import com.gs.dao.BaseDAO;
import com.gs.dao.JklxDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.JklxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/12/21
 */
@Service
public class JklxServiceImpl extends AbstractBaseService implements JklxService {
    private JklxDAO jklxDAO;

    @Autowired
    public void setJklxDAO(JklxDAO jklxDAO) {
        super.setBaseDAO(jklxDAO);
        this.jklxDAO = jklxDAO;
    }
}
