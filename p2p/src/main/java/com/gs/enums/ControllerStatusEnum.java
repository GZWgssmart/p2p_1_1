package com.gs.enums;

/**
 * Created by Administrator on 2017/11/23.
 */
public enum ControllerStatusEnum {

    USER_LOGIN_SUCCESS(100, "ok", "登录成功"),
    USER_LOGIN_ERROR_CODE(101, "error", "验证码错误"),
    USER_LOGIN_FAIL(102, "error", "用户名或密码错误"),
	USER_SAVE_SUCCESS(104, "ok", "用户注册成功"),
	USER_SAVE_FAIL(107, "error", "用户注册失败，稍候再试"),
    USER_ALREADY_LOGIN(103, "logined", "已登录"),
    CASH_SAVE_SUCCESS(104, "ok", "添加成功"),
    CASH_SAVE_FAIL(105, "error", "添加失败，稍候再试"),
    CASH_UPDATE_SUCCESS(106, "ok", "修改成功"),
    CASH_UPDATE_FAIL(107, "error", "修改失败，稍候再试"),
	PHONE_EXIST(110, "exist", "手机号存在"),
    PHONE_UNEXIST(111, "unexist", "手机号不存在"),
    USERCODE_EXIST(112, "exist", "推荐码存在"),
    USERCODE_UNEXIST(113, "unexist", "推荐码不存在"),
    RECOMMEND_DELETE_SUCCESS(114, "ok", "删除成功"),
    RECOMMEND_DELETE_FAIL(115, "error", "删除失败，请稍后再试"),
    USER_RECHARGE_SUCCESS(201, "ok", "充值成功"),
    USER_RECHARGE_FAIL(202, "error", "充值失败"),
    REG_PHONE_FAIL(202, "error", "充值失败"),
    JKB_SAVE_WAIT(203, "ok", "我们将在1至3个工作日(国家节假日除外)之内完成审核")
    ;

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
