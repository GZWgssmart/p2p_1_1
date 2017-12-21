package com.gs.bean;

import java.math.BigDecimal;
import java.util.Date;

public class BorrowApply {
    private Long baid;

    private String realname;

    private BigDecimal money;

    private Long adminid;

    private Long bzid;

    private Date audittime;

    private Long audittstate;

    private Long borrowertype;

    private Long borrowerterm;

    private Date deadline;

    public Long getBaid() {
        return baid;
    }

    public void setBaid(Long baid) {
        this.baid = baid;
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname == null ? null : realname.trim();
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Long getAdminid() {
        return adminid;
    }

    public void setAdminid(Long adminid) {
        this.adminid = adminid;
    }

    public Long getBzid() {
        return bzid;
    }

    public void setBzid(Long bzid) {
        this.bzid = bzid;
    }

    public Date getAudittime() {
        return audittime;
    }

    public void setAudittime(Date audittime) {
        this.audittime = audittime;
    }

    public Long getAudittstate() {
        return audittstate;
    }

    public void setAudittstate(Long audittstate) {
        this.audittstate = audittstate;
    }

    public Long getBorrowertype() {
        return borrowertype;
    }

    public void setBorrowertype(Long borrowertype) {
        this.borrowertype = borrowertype;
    }

    public Long getBorrowerterm() {
        return borrowerterm;
    }

    public void setBorrowerterm(Long borrowerterm) {
        this.borrowerterm = borrowerterm;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }
}