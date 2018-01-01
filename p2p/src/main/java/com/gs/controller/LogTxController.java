package com.gs.controller;

import com.gs.bean.LogTx;
import com.gs.bean.User;
import com.gs.bean.UserMoney;
import com.gs.common.Constants;
import com.gs.common.EncryptUtils;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.LogTxService;
import com.gs.service.UserMoneyService;
import com.gs.service.UserService;
import com.gs.vo.ControllerStatusVO;
import com.gs.vo.SearchVo;
import com.gs.vo.TxInItPage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.Calendar;

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

    @Autowired
    private UserService userService;

    @RequestMapping("page")
    @ResponseBody
    public ModelAndView showPage(HttpSession session) {
        ModelAndView mav = new ModelAndView("deposit/deposit");
       /* User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
        if(user != null) {
            UserMoney userMoney = (UserMoney) userMoneyService.getByUserId(user.getUid());
            TxInItPage inItPage = new TxInItPage(user.getUid(),user.getUname(),user.getPhone(),userMoney.getKymoney());
            mav.addObject(inItPage);
        }*/
        UserMoney userMoney = (UserMoney) userMoneyService.getByUserId(1L);
        TxInItPage inItPage = new TxInItPage(1L,"温宁宁","1456456456",userMoney.getKymoney());
        mav.addObject("inItPage",inItPage);
        return mav;
    }
    @RequestMapping("add")
    @ResponseBody
    public ControllerStatusVO addLogTx(HttpSession session, LogTx logTx) {
        User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
        ControllerStatusVO statusVO = new ControllerStatusVO();
        /*if(user != null) {
            logTx.setUid(user.getUid());
            logTx.setDate(Calendar.getInstance().getTime());
            logTx.setState(Byte.valueOf("2"));
            logTxService.save(logTx);
        }*/
        try{
            if(userService.getByIdPassword(1L).equals(EncryptUtils.md5(logTx.getPassword()))) {
                logTx.setUid(1L);
                logTx.setDate(Calendar.getInstance().getTime());
                logTx.setState(Byte.valueOf("1"));
                logTxService.save(logTx);
                userMoneyService.updateByIdMaoll(1L,logTx.getMoney());
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_DEPOSIT_SUCCESS);
            }else{
                statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_PASS_FAIL);
            }

        }catch (Exception e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_DEPOSIT_FAIL);
        }
        return statusVO;
    }
    @RequestMapping("select")
    @ResponseBody
    public Pager SelectLogTxPage(HttpSession session, SearchVo param) {
        Pager pager = new Pager();
        /*List<Object> logCzzVoList = new ArrayList<>();*/
        /*User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
        if(user != null) {
            logCzzVoList = logCzzService.listAllById(user.getUid());
        }*/
        /*logCzzVoList = logCzzService.listAllById(1L);*/

        try {
            param.setUid(1L);
            //param.setCurPage(1);
            pager =  logTxService.listPagerCriteria(param.getCurPage(),8,param);
        }catch (Exception e){e.printStackTrace();}

        return pager;
    }

    @RequestMapping("cancl")
    @ResponseBody
    public ControllerStatusVO CanclLogTx(HttpSession session , Long id, BigDecimal money ) {
        ControllerStatusVO statusVO = new ControllerStatusVO();
        User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
        try{
            logTxService.updateById(Byte.valueOf("3"),id);
            userMoneyService.updateById(1L,money);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_CANCL_SUCCESS);
        }catch(Exception e) {
            e.printStackTrace();
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_CANCL_FAIL);
        }
        return statusVO;
    }
}
