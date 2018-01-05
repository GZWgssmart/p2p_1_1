package com.gs.query;

/**
 * 创建类名：TzbQuery
 * 创建时间：2018/1/3 10:59
 *
 * @author 温宁宁
 * @version 1.0
 */
public class TzbQuery {
    private Long uid;
    private Byte state;
    private String startTime;
    private String endTime;
    private int curPage;

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public int getCurPage() {
        return curPage;
    }

    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }
}