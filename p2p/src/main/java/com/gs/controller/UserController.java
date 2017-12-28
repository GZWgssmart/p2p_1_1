package com.gs.controller;

import com.gs.bean.User;
import com.gs.bean.UserMoney;
import com.gs.common.Constants;
import com.gs.common.EncryptUtils;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.UserMoneyService;
import com.gs.service.UserService;
import com.gs.vo.ControllerStatusVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    private UserMoneyService userMoneyService;

    @Autowired
    private UserService userService;

    @RequestMapping("/login_page")
    public String login_page() {
        return "user/login";
    }

    @RequestMapping("/regist_page")
    public String regist() {
        return "user/regist";
    }

    @RequestMapping("/user_home")
    public String user_home() {
        return "user/user_home";
    }

    /**
     * 登录
     *
     * @param session
     * @param request
     * @param phone
     * @param pwd
     * @return
     */
    @RequestMapping("/login")
    @ResponseBody
    public ControllerStatusVO login(HttpSession session, HttpServletRequest request, String phone, String pwd) {
        ControllerStatusVO statusVO = null;
        User user = userService.getByPhonePwd(phone, EncryptUtils.md5(pwd));
        if (user != null) {
            session.setAttribute(Constants.USER_IN_SESSION, user);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_SUCCESS);
            return statusVO;
        } else {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_FAIL);
            return statusVO;
        }
    }

    /**
     * 注册
     *
     * @param uname
     * @param phone
     * @param upwd
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    public ControllerStatusVO save(String uname, String phone, String upwd, String tzm) {
        ControllerStatusVO statusVO = null;
        User user = new User();
        user.setUname(uname);
        user.setPhone(phone);
        user.setUpwd(EncryptUtils.md5(upwd));
//        if(tzm != "" || tzm.equals("")) {
        user.setTzm("256002");
//        }
        userService.save(user);
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_SAVE_SUCCESS);
        return statusVO;
    }

    /**
     * 验证推荐码是否存在
     *
     * @param tzm
     * @return
     */
    @RequestMapping("/isUserCodeExist")
    @ResponseBody
    public ControllerStatusVO isUserCodeExist(String tzm) {
        ControllerStatusVO statusVO = null;
        User user = userService.getByUserCode(tzm);
        if (user != null) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USERCODE_EXIST);
            return statusVO;
        } else {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USERCODE_UNEXIST);
            return statusVO;
        }
    }

    /**
     * 验证手机号是否存在
     *
     * @return
     */
    @RequestMapping("/isPhoneExist")
    @ResponseBody
    public ControllerStatusVO isPhoneExist(String phone) {
        ControllerStatusVO statusVO = null;
        User user = userService.getByPhone(phone);
        if (user != null) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.PHONE_EXIST);
            return statusVO;
        } else {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.PHONE_UNEXIST);
            return statusVO;
        }
    }

    @RequestMapping("/user_money")
    public String user_money(HttpSession session, HttpServletRequest request) {
        User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
        UserMoney userMoney = (UserMoney) userMoneyService.getByUserId(user.getUid());
        request.setAttribute("userMoney", userMoney);
        return "user/user_money";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session, User user) {
        session.removeAttribute(Constants.USER_IN_SESSION);
        return "/user/login";
    }
}