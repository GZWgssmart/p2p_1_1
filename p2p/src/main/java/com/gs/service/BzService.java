package com.gs.service;

import com.gs.bean.Bz;
import com.gs.common.Pager;

import java.util.List;

/**
 * Created by ：余鹏
 * time：2017/12/25.
 */
public interface BzService extends BaseService{
    void save(Bz bz);

    void update(Bz bz);

    void removeById(Long bzid);

    void updateState(Bz bz);

    Long countCriteria(Object obj);

    List<Object> listPager(Pager pager);
}
