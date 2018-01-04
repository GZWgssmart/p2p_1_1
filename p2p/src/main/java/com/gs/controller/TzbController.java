package com.gs.controller;

import com.gs.bean.User;
import com.gs.common.Constants;
import com.gs.common.Pager;
import com.gs.query.TzbQuery;
import com.gs.service.TzbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * 创建类名：TzbController
 * 创建时间：2017/12/26 14:38
 *
 * @author 温宁宁
 * @version 1.0
 */
@Controller
@RequestMapping("/tzb")
public class TzbController {

    @Autowired
    private TzbService tzbService;

    @RequestMapping("/myTzb")
    public String myTzb(){
        return "tzb/tzb";
    }
    //进入我的借款管理
    @RequestMapping("/select")
    @ResponseBody
    public Pager SelectPage(HttpSession session, TzbQuery tzbQuery){
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        Pager pager = new Pager();
        try {
            tzbQuery.setUid(user.getUid());
            pager =  tzbService.listPagerCriteria(tzbQuery.getCurPage(),8,tzbQuery);
        }catch (Exception e){
            e.printStackTrace();
        }

        return pager;
    }
}
