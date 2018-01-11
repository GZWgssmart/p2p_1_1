package com.gs.controller;

import com.gs.common.Pager;
import com.gs.query.HkbQuery;
import com.gs.service.HkbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * 创建类名：HkbController
 * 创建时间：2018/1/9 11:40
 *
 * @author 温宁宁
 * @version 1.0
 */
@Controller
@RequestMapping("/hkb")
public class HkbController {
    @Autowired
    private HkbService hkbService;

    @RequestMapping("/search")
    @ResponseBody
    public Pager search(HttpSession session, HkbQuery hkbQuery){
        Pager pager = new Pager();
        pager =  hkbService.listPagerCriteria(hkbQuery.getCurPage(),20,hkbQuery);
        return pager;
    }
}
