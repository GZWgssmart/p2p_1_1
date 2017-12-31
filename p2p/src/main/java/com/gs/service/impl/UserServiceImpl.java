package com.gs.service.impl;

import com.gs.bean.User;
import com.gs.common.Pager;
import com.gs.dao.UserDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21
 */
@Service
public class UserServiceImpl extends AbstractBaseService implements UserService {


    private UserDAO userDAO;

    @Autowired
    public void setUserDAO(UserDAO userDAO) {
        super.setBaseDAO(userDAO);
        this.userDAO = userDAO;
    }

    @Override
    public User getByPhonePwd(String phone, String upwd) {
        return userDAO.getByPhonePwd(phone, upwd);
    }

    @Override
    public int getByPhone(String phone) {
        return userDAO.getByPhone(phone);
    }

    @Override
    public String getByIdPassword(Long id) {
        return userDAO.getByIdPassword(id);
    }


}