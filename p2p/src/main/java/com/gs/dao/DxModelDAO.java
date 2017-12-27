package com.gs.dao;

import com.gs.bean.DxModel;
import com.gs.common.Pager;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ：余鹏
 * time：2017/12/25.
 */
@Repository
public interface DxModelDAO extends BaseDAO{
    @Override
    void save(Object obj);

    @Override
    void removeById(Long id);

    @Override
    void update(Object obj);

    @Override
    List<Object> listPager(Pager pager);
}
