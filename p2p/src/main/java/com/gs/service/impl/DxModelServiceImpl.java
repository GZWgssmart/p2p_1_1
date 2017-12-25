package com.gs.service.impl;

import com.gs.dao.BaseDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.DxModelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/12/21
 */
@Service
public class DxModelServiceImpl extends AbstractBaseService implements DxModelService {
    private DxModelService dxModelService;

    @Autowired
    public void setSwayService(DxModelService dxModelService) {
        super.setBaseDAO((BaseDAO) dxModelService);
        this.dxModelService = dxModelService;
    }
}
