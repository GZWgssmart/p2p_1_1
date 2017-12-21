package com.gs.service.impl;

import com.gs.common.Pager;
import com.gs.dao.UserMoneyDAO;
import com.gs.service.UserMoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 创建类名：UserMoneyServiceImpl
 * 创建时间：2017/12/21 11:20
 *
 * @author 温宁宁
 * @version 1.0
 */
@Service
public class UserMoneyServiceImpl implements UserMoneyService{
    @Autowired
    private UserMoneyDAO userMoneyDAO;
    @Override
    public void save(Object obj) {
        userMoneyDAO.save(obj);
    }

    @Override
    public void remove(Object obj) {
        userMoneyDAO.remove(obj);
    }

    @Override
    public void removeById(Long id) {
        userMoneyDAO.removeById(id);
    }

    @Override
    public void update(Object obj) {
        userMoneyDAO.update(obj);
    }

    @Override
    public Object getById(Long id) {
        return userMoneyDAO.getById(id);
    }

    @Override
    public List<Object> listAll() {
        return userMoneyDAO.listAll();
    }

    @Override
    public Pager listPager(int pageNo, int pageSize) {
        return null;
    }

    @Override
    public Pager listPagerCriteria(int pageNo, int pageSize, Object obj) {
        Pager pager = new Pager(pageNo, pageSize);
        pager.setRows(userMoneyDAO.listPagerCriteria(pager, obj));
        pager.setTotal(userMoneyDAO.countCriteria(obj));
        return pager;
    }

    @Override
    public Object getByUserId(Long id) {
        return userMoneyDAO.getByUserId(id);
    }
}
