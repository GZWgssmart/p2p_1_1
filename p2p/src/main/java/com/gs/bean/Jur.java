package com.gs.bean;

public class Jur {
    private Long jid;

    private String jurl;

    private String content;

    public Long getJid() {
        return jid;
    }

    public void setJid(Long jid) {
        this.jid = jid;
    }

    public String getJurl() {
        return jurl;
    }

    public void setJurl(String jurl) {
        this.jurl = jurl == null ? null : jurl.trim();
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}