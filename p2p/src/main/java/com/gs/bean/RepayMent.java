package com.gs.bean;

import java.math.BigDecimal;
import java.util.Date;

public class RepayMent {
    private Long hkid;

    private Long adminid;

    private String realname;

    private String productname;

    private String bzname;

    private BigDecimal yprincipal;

    private BigDecimal rprincipal;

    private BigDecimal yinterest;

    private BigDecimal rinterest;

    private BigDecimal ycapital;

    private BigDecimal rcapital;

    private BigDecimal yinterestpenalty;

    private BigDecimal rinterestpenalty;

    private Long periods;

    private Long sumperiods;

    private Date repaymentdate;

    private Date actualrepaydate;

    private Long overdue;

    private Long bdid;

    private Long repaymentstate;

    private Date overduetime;

    private Long huid;

    public Long getHkid() {
        return hkid;
    }

    public void setHkid(Long hkid) {
        this.hkid = hkid;
    }

    public Long getAdminid() {
        return adminid;
    }

    public void setAdminid(Long adminid) {
        this.adminid = adminid;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname == null ? null : realname.trim();
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname == null ? null : productname.trim();
    }

    public String getBzname() {
        return bzname;
    }

    public void setBzname(String bzname) {
        this.bzname = bzname == null ? null : bzname.trim();
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

    public BigDecimal getYinterestpenalty() {
        return yinterestpenalty;
    }

    public void setYinterestpenalty(BigDecimal yinterestpenalty) {
        this.yinterestpenalty = yinterestpenalty;
    }

    public BigDecimal getRinterestpenalty() {
        return rinterestpenalty;
    }

    public void setRinterestpenalty(BigDecimal rinterestpenalty) {
        this.rinterestpenalty = rinterestpenalty;
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

    public Date getActualrepaydate() {
        return actualrepaydate;
    }

    public void setActualrepaydate(Date actualrepaydate) {
        this.actualrepaydate = actualrepaydate;
    }

    public Long getOverdue() {
        return overdue;
    }

    public void setOverdue(Long overdue) {
        this.overdue = overdue;
    }

    public Long getBdid() {
        return bdid;
    }

    public void setBdid(Long bdid) {
        this.bdid = bdid;
    }

    public Long getRepaymentstate() {
        return repaymentstate;
    }

    public void setRepaymentstate(Long repaymentstate) {
        this.repaymentstate = repaymentstate;
    }

    public Date getOverduetime() {
        return overduetime;
    }

    public void setOverduetime(Date overduetime) {
        this.overduetime = overduetime;
    }

    public Long getHuid() {
        return huid;
    }

    public void setHuid(Long huid) {
        this.huid = huid;
    }
}