package com.gs.service.impl;

import com.gs.bean.Bz;
import com.gs.common.Pager;
import com.gs.dao.BaseDAO;
import com.gs.dao.BzDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.BzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21
 */
@Service
public class BzServiceImpl extends AbstractBaseService implements BzService {
    private  BzDAO bzDAO;

    @Autowired
    public void setBzDAO(BzDAO bzDAO) {
        super.setBaseDAO(bzDAO);
        this.bzDAO = bzDAO;
    }

    @Override
    public void save(Bz bz) {
        bzDAO.save(bz);
    }

    @Override
    public void update(Bz bz) {
        bzDAO.update(bz);
    }

    @Override
    public void updateState(Bz bz) {
        bzDAO.updateState(bz);
    }

    @Override
    public void removeById(Long id) {
        bzDAO.removeById(id);
    }

    @Override
    public Long countCriteria(Object obj) {
        return null;
    }

    @Override
    public List<Object> listPager(Pager pager) {
        return null;
    }
}
