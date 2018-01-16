package com.gs.dao;

import com.gs.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2017/12/20
 */
@Repository
public interface UserDAO extends BaseDAO {

    User getByPhonePwd(@Param("phone") String phone, @Param("upwd") String upwd);

    User getByPhone(@Param("phone") String phone);

    User getByUserCode(@Param("tzm") String tzm);

    User getByIdPassword(@Param("id") Long id);
}
