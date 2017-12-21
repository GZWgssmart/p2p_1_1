package com.gs.bean;

import java.math.BigDecimal;
import java.math.BigInteger;

public class AdminMoney {
    private Long umid;
    private BigInteger uid;//”√ªßid

    private BigDecimal summoney;

    private BigDecimal kymoney;

    private BigDecimal symoney;

    private BigDecimal tzmoney;

    private BigDecimal djmoney;

    private BigDecimal dsmoney;

    private BigDecimal jlmoney;

    public Long getUmid() {
        return umid;
    }

    public void setUmid(Long umid) {
        this.umid = umid;
    }

     public BigInteger getUid() {
        return uid;
    }

     public void setUid(BigInteger uid) {
        this.uid = uid;
    }

    public BigDecimal getSummoney() {
        return summoney;
    }

    public void setSummoney(BigDecimal summoney) {
        this.summoney = summoney;
    }

    public BigDecimal getKymoney() {
        return kymoney;
    }

    public void setKymoney(BigDecimal kymoney) {
        this.kymoney = kymoney;
    }

    public BigDecimal getSymoney() {
        return symoney;
    }

    public void setSymoney(BigDecimal symoney) {
        this.symoney = symoney;
    }

    public BigDecimal getTzmoney() {
        return tzmoney;
    }

    public void setTzmoney(BigDecimal tzmoney) {
        this.tzmoney = tzmoney;
    }

    public BigDecimal getDjmoney() {
        return djmoney;
    }

    public void setDjmoney(BigDecimal djmoney) {
        this.djmoney = djmoney;
    }

    public BigDecimal getDsmoney() {
        return dsmoney;
    }

    public void setDsmoney(BigDecimal dsmoney) {
        this.dsmoney = dsmoney;
    }

    public BigDecimal getJlmoney() {
        return jlmoney;
    }

    public void setJlmoney(BigDecimal jlmoney) {
        this.jlmoney = jlmoney;
    }
}