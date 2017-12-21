package com.gs.bean;

public class DxModel {
    private Long dxid;

    private String content;

    public Long getDxid() {
        return dxid;
    }

    public void setDxid(Long dxid) {
        this.dxid = dxid;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}