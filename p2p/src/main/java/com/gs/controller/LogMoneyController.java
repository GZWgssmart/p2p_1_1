package com.gs.controller;

import com.gs.bean.LogMoney;
import com.gs.bean.User;
import com.gs.common.Constants;
import com.gs.query.LogMoneyQuery;
import com.gs.service.LogMoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 创建类名：LogMoneyController
 * 创建时间：2017/12/25 8:37
 *
 * @author 温宁宁
 * @version 1.0
 */
@Controller
@RequestMapping("/log_money")
public class LogMoneyController {

    @Autowired
    private LogMoneyService logMoneyService;


    @RequestMapping("/mylog_money")
    public String mylog_money(HttpSession session, HttpServletRequest request){
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        List<LogMoney> logMoneyList =  (List) logMoneyService.getByUserId(null,null,user.getUid());
        request.setAttribute("type",4);
        request.setAttribute("logMoneyList",logMoneyList);
        return "logmoney/log_money";
    }
    @RequestMapping("/search/{type}/{date}")
    public String search(HttpSession session, HttpServletRequest request,@PathVariable("type") Byte type,@PathVariable("date") String date){
        if (type == 4){
            type = null;
        }
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        List<LogMoney> logMoneyList =  (List) logMoneyService.getByUserId(type,date,user.getUid());
        request.setAttribute("type",type);
        request.setAttribute("logMoneyList",logMoneyList);
        return "logmoney/log_money";
    }


}
