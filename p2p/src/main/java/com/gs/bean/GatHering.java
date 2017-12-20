package com.gs.bean;

import java.math.BigDecimal;
import java.util.Date;

public class GatHering {
    private Long skid;

    private Long adminid;

    private Long borrowerid;

    private BigDecimal yprincipal;

    private BigDecimal rprincipal;

    private BigDecimal yinterest;

    private BigDecimal rinterest;

    private BigDecimal ycapital;

    private BigDecimal rcapital;

    private Long periods;

    private Long sumperiods;

    private Date repaymentdate;

    private Long bdid;

    private BigDecimal faward;

    public Long getSkid() {
        return skid;
    }

    public void setSkid(Long skid) {
        this.skid = skid;
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

    public BigDecimal getYprincipal() {
        return yprincipal;
    }

    public void setYprincipal(BigDecimal yprincipal) {
        this.yprincipal = yprincipal;
    }

    public BigDecimal getRprincipal() {
        return rprincipal;
    }

    public void setRprincipal(BigDecimal rprincipal) {
        this.rprincipal = rprincipal;
    }

    public BigDecimal getYinterest() {
        return yinterest;
    }

    public void setYinterest(BigDecimal yinterest) {
        this.yinterest = yinterest;
    }

    public BigDecimal getRinterest() {
        return rinterest;
    }

    public void setRinterest(BigDecimal rinterest) {
        this.rinterest = rinterest;
    }

    public BigDecimal getYcapital() {
        return ycapital;
    }

    public void setYcapital(BigDecimal ycapital) {
        this.ycapital = ycapital;
    }

    public BigDecimal getRcapital() {
        return rcapital;
    }

    public void setRcapital(BigDecimal rcapital) {
        this.rcapital = rcapital;
    }

    public Long getPeriods() {
        return periods;
    }

    public void setPeriods(Long periods) {
        this.periods = periods;
    }

    public Long getSumperiods() {
        return sumperiods;
    }

    public void setSumperiods(Long sumperiods) {
        this.sumperiods = sumperiods;
    }

    public Date getRepaymentdate() {
        return repaymentdate;
    }

    public void setRepaymentdate(Date repaymentdate) {
        this.repaymentdate = repaymentdate;
    }

    public Long getBdid() {
        return bdid;
    }

    public void setBdid(Long bdid) {
        this.bdid = bdid;
    }

    public BigDecimal getFaward() {
        return faward;
    }

    public void setFaward(BigDecimal faward) {
        this.faward = faward;
    }
}