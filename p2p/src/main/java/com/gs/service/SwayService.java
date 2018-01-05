package com.gs.service;

import com.gs.bean.Sway;
import com.gs.common.Pager;

import java.util.List;

/**
 * Created by ：余鹏
 * time：2017/12/25.
 */
public interface SwayService extends BaseService{

    @Override
    void save(Object obj);

    @Override
    void removeById(Long id);

    @Override
    void update(Object obj);

    List<Object> listPager(Pager pager);

    int countByPager();

    Long countCriteria(Object obj);

    void updateState(Sway sway);
}