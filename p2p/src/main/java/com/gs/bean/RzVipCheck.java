package com.gs.bean;

import java.util.Date;

public class RzvipCheck {
    private Long id;

    private Long huid;

    private Long isok;

    private String excuse;

    private Date date;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
}