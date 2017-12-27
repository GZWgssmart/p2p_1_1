package com.gs.enums;

/**
 * Created by Administrator on 2017/11/23.
 */
public enum ControllerStatusEnum {

    USER_LOGIN_SUCCESS(100, "ok", "登录成功"),
    USER_LOGIN_ERROR_CODE(101, "error", "验证码错误"),
    USER_LOGIN_FAIL(102, "error", "用户名或密码错误"),
    USER_ALREADY_LOGIN(103, "logined", "已登录"),
    USER_SAVE_SUCCESS(104, "ok", "用户注册成功"),
    CASH_SAVE_SUCCESS(105, "ok", "添加成功"),
    CASH_SAVE_FAIL(106, "error", "添加失败，稍候再试"),
    USER_SAVE_FAIL(107, "error", "用户注册失败，稍候再试"),
    CASH_UPDATE_SUCCESS(108, "ok", "修改成功"),
    CASH_UPDATE_FAIL(109, "error", "修改失败，稍候再试"),
    PHONE_EXIST(110, "exist", "手机号存在"),
    PHONE_UNEXIST(111, "unexist", "手机号不存在"),
    USERCODE_EXIST(112, "exist", "推荐码存在"),
    USERCODE_UNEXIST(113, "unexist", "推荐码不存在"),
    USER_RECHARGE_SUCCESS(201, "ok", "充值成功"),
    USER_RECHARGE_FAIL(202, "error", "充值失败"),
    REG_PHONE_FAIL(202, "error", "充值失败");


    private Integer code;
    private String result;
    private String message;

    ControllerStatusEnum(Integer code, String result, String message) {
        this.code = code;
        this.result = result;
        this.message = message;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
