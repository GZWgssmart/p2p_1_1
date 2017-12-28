package com.gs.dao;

import com.gs.common.Pager;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 创建类名：BorrowApplyDAO
 * 创建时间：2017/12/26 15:11
 *
 * @author 温宁宁
 * @version 1.0
 */
@Repository
public interface BorrowApplyDAO extends BaseDAO{
    @Override
    List<Object> listPagerCriteria(@Param("pager") Pager pager, @Param("query") Object obj);

    @Override
    Long countCriteria(@Param("query") Object obj);
}
