package com.gs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 创建类名：UserController
 * 创建时间：2017/12/20 8:39
 *
 * @author 温宁宁
 * @version 1.0
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping("/login_page")
    public String login_page(){
        return "user/login";
    }
    @RequestMapping("/user_money")
    public String user_money(){
        return "user/user_money";
    }
}
