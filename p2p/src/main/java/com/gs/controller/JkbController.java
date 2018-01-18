package com.gs.controller;

import com.gs.bean.*;
import com.gs.common.Constants;
import com.gs.common.Pager;
import com.gs.common.PathUtils;
import com.gs.enums.ControllerStatusEnum;
import com.gs.query.JkbQuery;
import com.gs.query.UserTicketQuery;
import com.gs.service.*;
import com.gs.vo.ControllerStatusVO;
import com.gs.vo.JkbVO;
import com.gs.vo.UserTicketVO;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
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
    private UserMoneyService userMoneyService;
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
    @Autowired
    private UserTicketService userTicketService;

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
        ControllerStatusEnum.JKB_SAVE_WAIT.setCode(Integer.parseInt(borrowApply.getBaid().toString()));
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.JKB_SAVE_WAIT);
        return statusVO;
    }
    //修改借款详情的4个图片
    @RequestMapping("/jkb_addimg")
    public String jkbAddimg(@RequestParam("file") MultipartFile[] pic,@RequestParam("baid") Long baid,HttpServletRequest request) throws Exception{
        BorrowDetail borrowDetail =new BorrowDetail();
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String dateString = formatter.format(currentTime);
        String fpic = "";
        String ypic = "";
        String qpic = "";
        String tpic = "";
        String name = "";
        for (int i=0;i<pic.length;i++){
            name = dateString+pic[i].getOriginalFilename();
            if (i==0 && !name.equals(dateString)){
                fpic = name;
                borrowDetail.setFpic(fpic);
                pic[i].transferTo(new File(PathUtils.uploadDir(request) + "/" + name));
            }else if(i==1 && !name.equals(dateString)){
                ypic = name;
                borrowDetail.setYpic(ypic);
                pic[i].transferTo(new File(PathUtils.uploadDir(request) + "/" + name));
            }else if(i==2 && !name.equals(dateString)){
                qpic = name;
                borrowDetail.setQpic(qpic);
                pic[i].transferTo(new File(PathUtils.uploadDir(request) + "/" + name));
            }else if (i==3 && !name.equals(dateString)){
                tpic = name;
                borrowDetail.setTpic(tpic);
                pic[i].transferTo(new File(PathUtils.uploadDir(request) + "/" + name));
            }
        }
        borrowDetail.setBaid(baid);
        if (!fpic.equals("") || !ypic.equals("") || !qpic.equals("") || !tpic.equals("")) {
            borrowDetailService.updatePic(borrowDetail);
        }
        return "redirect:/jkb/update_page/"+baid;
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
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        Pager pager = new Pager();
        try {
            if(jkbQuery.getState() == null){
                jkbQuery.setState((byte)1);
            }
            jkbQuery.setUid(user.getUid());
            pager =  borrowApplyService.listPagerCriteria(jkbQuery.getCurPage(),8,jkbQuery);
        }catch (Exception e){e.printStackTrace();}

        return pager;
    }
    //进入我的借款管理
    @RequestMapping("/update_page/{baid}")
    public String updatePage(HttpServletRequest request,@PathVariable("baid") Long baid){
        JkbVO jkbVO = (JkbVO) borrowApplyService.getById(baid);
        List<Bz> bzList = (List)bzService.listAll();
        List<Jklx> jklxList = (List)jklxService.listAll();
        List<Sway> swayList = (List)swayService.listAll();
        request.setAttribute("jkbVO",jkbVO);
        request.setAttribute("bzList",bzList);
        request.setAttribute("jklxList",jklxList);
        request.setAttribute("swayList",swayList);
        return "jkb/jkb_update";
    }
    //修改申请借款
    @RequestMapping("/jkb_update")
    @ResponseBody
    public ControllerStatusVO jkbUpdate(HttpSession session, BorrowApply borrowApply, BorrowDetail borrowDetail){
        ControllerStatusVO statusVO = null;
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        borrowApply.setState((byte) 1);
        Calendar cal = Calendar.getInstance();
        Date date = new Timestamp(cal.getTime().getTime());
        cal.setTime(date);
        cal.add(Calendar.MONTH, borrowApply.getTerm());
        borrowApply.setDeadline(new Timestamp(cal.getTime().getTime()));
        borrowApplyService.update(borrowApply);
        borrowDetailService.update(borrowDetail);
        ControllerStatusEnum.JKB_SAVE_WAIT.setCode(Integer.parseInt(borrowApply.getBaid().toString()));
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.JKB_SAVE_WAIT);
        return statusVO;
    }
    //进入后台借款审核页面
    //shiro权限注解
    @RequiresPermissions("jkb:jkb_listPage")
    @RequestMapping("/jkb_listPage")
    public String jkbListPage(HttpSession session, HttpServletRequest request){
        return "jkb/jkb_listPage";
    }
    //后台借款审核
    @RequestMapping("/jkb_list")
    @ResponseBody
    public Pager jkbList(int page, int rows, JkbQuery jkbQuery) {
        jkbQuery.setState((byte)1);
        return borrowApplyService.listPagerCriteria(page, rows, jkbQuery);
    }
    //借款
    @RequiresPermissions("jkb:shenhe")
    @RequestMapping("/shenhe")
    @ResponseBody
    public ControllerStatusVO shenhe(HttpSession session,BorrowApply borrowApply) {
        ControllerStatusVO statusVO = null;
        HUser hUser = (HUser) session.getAttribute(Constants.HUSER_IN_SESSION);
        borrowApply.setHuid(hUser.getHuid());
        Calendar cal = Calendar.getInstance();
        Date date = new Timestamp(cal.getTime().getTime());
        borrowApply.setTime(date);
        borrowApplyService.updateState2(borrowApply);
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.USER_ADUIT_SUCCESS);
        return statusVO;
    }
    //进入计算器页面
    @RequestMapping("/calc")
    public String Calc(){
        return "calc";
    }

    //进入前台投资
    @RequestMapping("/jkb_look/{baid}")
    public String JkbLook(HttpSession session,HttpServletRequest request,@PathVariable("baid") Long baid){
        User user = (User)session.getAttribute(Constants.USER_IN_SESSION);
        JkbVO jkb = (JkbVO) borrowApplyService.getById(baid);
        if(user !=null){
            UserMoney userMoney = (UserMoney) userMoneyService.getByUserId(user.getUid());
            request.setAttribute("userMoney",userMoney);
            request.setAttribute("pwd",user.getZpwd());

            UserTicketVO userTicketVO = new UserTicketVO();
            List<UserTicketVO> userTicketVOList = userTicketService.getTicket(user.getUid(),1L);
            System.out.println(userTicketVOList.get(0).getType());
            request.setAttribute("userTicketVOList",userTicketVOList);
        }
        request.setAttribute("jkb",jkb);
        return "jkb/jkb_look";
    }



}
