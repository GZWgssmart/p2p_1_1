package com.gs.controller;

import com.gs.bean.BankCard;
import com.gs.bean.User;
import com.gs.common.Constants;
import com.gs.service.BankCardService;
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
    public String SaveBankCard(HttpSession session , BankCard bankCard) {
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        if(user != null) {
            bankCard.setUid(user.getUid());
            bankCard.setState(Byte.valueOf("1"));
            bankCard.setDate(Calendar.getInstance().getTime());
        }
        bankCardService.save(bankCard);
        return "deposit/bank";
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
        bankCards = bankCardService.getBylistAll(1L);
       /* User user = (User) session.getAttribute(Constants.USER_IN_SESSION);
        if(user != null) {
            bankCards = bankCardService.getBylistAll(user.getUid());
        }*/
        return bankCards;
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
