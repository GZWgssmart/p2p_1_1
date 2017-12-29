package com.gs.query;

import java.math.BigDecimal;

/**
 * 创建类名：JkbQuery
 * 创建时间：2017/12/28 15:22
 *
 * @author 温宁宁
 * @version 1.0
 */
public class JkbQuery {
    private Long bzid;
    private Integer term;
    private BigDecimal nprofit;
    private String cpname;

    public Long getBzid() {
        return bzid;
    }

    public void setBzid(Long bzid) {
        this.bzid = bzid;
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }

    public BigDecimal getNprofit() {
        return nprofit;
    }

    public void setNprofit(BigDecimal nprofit) {
        this.nprofit = nprofit;
    }

    public String getCpname() {
        return cpname;
    }

    public void setCpname(String cpname) {
        this.cpname = cpname;
    }
}
