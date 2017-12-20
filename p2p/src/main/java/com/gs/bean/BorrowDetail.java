package com.gs.bean;

import java.math.BigDecimal;

public class BorrowDetail {
    private Long bdid;

    private String cardimage;

    private String businessimage;

    private String bankaccount;

    private String mpurpose;

    private String repaymentsource;

    private String suggest;

    private String xmdescrip;

    private String guarantee;

    private BigDecimal money;

    private Double nprofit;

    private String incomeapproach;

    public Long getBdid() {
        return bdid;
    }

    public void setBdid(Long bdid) {
        this.bdid = bdid;
    }

    public String getCardimage() {
        return cardimage;
    }

    public void setCardimage(String cardimage) {
        this.cardimage = cardimage == null ? null : cardimage.trim();
    }

    public String getBusinessimage() {
        return businessimage;
    }

    public void setBusinessimage(String businessimage) {
        this.businessimage = businessimage == null ? null : businessimage.trim();
    }

    public String getBankaccount() {
        return bankaccount;
    }

    public void setBankaccount(String bankaccount) {
        this.bankaccount = bankaccount == null ? null : bankaccount.trim();
    }

    public String getMpurpose() {
        return mpurpose;
    }

    public void setMpurpose(String mpurpose) {
        this.mpurpose = mpurpose == null ? null : mpurpose.trim();
    }

    public String getRepaymentsource() {
        return repaymentsource;
    }

    public void setRepaymentsource(String repaymentsource) {
        this.repaymentsource = repaymentsource == null ? null : repaymentsource.trim();
    }

    public String getSuggest() {
        return suggest;
    }

    public void setSuggest(String suggest) {
        this.suggest = suggest == null ? null : suggest.trim();
    }

    public String getXmdescrip() {
        return xmdescrip;
    }

    public void setXmdescrip(String xmdescrip) {
        this.xmdescrip = xmdescrip == null ? null : xmdescrip.trim();
    }

    public String getGuarantee() {
        return guarantee;
    }

    public void setGuarantee(String guarantee) {
        this.guarantee = guarantee == null ? null : guarantee.trim();
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Double getNprofit() {
        return nprofit;
    }

    public void setNprofit(Double nprofit) {
        this.nprofit = nprofit;
    }

    public String getIncomeapproach() {
        return incomeapproach;
    }

    public void setIncomeapproach(String incomeapproach) {
        this.incomeapproach = incomeapproach == null ? null : incomeapproach.trim();
    }
}