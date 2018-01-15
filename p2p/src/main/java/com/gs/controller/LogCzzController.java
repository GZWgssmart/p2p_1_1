package com.gs.controller;

import com.gs.bean.LogCzz;
import com.gs.bean.User;
import com.gs.common.Constants;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.LogCzzService;
import com.gs.service.UserMoneyService;
import com.gs.vo.ControllerStatusVO;
import com.gs.vo.SearchVo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Calendar;

/**
 * Created by Administrator on 2017/12/25.
 */
@Controller
@RequestMapping("/logczz")
public class LogCzzController {
    @Autowired
    private LogCzzService logCzzService;
    @Autowired
    private UserMoneyService userMoneyService;

    @RequestMapping("page")
    public String showPage() {
        return "deposit/recharge";
    }

    @RequestMapping("add")
    @ResponseBody
    public ControllerStatusVO addLogCzz(HttpSession session , LogCzz logCzz) {
        User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
        ControllerStatusVO statusVO = new ControllerStatusVO();
        if(user != null) {
            try{
                logCzz.setUid(user.getUid());
                logCzz.setDate(Calendar.getInstance().getTime());
                logCzz.setState(Byte.valueOf("1"));
                logCzzService.save(logCzz);
                userMoneyService.updateById(user.getUid(),logCzz.getMoney());
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_RECHARGE_SUCCESS);
            }catch(Exception e) {
                e.printStackTrace();
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_RECHARGE_FAIL);
            }
          }
        return statusVO;
    }

    @RequestMapping("select")
    @ResponseBody
    public Pager selectLogCzzPage(HttpSession session, SearchVo param,Integer page, Integer rows) {
        Pager pager = new Pager();
        User user = (User) session.getAttribute(Constants.USER_IN_SESSION);

            try {
                if(page != null && rows != null) {
                    pager = logCzzService.listPagerCriteria(page,rows,null);
                    return pager;
                }else {
                    if(user != null) {
                        param.setUid(user.getUid());
                        pager = logCzzService.listPagerCriteria(param.getCurPage(), 8, param);
                        return pager;
                    }
                }
            }catch (Exception e){e.printStackTrace();}

        return pager;
    }

    //shiro权限注解
    @RequiresPermissions("logczz:backcz")
    @RequestMapping("backcz")
    public String ShowBackTxshPage() {
        return "/backpage/czList";
    }

}
