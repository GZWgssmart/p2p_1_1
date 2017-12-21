package com.gs.controller;

import com.gs.service.BankCardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/12/20.
 */
@Controller
@RequestMapping("/bank")
public class BankCardController {

    @Autowired
    private BankCardService bankCardService;

    @RequestMapping("add")
    public String SaveBankCard() {
        return "";
    }

    @RequestMapping("delete")
    public String DeleteBankCard() {
        return "";
    }

    @RequestMapping("update")
    public String UpdateBankCard() {
        return "";
    }

    @RequestMapping("select")
    public String SelectBankCard() {
        return "";
    }

    @RequestMapping("getbyid")
    public String getByBankCard(Long bcid) {
        return "";
    }

}
