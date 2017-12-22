package com.gs.service.impl;

import com.gs.bean.BankCard;
import com.gs.common.Pager;
import com.gs.dao.BankCardDAO;
import com.gs.service.BankCardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/20.
 */
@Service
public class BankCardServiceImpl implements BankCardService {
    @Autowired
    private BankCardDAO bankCardDAO;
    @Override
    public void save(Object obj) {
        bankCardDAO.save(obj);
    }

    @Override
    public void remove(Object obj) {

    }

    @Override
    public void removeById(Long id) {
        bankCardDAO.removeById(id);
    }

    @Override
    public void update(Object obj) {

    }

    @Override
    public Object getById(Long id) {
        return bankCardDAO.getById(id);
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
    public List<BankCard> getBylistAll(Long id) {
        return bankCardDAO.getBylistAll(id);
    }
}
