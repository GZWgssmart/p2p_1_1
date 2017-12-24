package com.gs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2017/12/21.
 */
@Controller
@RequestMapping("/logtx")
public class LogTxController {

    @RequestMapping("page")
    public String showPage() {
        return "deposit/deposit";
    }
}
