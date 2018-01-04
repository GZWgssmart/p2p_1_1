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

    void save(Object obj);


    void removeById(Long id);


    void update(Object obj);


    List<Object> listPager(Pager pager);

    Integer isRegPhone(String phone);
}
