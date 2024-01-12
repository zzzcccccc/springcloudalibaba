package com.api.commons.exception;

/**
 * @description: 异常处理枚举类
 * @author: T016071
 * @date: 2023/08/25
 * @version: v1.0
 */
public enum ExceptionEnum implements BaseErrorInfoInterface{

    // 数据操作错误定义
    SUCCESS(0, "成功!"),
    BODY_NOT_MATCH(4000,"请求参数返回空指针错误!"),
    SIGNATURE_NOT_MATCH(4001,"token错误或过期!"),
    NOT_FOUND(4004, "未找到该资源!"),
    NOT_PERMISSION(4003, "无权限!"),

    //自定义
    BIZ_ERROR(4005, "接口请求参数不符!"),

    INTERNAL_SERVER_ERROR(5000, "服务器内部错误!"),
    SERVER_BUSY(5003,"服务器正忙，请稍后再试!"),
    SQL_ERROR(5004,"数据库操作失败，请联系管理员！");



    /**
     * 错误码
     */
    private final int resultCode;

    /**
     * 错误描述
     */
    private final String resultMsg;

    ExceptionEnum(int resultCode, String resultMsg) {
        this.resultCode = resultCode;
        this.resultMsg = resultMsg;
    }

    @Override
    public int getResultCode() {
        return resultCode;
    }

    @Override
    public String getResultMsg() {
        return resultMsg;
    }
}
