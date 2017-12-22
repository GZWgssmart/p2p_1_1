package com.gs.service.impl;

import com.gs.common.Pager;
import com.gs.dao.TzbDAO;
import com.gs.service.AbstractBaseService;
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
public class TzbServiceImpl extends AbstractBaseService implements TzbService {

    private TzbDAO tzbDAO;

    @Autowired
    public void setTzbDAO(TzbDAO tzbDAO) {
        super.setBaseDAO(tzbDAO);
        this.tzbDAO = tzbDAO;
    }
}
