package com.gs.controller;

import com.gs.bean.HUser;
import com.gs.common.Combobox;
import com.gs.common.Constants;
import com.gs.common.EncryptUtils;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.HUserService;
import com.gs.vo.ControllerStatusVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2017/12/22
 */
@Controller
@RequestMapping("/huser")
public class HUserController {

    @Autowired
    private HUserService hUserService;

    @RequestMapping("/login_page")
    public String login_page(){
        return "user/backlogin";
    }

    /**
     * 后台登录
     * @param session
     * @param request
     * @param phone
     * @param pwd
     * @param code
     * @return
     */
    @RequestMapping("/backlogin")
    @ResponseBody
    public ControllerStatusVO login(HttpSession session, HttpServletRequest request, String phone, String pwd, String code) {
        Object obj = session.getAttribute(Constants.CODE_IN_SESSION);
        ControllerStatusVO statusVO = null;
        if (obj != null) {
            String checkCode = (String) obj;
            if (checkCode.equalsIgnoreCase(code)) {
                Object userObj = session.getAttribute(Constants.HUSER_IN_SESSION);
                if (userObj == null) {
                    HUser hUser = hUserService.getByPhonePwd(phone, EncryptUtils.md5(pwd));
                    if (hUser != null) {
                        session.setAttribute(Constants.HUSER_IN_SESSION, hUser);
                        statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_SUCCESS);
                        return statusVO;
                    } else {
                        statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_FAIL);
                    }
                } else {
                    statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_ALREADY_LOGIN);
                }
            } else {
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_LOGIN_ERROR_CODE);
            }
        }
        return statusVO;
    }

    @RequestMapping("home")
    public String home() {
        return "/backpage/index";
    }

    @RequestMapping("all")
    @ResponseBody
    public List<Combobox> listAll(){
        List<Object> objectList = hUserService.listAll();
        List<Combobox> comboboxList = new ArrayList<>();
        for(Object obj : objectList){
            HUser hUser = (HUser) obj;
            comboboxList.add(new Combobox(hUser.getHuid()+"",hUser.getHuname(),false));
        }
        return comboboxList;
    }

}
