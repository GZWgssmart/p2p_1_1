package com.gs.service;

import com.gs.bean.Jur;
import com.gs.vo.ControllerStatusVO;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.List;

/**
 * Created by Administrator on 2017/12/21.
 */
public interface JurService extends BaseService{
    //批量插入权限
    public void insertInfoBatch(List<Jur> jurList);
    public void importExcelInfo(InputStream in, MultipartFile file, Integer huid) throws Exception;
}
