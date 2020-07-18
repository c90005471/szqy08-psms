package com.aaa;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.aaa.dao")
/**
 * @create by: Teacher陈
 * @description: 主启动类
 * @create time: 2020/7/18 15:28
 */
public class Szqy08PsmsApplication {

    public static void main(String[] args) {
        SpringApplication.run(Szqy08PsmsApplication.class, args);
    }

}
