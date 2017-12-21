package com.gs.bean;

import java.math.BigDecimal;
import java.util.Date;

//提现记录表
public class LogTx {
    private Long id;

    private Long uid;//用户id

    private BigDecimal money;//提现金额

    private Date date;//时间

    private Byte state;//状态，0提现成功，1未提现失败

    public LogTx(Long id, Long uid, String bankcard, String banktype, BigDecimal money, Date date, Byte state) {
        this.id = id;
        this.uid = uid;
        this.money = money;
        this.date = date;
        this.state = state;
    }

    public LogTx() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }
}