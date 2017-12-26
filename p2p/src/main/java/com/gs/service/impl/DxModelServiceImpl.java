package com.gs.service.impl;

import com.gs.dao.BaseDAO;
import com.gs.dao.DxModelDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.DxModelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/12/21
 */
@Service
public class DxModelServiceImpl extends AbstractBaseService implements DxModelService {
    private DxModelDAO dxModelDAO;

    @Autowired
    public void setDxModelDAO(DxModelDAO dxModelDAO) {
        super.setBaseDAO(dxModelDAO);
        this.dxModelDAO = dxModelDAO;
    }
}
