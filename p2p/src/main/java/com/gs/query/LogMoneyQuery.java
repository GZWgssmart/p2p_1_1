package com.gs.query;

import java.util.Date;

/**
 * 创建类名：LogMoneyQuery
 * 创建时间：2017/12/25 16:13
 *
 * @author 温宁宁
 * @version 1.0
 */
public class LogMoneyQuery {
    private Byte type;
    private Date date;//时间

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
