package com.gs.service.impl;

import com.gs.dao.BorrowApplyDAO;
import com.gs.service.AbstractBaseService;
import com.gs.service.BorrowApplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 创建类名：BorrowApplyServiceImpl
 * 创建时间：2017/12/26 15:12
 *
 * @author 温宁宁
 * @version 1.0
 */
@Service
public class BorrowApplyServiceImpl extends AbstractBaseService implements BorrowApplyService {

    private BorrowApplyDAO borrowApplyDAO;

    @Autowired
    public void setBorrowApplyDAO(BorrowApplyDAO borrowApplyDAO) {
        super.setBaseDAO(borrowApplyDAO);
        this.borrowApplyDAO = borrowApplyDAO;
    }
}
