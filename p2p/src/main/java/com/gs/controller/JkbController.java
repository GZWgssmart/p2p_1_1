package com.gs.controller;

import com.gs.bean.*;
import com.gs.common.Constants;
import com.gs.common.PathUtils;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.BorrowApplyService;
import com.gs.service.BorrowDetailService;
import com.gs.service.BzService;
import com.gs.service.JklxService;
import com.gs.vo.ControllerStatusVO;
import org.apache.commons.fileupload.FileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * 创建类名：JkbController
 * 创建时间：2017/12/26 15:08
 *
 * @author 温宁宁
 * @version 1.0
 */
@Controller
@RequestMapping("/jkb")
public class JkbController {

    @Autowired
    private BorrowApplyService borrowApplyService;
    @Autowired
    private BorrowDetailService borrowDetailService;
    @Autowired
    private BzService bzService;
    @Autowired
    private JklxService jklxService;

    @RequestMapping("/jkb_page")
    public String jkb_page(HttpSession session, HttpServletRequest request){
        List<Bz> bzList = (List)bzService.listAll();
        List<Jklx> jklxList = (List)jklxService.listAll();
        request.setAttribute("bzList",bzList);
        request.setAttribute("jklxList",jklxList);
        return "jkb/jkb_add";
    }
    @RequestMapping("/jkb_save")
    @ResponseBody
    public ControllerStatusVO jkbSave(HttpSession session,HttpServletRequest request, BorrowApply borrowApply, BorrowDetail borrowDetail){
        ControllerStatusVO statusVO = null;
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        borrowApply.setRname(user.getRname());
        borrowApply.setUid(user.getUid());
        borrowApply.setState((byte) 1);
        Calendar cal = Calendar.getInstance();
        Date date = new Timestamp(cal.getTime().getTime());
        cal.setTime(date);
        cal.add(Calendar.MONTH, borrowApply.getTerm());
        borrowApply.setDeadline(new Timestamp(cal.getTime().getTime()));
        borrowApplyService.save(borrowApply);
        borrowDetail.setCpname("PJZB"+borrowApply.getBzid()+borrowApply.getLxid()+borrowApply.getBaid());
        borrowDetail.setBaid(borrowApply.getBaid());
        borrowDetail.setMoney(borrowApply.getMoney());
        borrowDetailService.save(borrowDetail);
        ControllerStatusEnum.JKB_SAVE_WAIT.setCode(Integer.parseInt(borrowDetail.getBdid().toString()));
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.JKB_SAVE_WAIT);
        return statusVO;
    }
    @RequestMapping("/jkb_addimg")
    public String jkbAddimg(@RequestParam("file") MultipartFile[] pic,@RequestParam("bdid") Long bdid,HttpServletRequest request) throws Exception{
        BorrowDetail borrowDetail =new BorrowDetail();
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateString = formatter.format(currentTime);
        String fpic = "";
        String ypic = "";
        String qpic = "";
        String tpic = "";
        for (int i=0;i<pic.length;i++){
            String name = dateString+pic[i].getOriginalFilename();
            if (i==0){
                fpic = name;
            }else if(i==1){
                ypic = name;
            }else if(i==2){
                qpic = name;
            }else if (i==3){
                tpic = name;
            }
            pic[i].transferTo(new File(PathUtils.uploadDir(request) + "/" + name));

        }
        borrowDetail.setBdid(bdid);
        borrowDetail.setFpic(fpic);
        borrowDetail.setYpic(ypic);
        borrowDetail.setTpic(tpic);
        borrowDetail.setQpic(qpic);
        borrowDetailService.updatePic(borrowDetail);
        return "redirect:/jkb/my_jkb";
    }
    @RequestMapping("/my_jkb")
    public String myJkb(HttpSession session, HttpServletRequest request){
        List<BorrowApply> borrowApplyList = (List)borrowApplyService.listAll();
        request.setAttribute("borrowApplyList",borrowApplyList);
        return "jkb/my_jkb";
    }

}
