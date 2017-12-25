package com.gs.service.impl;

import com.gs.dao.BaseDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.SwayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/12/21
 */
@Service
public class SwayServiceImpl extends AbstractBaseService implements SwayService {
    private SwayService swayService;

    @Autowired
    public void setSwayService(SwayService swayService) {
        super.setBaseDAO((BaseDAO) swayService);
        this.swayService = swayService;
    }
}
