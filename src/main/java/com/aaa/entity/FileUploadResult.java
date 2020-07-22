package com.aaa.entity;

import lombok.Data;

/**
 * @author ：Teacher陈
 * @date ：Created in 2020/7/22 20:39
 * @description：上传文件返回结果
 * @modified By：
 * @version: 1.0
 */
@Data
public class FileUploadResult {
    /**文件唯一标识*/
    private String uid;
     /**文件名*/
    private String name;
     /**状态有：uploading done error removed*/
    private String status;
     /**服务端响应内容*/
    private String response;
}
