package com.gs.controller;

import com.gs.bean.Bz;
import com.gs.bean.Jklx;
import com.gs.service.BorrowApplyService;
import com.gs.service.BzService;
import com.gs.service.JklxService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 创建类名：JkbController
 * 创建时间：2017/12/26 15:08
 *
 * @author 温宁宁
 * @version 1.0
 */
@Controller
@RequestMapping("/jkb")
public class JkbController {

    @Autowired
    private BorrowApplyService borrowApplyService;
    @Autowired
    private BzService bzService;
    @Autowired
    private JklxService jklxService;

    @RequestMapping("/jkb_page")
    public String jkb_page(HttpSession session, HttpServletRequest request){
        List<Bz> bzList = (List)bzService.listAll();
        List<Jklx> jklxList = (List)jklxService.listAll();
        request.setAttribute("bzList",bzList);
        request.setAttribute("jklxList",jklxList);
        return "jkb/jkb_add";
    }

}
