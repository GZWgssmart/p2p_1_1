package com.gs.service;

/**
 * UserMoneyService接口，实现CRUD
 * 创建时间：2017/12/21 11:19
 *
 * @author 温宁宁
 * @version 1.0
 */
public interface UserMoneyService extends BaseService {
    Object getByUserId(Long id);
}
