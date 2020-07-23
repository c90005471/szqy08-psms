package com.aaa.controller;

import org.apache.shiro.authz.UnauthorizedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * @author ：Teacher陈
 * @date ：Created in 2020/7/23 19:39
 * @description：统一异常处理
 * @modified By：
 * @version: 1.0
 */
@ControllerAdvice
public class MyControllerAdvice {
    /**
     * @create by: Teacher陈
     * @description: 将所有的未认证异常定向到未认证页面
     * @create time: 2020/7/23 19:42
     * @return String
     */
    @ExceptionHandler(value = UnauthorizedException.class)
    public String toUnanthorPage(){
        return "unanthor";
    }
}
