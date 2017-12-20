package com.gs.bean;

public class Admin {
    private Long id;

    private String username;

    private String password;

    private Integer enable;

    private String telphone;

    private String qq;

    private String email;

    private Integer sex;

    private String paymentcode;

    private Long loanuserid;

    private Long tid;

    private Long recommendcode;

    private Long isvip;

    private String img;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getEnable() {
        return enable;
    }

    public void setEnable(Integer enable) {
        this.enable = enable;
    }

    public String getTelphone() {
        return telphone;
    }

    public void setTelphone(String telphone) {
        this.telphone = telphone == null ? null : telphone.trim();
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getPaymentcode() {
        return paymentcode;
    }

    public void setPaymentcode(String paymentcode) {
        this.paymentcode = paymentcode == null ? null : paymentcode.trim();
    }

    public Long getLoanuserid() {
        return loanuserid;
    }

    public void setLoanuserid(Long loanuserid) {
        this.loanuserid = loanuserid;
    }

    public Long getTid() {
        return tid;
    }

    public void setTid(Long tid) {
        this.tid = tid;
    }

    public Long getRecommendcode() {
        return recommendcode;
    }

    public void setRecommendcode(Long recommendcode) {
        this.recommendcode = recommendcode;
    }

    public Long getIsvip() {
        return isvip;
    }

    public void setIsvip(Long isvip) {
        this.isvip = isvip;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }
}