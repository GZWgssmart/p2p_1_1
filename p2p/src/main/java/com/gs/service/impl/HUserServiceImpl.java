package com.gs.service.impl;

import com.gs.bean.HUser;
import com.gs.common.Pager;
import com.gs.dao.HUserDAO;
import com.gs.service.HUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21
 */
@Service
public class HUserServiceImpl implements HUserService {

    @Autowired
    private HUserDAO hUserDAO;

    @Override
    public HUser getByPhonePwd(String phone, String pwd) {
        return hUserDAO.getByPhonePwd(phone, pwd);
    }

    @Override
    public void save(Object obj) {

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
        return null;
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

}
