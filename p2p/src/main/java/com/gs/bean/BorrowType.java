package com.gs.bean;

public class BorrowType {
    private Long lxid;

    private String lxname;

    private Long state;

    public Long getLxid() {
        return lxid;
    }

    public void setLxid(Long lxid) {
        this.lxid = lxid;
    }

    public String getLxname() {
        return lxname;
    }

    public void setLxname(String lxname) {
        this.lxname = lxname == null ? null : lxname.trim();
    }

    public Long getState() {
        return state;
    }

    public void setState(Long state) {
        this.state = state;
    }
}