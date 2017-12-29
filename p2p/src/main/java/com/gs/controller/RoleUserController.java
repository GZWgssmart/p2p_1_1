package com.gs.controller;

import com.gs.bean.Role;
import com.gs.bean.RoleUser;
import com.gs.common.Pager;
import com.gs.service.RoleUserService;
import com.gs.vo.RoleUserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/29.
 */
@Controller
@RequestMapping("/roleUser")
public class RoleUserController {
    @Autowired
    private RoleUserService roleUserService;


    @RequestMapping("page")
    public String Page(){
        return "roleuser/roleuser";
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int page, int rows, RoleUserVO roleUserVO) {
        return roleUserService.listPagerCriteria(page, rows, roleUserVO);
    }


}
