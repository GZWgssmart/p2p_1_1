package com.gs.bean;

public class Sway {
    private Long sid;

    private String way;

    private String sf;

    private Long state;

    public Long getSid() {
        return sid;
    }

    public void setSid(Long sid) {
        this.sid = sid;
    }

    public String getWay() {
        return way;
    }

    public void setWay(String way) {
        this.way = way == null ? null : way.trim();
    }

    public String getSf() {
        return sf;
    }

    public void setSf(String sf) {
        this.sf = sf == null ? null : sf.trim();
    }

    public Long getState() {
        return state;
    }

    public void setState(Long state) {
        this.state = state;
    }
}