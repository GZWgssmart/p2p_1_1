package com.gs.controller;

import com.gs.bean.Jur;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.JurService;
import com.gs.vo.ControllerStatusVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;

/**
 * Created by Administrator on 2017/12/21.
 */
@Repository
@RequestMapping("/jur")
public class JurController {

    @Autowired
    private JurService jurService;

    @RequestMapping("/import")
    @ResponseBody
    public ControllerStatusVO impotr(HttpServletRequest request) throws Exception {
        int huserid = 1;
        ControllerStatusVO statusVO = null;
        //获取上传的文件
        MultipartHttpServletRequest multipart = (MultipartHttpServletRequest) request;
//        MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
//        MultipartHttpServletRequest multipartRequest = resolver.resolveMultipart(request);
        MultipartFile file = multipart.getFile("file");
        String month = request.getParameter("month");
        InputStream in = file.getInputStream();
        try{
            //数据导入
            jurService.importExcelInfo(in,file,huserid);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.JUR_SAVE_SUCCESS);
        }catch (RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.JUR_SAVE_FAIL);
        }
        in.close();
        return statusVO;
    }

    @RequestMapping("page")
    public String Page(){
        return "jur/jur";
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int page, int rows, Jur jur){
        return jurService.listPagerCriteria(page,rows,jur);
    }

    @RequestMapping("update")
    @ResponseBody
    public ControllerStatusVO update(Jur jur){
        ControllerStatusVO statusVO = null;
        try{
            jurService.update(jur);
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.JUR_UPDATE_SUCCESS);
        }catch (RuntimeException e){
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.JUR_UPDATE_FAIL);
        }
        return statusVO;
    }
}
