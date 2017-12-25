package com.gs.service.impl;

import com.gs.dao.BaseDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.JklxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/12/21
 */
@Service
public class JklxServiceImpl extends AbstractBaseService implements JklxService {
    private JklxService jklxService;

    @Autowired
    public void setSwayService(JklxService jklxService) {
        super.setBaseDAO((BaseDAO) jklxService);
        this.jklxService = jklxService;
    }
}
