package com.gs.dao;

import com.gs.bean.BankCard;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/12/20.
 */
@Repository
public interface BankCardDAO extends BaseDAO {
    List<BankCard> getBylistAll(Long id);
}
