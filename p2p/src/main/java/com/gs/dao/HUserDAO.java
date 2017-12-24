package com.gs.dao;

import com.gs.bean.HUser;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * Created by Administrator on 2017/12/20
 */
@Repository
public interface HUserDAO extends BaseDAO {

    HUser getByPhonePwd(@Param("phone") String phone, @Param("pwd") String pwd);
}
