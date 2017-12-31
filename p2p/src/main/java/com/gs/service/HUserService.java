package com.gs.service;

import com.gs.bean.HUser;

/**
 * Created by Administrator on 2017/12/21
 */
public interface HUserService extends BaseService {

    HUser getByPhonePwd(String phone, String pwd);
}
