package com.gs.dao;

import org.springframework.stereotype.Repository;

/**
 * UserMoneyDAO接口，实现CRUD
 * 创建时间：2017/12/21 11:18
 *
 * @author 温宁宁
 * @version 1.0
 */
@Repository
public interface UserMoneyDAO extends BaseDAO{
    Object getByUserId(Long id);
}
