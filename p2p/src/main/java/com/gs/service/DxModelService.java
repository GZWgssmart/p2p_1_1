package com.gs.service;

import com.gs.common.Pager;

/**
 * Created by ：余鹏
 * time：2017/12/25.
 */
public interface DxModelService extends BaseService{
    @Override
    void save(Object obj);

    @Override
    void remove(Object obj);

    @Override
    void update(Object obj);

    @Override
    Pager listPager(int pageNo, int pageSize);
}
