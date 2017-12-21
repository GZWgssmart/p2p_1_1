package com.gs.controller;

import com.gs.bean.User;
import com.gs.bean.UserMoney;
import com.gs.dao.UserMoneyDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

    @Autowired
    private UserMoneyDAO userMoneyDAO;
    @RequestMapping("/login_page")
    public String login_page(){
        return "user/login";
    }

    @RequestMapping("/user_money")
    public String user_money(HttpSession session, HttpServletRequest request){
        User user = (User) session.getAttribute("user");
        UserMoney userMoney = (UserMoney) userMoneyDAO.getByUserId(user.getUid());
        request.setAttribute("userMoney",userMoney);
        return "user/user_money";
    }
}
