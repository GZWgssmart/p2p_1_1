package com.gs.service;

import com.gs.common.Pager;

import java.util.List;

/**
 * Created by ：余鹏
 * time：2017/12/25.
 */
public interface DxModelService extends BaseService{

    int countByPager();

    void save(Object obj);

    void remove(Object obj);

    void update(Object obj);

    List<Object> listPager(Pager pager);

    Integer isRegPhone(String phone);
}
