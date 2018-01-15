package com.gs.service.impl;

import com.gs.common.Pager;
import com.gs.dao.UserTicketDAO;
import com.gs.service.UserTicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/27.
 */

@Service

public class UserTicketServiceImpl implements UserTicketService {

    @Autowired
    private UserTicketDAO userTicketDAO;

    @Override
    public void save(Object obj) {
        userTicketDAO.save(obj);
    }

    @Override
    public void remove(Object obj) {
        userTicketDAO.remove(obj);;
    }

    @Override
    public void removeById(Long id) {
        userTicketDAO.removeById(id);
    }

    @Override
    public void update(Object obj) {
        userTicketDAO.update(obj);
    }

    @Override
    public Object getById(Long id) {
        return userTicketDAO.getById(id);
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
        Pager pager = new Pager(pageNo,pageSize);
        pager.setRows(userTicketDAO.listPagerCriteria(pager,obj));
        pager.setTotal(userTicketDAO.countCriteria(obj));
        return pager;
    }
}
