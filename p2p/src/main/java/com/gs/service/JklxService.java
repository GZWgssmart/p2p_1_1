package com.gs.service;

import com.gs.bean.Jklx;
import com.gs.common.Pager;

import java.util.List;

/**
 * Created by ：余鹏
 * time：2017/12/25.
 */
public interface JklxService extends BaseService{

    Long countCriteria(Object obj);

    void updateState(Jklx jklx);

    @Override
    void save(Object obj);

    @Override
    void removeById(Long id);

    @Override
    List<Object> listAll();

    @Override
    void update(Object obj);

    List<Object> listPager(Pager pager);

    int countByPager();
}
