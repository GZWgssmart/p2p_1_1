package com.gs.controller;

import com.gs.bean.*;
import com.gs.common.Constants;
import com.gs.common.Pager;
import com.gs.common.PathUtils;
import com.gs.enums.ControllerStatusEnum;
import com.gs.query.JkbQuery;
import com.gs.service.*;
import com.gs.vo.ControllerStatusVO;
import org.apache.commons.fileupload.FileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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
    @Autowired
    private SwayService swayService;

    //进入申请借款页面
    @RequestMapping("/jkb_page")
    public String jkb_page(HttpSession session, HttpServletRequest request){
        List<Bz> bzList = (List)bzService.listAll();
        List<Jklx> jklxList = (List)jklxService.listAll();
        List<Sway> swayList = (List)swayService.listAll();
        request.setAttribute("bzList",bzList);
        request.setAttribute("jklxList",jklxList);
        request.setAttribute("swayList",swayList);
        return "jkb/jkb_add";
    }
    //申请借款
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
        borrowDetailService.save(borrowDetail);
        ControllerStatusEnum.JKB_SAVE_WAIT.setCode(Integer.parseInt(borrowDetail.getBdid().toString()));
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.JKB_SAVE_WAIT);
        return statusVO;
    }
    //修改借款详情的4个图片
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
    //进入我的借款管理
    @RequestMapping("/my_jkb")
    public String myJkb(){
        return "jkb/my_jkb";
    }
    //进入我的借款管理
    @RequestMapping("/select")
    @ResponseBody
    public Pager SelectPage(HttpSession session,JkbQuery jkbQuery){
        Pager pager = new Pager();
        try {
            if(jkbQuery.getState() == null){
                jkbQuery.setState((byte)1);
            }
            pager =  borrowApplyService.listPagerCriteria(jkbQuery.getCurPage(),8,jkbQuery);
        }catch (Exception e){e.printStackTrace();}

        return pager;
    }
    //进入后台借款审核页面
    @RequestMapping("/jkb_listPage")
    public String jkbListPage(HttpSession session, HttpServletRequest request){
        return "jkb/jkb_listPage";
    }
    //后台借款审核
    @RequestMapping("/jkb_list")
    @ResponseBody
    public Pager jkbList(int page, int rows, JkbQuery jkbQuery) {
        System.out.println("page="+page+";rows="+rows+";jkb"+jkbQuery);
        jkbQuery.setState((byte)1);
        return borrowApplyService.listPagerCriteria(page, rows, jkbQuery);
    }
    //后台查看借款详情
    @RequestMapping("/jkb_look/{baid}")
    public String jkbLook(HttpSession session, HttpServletRequest request,@PathVariable("baid") Long baid){
        System.out.println("baid="+baid);
        BorrowApply borrowApply = (BorrowApply) borrowApplyService.getById(baid);
        request.setAttribute("borrowApply",borrowApply);
        return "jkb/jkb_listPage";
    }


}
