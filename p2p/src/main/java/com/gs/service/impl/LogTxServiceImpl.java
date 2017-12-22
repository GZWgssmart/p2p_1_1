package com.gs.service.impl;

import com.gs.bean.LogTx;
import com.gs.common.Pager;
import com.gs.dao.LogTxDAO;
import com.gs.service.BaseService;
import com.gs.service.LogTxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21.
 */
@Service
public class LogTxServiceImpl implements LogTxService {

    @Autowired
    private LogTxDAO logTxDAO;
    @Override
    public void save(Object obj) {
        logTxDAO.save(obj);
    }

    @Override
    public void remove(Object obj) {

    }

    @Override
    public void removeById(Long id) {

    }

    @Override
    public void update(Object obj) {

    }

    @Override
    public Object getById(Long id) {
        return logTxDAO.getById(id);
    }

    @Override
    public List<Object> listAll() {
        return null;
    }

    @Override
    public Pager listPager(int pageNo, int pageSize) {

        return null;
    }

    @Override
    public Pager listPagerCriteria(int pageNo, int pageSize, Object obj) {
        return null;
    }


    @Override
    public Pager listByPager(int pageNo, int pageSize, Long uid) {
        Pager pager = new Pager(pageNo,pageSize);
        pager.setRows(logTxDAO.listByPager(pager,uid));
        return pager;
    }
}
