package com.gs.service;

import com.gs.common.Pager;

/**
 * Created by ：余鹏
 * time：2017/12/25.
 */
public interface DxModelService extends BaseService{
    void save(Object obj);

    void remove(Object obj);

    void update(Object obj);

    Pager listPager(int pageNo, int pageSize);

    Integer isRegPhone(String phone);
}
