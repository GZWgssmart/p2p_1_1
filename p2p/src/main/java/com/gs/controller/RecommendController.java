package com.gs.controller;

import com.gs.bean.Recommend;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.gs.bean.User;
import com.gs.common.CheckCodeUtils;
import com.gs.common.Pager;
import com.gs.enums.ControllerStatusEnum;
import com.gs.service.RecommendService;
import com.gs.vo.ControllerStatusVO;
import com.gs.vo.RecommendVO;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;

/**
 * 创建时间：2017/12/21.
 * @author 张芳芃
 */

@Controller
@RequestMapping("/recommend")
public class RecommendController {
    @Autowired
    private RecommendService recommendService;

    @RequestMapping("page")
    public String page() {
        return "recommend/recommend";
    }

    @RequestMapping("pager_criteria")
    @ResponseBody
    public Pager pagerCriteria(int page, int rows, RecommendVO recommend) {
        return recommendService.listPagerCriteria(page, rows, recommend);
    }

    //删除单个
    @RequestMapping("remove")
    @ResponseBody
    public ControllerStatusVO remove(long id) {
        ControllerStatusVO statusVO = null;
        try {
            recommendService.remove(id);
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.RECOMMEND_DELETE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.RECOMMEND_DELETE_SUCCESS);
        return statusVO;
    }

    //删除多个
    @RequestMapping("/delMany")
    @ResponseBody
    public ControllerStatusVO delEduList(Long[] ids) {
        ControllerStatusVO statusVO = null;
        try {
            for (Long id : ids) {
                recommendService.remove(id);
            }
        } catch (RuntimeException e) {
            statusVO = ControllerStatusVO.status(ControllerStatusEnum.RECOMMEND_DELETE_FAIL);
        }
        statusVO = ControllerStatusVO.status(ControllerStatusEnum.RECOMMEND_DELETE_SUCCESS);
        return statusVO;
    }

    //推荐码生成
    public String save(User user) {
        String tzmCode = CheckCodeUtils.recommendCode();
        boolean tzmisExit = true;
        while (tzmisExit) {
            int isExit = recommendService.countTzm(tzmCode);
            //推荐码存在
            if (isExit == 1) {
                tzmCode = CheckCodeUtils.recommendCode();
                //推荐码不存在
            } else if (isExit == 0) {
                tzmisExit = false;
                user.setTzm(tzmCode);
            }
        }
        return "null";
    }

    @RequestMapping("export")
    public void exportExcel(HttpServletResponse response, RecommendVO recommendVO) {
        Workbook workbook = recommendService.export(recommendVO);
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-disposition", "attachment; filename=cash.xlsx");
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        try {
            OutputStream out = response.getOutputStream();
            workbook.write(out);
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
