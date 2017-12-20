package com.gs.bean;

import java.math.BigDecimal;
import java.util.Date;

public class InvestMent {
    private Long tzid;

    private Long adminid;

    private Long borrowerid;

    private BigDecimal investmentmoney;

    private Date investmenttime;

    private Double nprofit;

    private String productname;

    private Long bdid;

    public Long getTzid() {
        return tzid;
    }

    public void setTzid(Long tzid) {
        this.tzid = tzid;
    }

    public Long getAdminid() {
        return adminid;
    }

    public void setAdminid(Long adminid) {
        this.adminid = adminid;
    }

    public Long getBorrowerid() {
        return borrowerid;
    }

    public void setBorrowerid(Long borrowerid) {
        this.borrowerid = borrowerid;
    }

    public BigDecimal getInvestmentmoney() {
        return investmentmoney;
    }

    public void setInvestmentmoney(BigDecimal investmentmoney) {
        this.investmentmoney = investmentmoney;
    }

    public Date getInvestmenttime() {
        return investmenttime;
    }

    public void setInvestmenttime(Date investmenttime) {
        this.investmenttime = investmenttime;
    }

    public Double getNprofit() {
        return nprofit;
    }

    public void setNprofit(Double nprofit) {
        this.nprofit = nprofit;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname == null ? null : productname.trim();
    }

    public Long getBdid() {
        return bdid;
    }

    public void setBdid(Long bdid) {
        this.bdid = bdid;
    }
}