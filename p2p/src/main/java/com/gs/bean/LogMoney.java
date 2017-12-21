package com.gs.bean;

import java.math.BigDecimal;
import java.util.Date;

public class LogMoney {
    private Long id;

    private Long adminid;

    private Long type;

    private BigDecimal inmoney;

    private BigDecimal outmoney;

    private Date date;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getAdminid() {
        return adminid;
    }

    public void setAdminid(Long adminid) {
        this.adminid = adminid;
    }

    public Long getType() {
        return type;
    }

    public void setType(Long type) {
        this.type = type;
    }

    public BigDecimal getInmoney() {
        return inmoney;
    }

    public void setInmoney(BigDecimal inmoney) {
        this.inmoney = inmoney;
    }

    public BigDecimal getOutmoney() {
        return outmoney;
    }

    public void setOutmoney(BigDecimal outmoney) {
        this.outmoney = outmoney;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}