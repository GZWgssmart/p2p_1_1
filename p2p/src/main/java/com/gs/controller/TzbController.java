package com.gs.controller;

import com.gs.service.TzbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
    public String myTzb(HttpSession session){

        return "tzb/tzb";
    }
}
