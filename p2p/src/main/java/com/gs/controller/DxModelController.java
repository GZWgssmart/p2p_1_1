package com.gs.controller;

import com.gs.common.SendCode;
import com.gs.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * 创建类名：IndexController
 * 创建时间：2017/12/19 9:11
 *
 * @author 温宁宁
 * @version 1.0
 */
@Controller
@RequestMapping("/reAndLo")
public class DxModelController {

    @Autowired
    private UserService userService;

    @RequestMapping("reAndLo")
    public int index(HttpSession session,String phone){
       int moblecode =  SendCode.sendsms(phone);
        session.setAttribute("moble", moblecode);
        return moblecode;
    }


}
