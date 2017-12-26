package com.gs.controller;

import com.gs.bean.User;
import com.gs.bean.UserMoney;
import com.gs.common.Constants;
import com.gs.service.LogTxService;
import com.gs.service.UserMoneyService;
import com.gs.vo.TxInItPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2017/12/21.
 */
@Controller
@RequestMapping("/logtx")
public class LogTxController {

    @Autowired
    private LogTxService logTxService;
    @Autowired
    private UserMoneyService userMoneyService;

    @RequestMapping("page")
    public ModelAndView showPage(HttpSession session) {
        ModelAndView mav = new ModelAndView("deposit/deposit");
        User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
        if(user != null) {
            UserMoney userMoney = (UserMoney) userMoneyService.getByUserId(user.getUid());
            TxInItPage inItPage = new TxInItPage(user.getUid(),user.getUname(),user.getPhone(),userMoney.getKymoney());
            mav.addObject(inItPage);
        }
        return mav;
    }



}
