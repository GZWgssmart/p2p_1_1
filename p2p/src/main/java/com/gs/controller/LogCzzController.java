package com.gs.controller;

import com.gs.bean.LogCzz;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.LogCzzService;
import com.gs.service.UserMoneyService;
import com.gs.vo.ControllerStatusVO;
import com.gs.vo.SearchVo;
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
       /* User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
          if(user != null) {*/
        ControllerStatusVO statusVO = new ControllerStatusVO();
        try{
            logCzz.setUid(1L);
            logCzz.setDate(Calendar.getInstance().getTime());
            logCzz.setState(Byte.valueOf("1"));
            logCzzService.save(logCzz);
            userMoneyService.updateById(1L,logCzz.getMoney());
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_RECHARGE_SUCCESS);
        }catch(Exception e) {
            e.printStackTrace();
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_RECHARGE_FAIL);
        }
         /* }*/
        return statusVO;
    }

    @RequestMapping("select")
    @ResponseBody
    public Pager selectLogCzzPage(HttpSession session, SearchVo param,Integer page, Integer rows) {
        Pager pager = new Pager();
        /*List<Object> logCzzVoList = new ArrayList<>();*/
        /*User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
        if(user != null) {
            logCzzVoList = logCzzService.listAllById(user.getUid());
        }*/
        /*logCzzVoList = logCzzService.listAllById(1L);*/

        try {
            if(page != null && rows != null) {
                pager = logCzzService.listPagerCriteria(page,rows,null);
                return pager;
            }else {
                param.setUid(1L);
                pager =  logCzzService.listPagerCriteria(param.getCurPage(), 8, param);
                return pager;
            }
        }catch (Exception e){e.printStackTrace();}

        return pager;
    }

    @RequestMapping("backcz")
    public String ShowBackTxshPage() {
        return "/backpage/czList";
    }

}
