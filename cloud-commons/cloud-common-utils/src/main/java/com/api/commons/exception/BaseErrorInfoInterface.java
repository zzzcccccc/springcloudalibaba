package com.api.commons.exception;

/**
 * @description: 服务接口类
 * @author: T016071
 * @date: 2023/08/25
 */
public interface BaseErrorInfoInterface {

    /**
     * 错误码
     *
     * @return
     */
    int getResultCode();

    /**
     * 错误描述
     * @return
     */
    String getResultMsg();
}
