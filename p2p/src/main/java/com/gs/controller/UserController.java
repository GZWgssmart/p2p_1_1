package com.gs.controller;

import com.gs.bean.DxModel;
import com.gs.bean.User;
import com.gs.bean.UserMoney;
import com.gs.common.CheckCodeUtils;
import com.gs.common.Constants;
import com.gs.common.EncryptUtils;
import com.gs.common.SendCode;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.DxModelService;
import com.gs.service.RecommendService;
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

    @Autowired
    private DxModelService dxModelService;

    @Autowired
    private RecommendService recommendService;

    public String msgCode;

    @RequestMapping("/login_page")
    public String login_page(){
        return "user/login";
    }

    @RequestMapping("/regist_page")
    public String regist(String tzm,HttpServletRequest request){
        if(tzm != null && tzm.length() == 6 ) {
            request.setAttribute("tzm",tzm);
        }
        return "user/regist";
    }

    @RequestMapping("/user_home")
    public String user_home(){
        return "user/user_home";
    }

    @RequestMapping("/registpay")
    public String registpay(){
        return "user/registpay";
    }

    @RequestMapping("/user_safe")
    public String user_safe(HttpSession session) {

        return "user/safe";
    }

    /**
     * 登录
     * @param session
     * @param request
     * @param phone
     * @param pwd
     * @return
     */
    @RequestMapping("/login")
    @ResponseBody
    public ControllerStatusVO login(HttpSession session, HttpServletRequest request, String phone, String pwd){
        ControllerStatusVO statusVO = null;
        User user = userService.getByPhonePwd(phone, EncryptUtils.md5(pwd));
        if (user != null) {
            session.setAttribute(Constants.USER_IN_SESSION, user);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_SUCCESS);
            request.setAttribute("user", user);
            return statusVO;
        } else {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_FAIL);
            return statusVO;
        }
    }


    /**
     * 发送验证码
     * @param phone
     * @return
     */
    @RequestMapping("savemsgCode")
    @ResponseBody
    public ControllerStatusVO save(String phone){
        ControllerStatusVO statusVO = null;
        try {
            DxModel dxModel=new DxModel();
//            String content= SendCode.sendsms(phone)+"";
            String content = "000000";
            dxModel.setContent(content);
            msgCode = content;
            dxModelService.save(dxModel);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.DxModel_SAVE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.DxModel_SAVE_SUCCESS);
        return statusVO;
    }

    /**
     * 验证短信验证码
     * @param smsCode
     * @return
     */
    @RequestMapping("checkmsgCode")
    @ResponseBody
    public ControllerStatusVO checkmsgCode(String smsCode){
        ControllerStatusVO statusVO = null;
        if (smsCode.equals(msgCode)) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.DxModel_SAVE_SUCCESS);
        } else {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.DxModel_SAVE_FAIL);
        }
        return statusVO;
    }

    /**
     * 注册
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
        String tzmCode = CheckCodeUtils.recommendCode();
        boolean tzmisExit = true;
        while (tzmisExit) {
            int isExit = recommendService.countTzm(tzmCode);
            //推荐码存在
            if (isExit == 1) {
                tzmCode = CheckCodeUtils.recommendCode();
                //推荐码不存在
            } else if (isExit == 0) {
                tzmisExit = false;
                user.setTzm(tzmCode);
            }
        }
        userService.save(user);
        UserMoney userMoney = new UserMoney();
        userMoney.setUid(user.getUid());
        userMoneyService.save(userMoney);
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_SAVE_SUCCESS);
        return statusVO;
    }

    /**
     * 验证推荐码是否存在
     * @param tzm
     * @return
     */
//    @RequestMapping("/isUserCodeExist")
//    @ResponseBody
//    public ControllerStatusVO isUserCodeExist(String tzm) {
//        ControllerStatusVO statusVO = null;
//        User user = userService.getByUserCode(tzm);
//        if (user != null) {
//            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USERCODE_EXIST);
//            return statusVO;
//        } else {
//            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USERCODE_UNEXIST);
//            return statusVO;
//        }
//    }

    /**
     * 验证手机号是否存在
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

    /**
     * 修改密码
     * @param session
     * @param oldPassword
     * @param newPassword
     * @return
     */
    @RequestMapping("/changePwd")
    @ResponseBody
    public ControllerStatusVO changePwd(HttpSession session, String oldPassword, String newPassword) {
        ControllerStatusVO statusVO = null;
//        获取session中用户的ID
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
//        通过用户ID获取密码
        User user1  = userService.getByIdPassword(user.getUid());
        if (user1 != null) {
            if (user1.getUpwd().equals(EncryptUtils.md5(oldPassword))) {
                user.setUpwd(EncryptUtils.md5(newPassword));
                userService.update(user);
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.PHONE_EXIST);
                return statusVO;
            } else {
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_PASS_FAIL);
                return statusVO;
            }
        }
        return statusVO;
    }
/*
    @RequestMapping("/changeEmail")
    @ResponseBody
    public ControllerStatusVO changeEmail(HttpSession session, String email) {
        ControllerStatusVO statusVO = null;
//        获取session中用户的ID
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        if (user != null) {
            user.setEmail(email);
            userService.update(user);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.PHONE_EXIST);
        }
        return statusVO;
    }
*/

    @RequestMapping("/checkCode")
    @ResponseBody
    public ControllerStatusVO checkCode(HttpSession session, String code) {
        Object obj = session.getAttribute(Constants.CODE_IN_SESSION);
        ControllerStatusVO statusVO = null;
        if (obj != null) {
            String checkCode = (String) obj;
            if (checkCode.equalsIgnoreCase(code)) {
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_SUCCESS);
            } else {
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_ERROR_CODE);
            }
        }
        return statusVO;
    }

    @RequestMapping("/user_money")
    public String user_money(HttpSession session, HttpServletRequest request){
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        UserMoney userMoney = (UserMoney) userMoneyService.getByUserId(user.getUid());
        request.setAttribute("userMoney",userMoney);
        return "user/user_money";
    }

    @RequestMapping("/logout")
    public String logout(HttpSession session, User user) {
        session.removeAttribute(Constants.USER_IN_SESSION);
        return "/user/login";
    }

    @RequestMapping("userbyid")
    @ResponseBody
    public User getByUserId(Long uid) {
        if(uid != null) {
            User user = (User) userService.getById(uid);
            return user;
        }
        return null;
    }
}