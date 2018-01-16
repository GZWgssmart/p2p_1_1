package com.gs.controller;

import com.gs.bean.BankCard;
import com.gs.bean.User;
import com.gs.common.Constants;
import com.gs.common.HttpUtils;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.BankCardService;
import com.gs.vo.ControllerStatusVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by Administrator on 2017/12/20.
 */
@Controller
@RequestMapping("/bank")
public class BankCardController {

    @Autowired
    private BankCardService bankCardService;

    @RequestMapping("page")
    public String showPage() {
        return "deposit/bank";
    }
    @RequestMapping("bindingpage")
    public String bindingShowPage() {
        return "deposit/bindingbank";
    }

    @RequestMapping("add")
    @ResponseBody
    public ControllerStatusVO SaveBankCard(HttpSession session , BankCard bankCard) {
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        ControllerStatusVO statusVO = new ControllerStatusVO();
        if(user != null) {
            String param = "realName="+user.getRname()+"&bank="+bankCard.getType()+"&bankCardNo="+bankCard.getCardno()+"&phone="+user.getPhone();
            HttpUtils.sendPost("http://localhost:8080/bank/bind",param);

           if(bankCardService.countCriteria(bankCard.getCardno()) == 0){
               bankCard.setState(Byte.valueOf("1"));
               bankCard.setDate(Calendar.getInstance().getTime());
               bankCard.setRname(user.getRname());
               bankCard.setIdno(user.getIdno());
               bankCardService.save(bankCard);
               return statusVO = ControllerStatusVO.status(ControllerStatusEnum.CASH_SAVE_SUCCESS);
           }
            return statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_BANK_FAIL);
        }
        return null;
    }

    @RequestMapping("delete")
    public String DeleteBankCard(Long id) {
        if(id != null) {
            bankCardService.removeById(id);
        }
        return "";
    }

    @RequestMapping("select")
    @ResponseBody
    public List<BankCard> SelectBankCard(HttpSession session) {
        List<BankCard> bankCards = new ArrayList<>();
        User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
        if(user != null) {
            bankCards = bankCardService.getBylistAll(user.getUid());
        }
        return bankCards;
    }

    @RequestMapping("delbyid")
    @ResponseBody
    public ControllerStatusVO deleteByBankCard(BankCard bankCard) {
        System.out.println("backcard:"+bankCard);
        ControllerStatusVO statusVO = new ControllerStatusVO();
        if(bankCard != null) {
            bankCardService.remove(bankCard);
            return statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_BANK_DELETE);
        }
            return null;
    }


    @RequestMapping("getbyid")
    @ResponseBody
    public BankCard getByBankCard(Long bcid) {
        BankCard bankCard = new BankCard();
        if(bcid != null) {
            bankCard = (BankCard)bankCardService.getById(bcid);
        }
        return bankCard;
    }

}
