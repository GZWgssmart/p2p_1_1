package com.gs.dao;

import com.gs.bean.Jklx;
import com.gs.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by ：余鹏
 * time：2017/12/25.
 */
@Repository
public interface JklxDAO extends BaseDAO{
    @Override
    List<Object> listPager(@Param("pager") Pager pager);

    void updateState(Jklx jklx);

    @Override
    void save(Object obj);

    @Override
    void removeById(Long id);

    @Override
    void update(Object obj);

    @Override
    Long countCriteria(Object obj);
}
