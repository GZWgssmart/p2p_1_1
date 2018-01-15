package com.gs.controller;

import com.gs.bean.BorrowApply;
import com.gs.bean.Bz;
import com.gs.common.Combobox;
import com.gs.common.Pager;
import com.gs.query.BorrowapplyQuery;
import com.gs.service.BorrowApplyService;
import com.gs.service.BzService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2018/1/10.
 */
@Controller
@RequestMapping("/borrowApply")
public class BorrowapplyController {
    @Autowired
    private BorrowApplyService borrowApplyService;

    @Autowired
    private BzService bzService;

    @RequiresPermissions("borrowApply:page")
    @RequestMapping("page")
    public String Page(){
        return "borrowapply/borrowapply";
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int page, int rows, BorrowapplyQuery borrowapplyQuery){
        return borrowApplyService.listPagerCriteria(page,rows,borrowapplyQuery);
    }

    @RequestMapping("all")
    @ResponseBody
    public List<Combobox> bzList(){
        List<Object> objectList = bzService.listAll();
        List<Combobox> comboboxList = new ArrayList<>();
        for(Object obj:objectList){
            Bz bz = (Bz) obj;
            comboboxList.add(new Combobox(bz.getBzid()+"",bz.getBzname(),false));
        }
        return comboboxList;
    }
}
