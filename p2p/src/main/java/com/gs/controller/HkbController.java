package com.gs.controller;

import com.gs.bean.Hkb;
import com.gs.bean.User;
import com.gs.common.Constants;
import com.gs.common.Pager;
import com.gs.query.HkbQuery;
import com.gs.service.HkbService;
import com.gs.vo.ControllerStatusVO;
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
    @RequestMapping("/hkb_list")
    @ResponseBody
    public Pager List(HttpSession session, HkbQuery hkbQuery){
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        if (hkbQuery.getState() == null){
            if (!hkbQuery.getBorrowFlag().equals("")){
                hkbQuery.setState((byte)1);
            }
        }
        hkbQuery.setUid(user.getUid());
        Pager pager = new Pager();
        pager =  hkbService.list(hkbQuery.getCurPage(),8,hkbQuery);
        return pager;
    }
    //查看还款详情
    @RequestMapping("/look_hkb")
    @ResponseBody
    public Hkb lookSkb(Hkb hkb) {
        Hkb hkb1 = new Hkb();
        hkb1 = (Hkb) hkbService.getById(hkb.getHkid());
        return hkb1;

    }
    //查看还款详情
    @RequestMapping("/update_hkb")
    @ResponseBody
    public ControllerStatusVO UpdateSkb(Hkb hkb) {
        return hkbService.update_hkb(hkb);

    }
}
