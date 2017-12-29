package com.gs.vo;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 创建类名：JkbVO
 * 创建时间：2017/12/28 15:27
 *
 * @author 温宁宁
 * @version 1.0
 */
public class JkbVO {
    private Long baid;

    private String rname;//真实姓名

    private BigDecimal money;//申请金额

    private Long bzid;//标种id

    private String bzname;//标种名称

    private Byte state;//审核状态（1表示为审核，2表示已审核）

    private Integer term;//借款期限

    private Long bdid;

    private BigDecimal nprofit;//年化收益

    private String cpname;//产品名称

    public String getCpname() {
        return cpname;
    }

    public void setCpname(String cpname) {
        this.cpname = cpname;
    }

    public Long getBaid() {
        return baid;
    }

    public void setBaid(Long baid) {
        this.baid = baid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public Long getBzid() {
        return bzid;
    }

    public void setBzid(Long bzid) {
        this.bzid = bzid;
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }

    public Integer getTerm() {
        return term;
    }

    public void setTerm(Integer term) {
        this.term = term;
    }

    public Long getBdid() {
        return bdid;
    }

    public void setBdid(Long bdid) {
        this.bdid = bdid;
    }

    public BigDecimal getNprofit() {
        return nprofit;
    }

    public void setNprofit(BigDecimal nprofit) {
        this.nprofit = nprofit;
    }

    public String getBzname() {
        return bzname;
    }

    public void setBzname(String bzname) {
        this.bzname = bzname;
    }
}
