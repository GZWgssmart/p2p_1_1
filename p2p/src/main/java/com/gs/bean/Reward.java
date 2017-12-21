package com.gs.bean;

import java.math.BigDecimal;
import java.util.Date;

public class Reward {
    private Long rwid;

    private Long uid;

    private BigDecimal tmoney;

    private BigDecimal money;

    private Long state;

    private Date date;

    public Long getRwid() {
        return rwid;
    }

    public void setRwid(Long rwid) {
        this.rwid = rwid;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public BigDecimal getTmoney() {
        return tmoney;
    }

    public void setTmoney(BigDecimal tmoney) {
        this.tmoney = tmoney;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Long getState() {
        return state;
    }

    public void setState(Long state) {
        this.state = state;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}