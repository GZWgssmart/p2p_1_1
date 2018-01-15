package com.gs.vo;

import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 * Created by Administrator on 2017/12/27.
 */
public class UserTicketVO {

    private Long ukid;
    private Long uid;
    private Long kid;
    private Timestamp tktime;
    private String uname;
    private String phone;
    private Integer type;
    private BigDecimal tkmoney;
    private Timestamp yxtime;

    public Long getUkid() {
        return ukid;
    }

    public void setUkid(Long ukid) {
        this.ukid = ukid;
    }

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public Long getKid() {
        return kid;
    }

    public void setKid(Long kid) {
        this.kid = kid;
    }

    public Timestamp getTktime() {
        return tktime;
    }

    public void setTktime(Timestamp tktime) {
        this.tktime = tktime;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public BigDecimal getTkmoney() {
        return tkmoney;
    }

    public void setTkmoney(BigDecimal tkmoney) {
        this.tkmoney = tkmoney;
    }

    public Timestamp getYxtime() {
        return yxtime;
    }

    public void setYxtime(Timestamp yxtime) {
        this.yxtime = yxtime;
    }
}
