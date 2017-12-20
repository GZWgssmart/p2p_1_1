package com.gs.bean;

import java.util.Date;

public class ShBorrow {
    private Long shid;

    private Long huid;

    private Long isok;

    private String excuse;

    private Date date;

    private Long baid;

    public Long getShid() {
        return shid;
    }

    public void setShid(Long shid) {
        this.shid = shid;
    }

    public Long getHuid() {
        return huid;
    }

    public void setHuid(Long huid) {
        this.huid = huid;
    }

    public Long getIsok() {
        return isok;
    }

    public void setIsok(Long isok) {
        this.isok = isok;
    }

    public String getExcuse() {
        return excuse;
    }

    public void setExcuse(String excuse) {
        this.excuse = excuse == null ? null : excuse.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Long getBaid() {
        return baid;
    }

    public void setBaid(Long baid) {
        this.baid = baid;
    }
}