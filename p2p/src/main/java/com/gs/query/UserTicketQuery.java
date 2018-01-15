package com.gs.query;

import java.math.BigDecimal;
import java.util.Date;

/**
 * Created by Administrator on 2018/1/1.
 */
public class UserTicketQuery {

    private Date tktime;
    private String uname;
    private String phone;
    private Integer type;
    private BigDecimal tkmoney;
    private Date yxtime;

    public Date getTktime() {
        return tktime;
    }

    public void setTktime(Date tktime) {
        this.tktime = tktime;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public BigDecimal getTkmoney() {
        return tkmoney;
    }

    public void setTkmoney(BigDecimal tkmoney) {
        this.tkmoney = tkmoney;
    }

    public Date getYxtime() {
        return yxtime;
    }

    public void setYxtime(Date yxtime) {
        this.yxtime = yxtime;
    }
}
