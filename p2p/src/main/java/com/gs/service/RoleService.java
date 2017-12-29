package com.gs.service;

import com.gs.vo.RoleJurVO;

/**
 * Created by Administrator on 2017/12/21.
 */
public interface RoleService extends BaseService{
    //插入角色时批量插入角色权限
    public void insertBatch(RoleJurVO roleJurVO);
}
