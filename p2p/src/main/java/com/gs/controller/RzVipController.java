package com.gs.controller;

import com.gs.bean.RzVip;
import com.gs.bean.User;
import com.gs.common.Constants;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.RzVipService;
import com.gs.service.UserService;
import com.gs.vo.ControllerStatusVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/rzvip")
public class RzVipController {

    @Autowired
    private RzVipService rzVipService;

    @Autowired
    private UserService userService;

    @RequestMapping("/save")
    @ResponseBody
    public ControllerStatusVO save(HttpSession session, User user, RzVip rzVip) {
        ControllerStatusVO statusVO = null;
        User user1 = (User) session.getAttribute(Constants.USER_IN_SESSION);
        user.setUid(user1.getUid());
        rzVip.setUid(user1.getUid());
        int sex = Integer.valueOf(user.getIdno().substring(16, 17))%2;//通过身份证号倒数第二位判断性别
        System.out.println(user.getIdno().substring(16, 17)+"倒数第二位数");
        if (sex == 0) {
            user.setSex((byte)2);//女
        } else if (sex == 1) {
            user.setSex((byte)1);//男
        }
        userService.update(user);
        rzVipService.update(rzVip);
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_SAVE_SUCCESS);
        return statusVO;
    }
}