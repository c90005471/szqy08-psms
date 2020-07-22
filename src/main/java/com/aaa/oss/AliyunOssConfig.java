package com.aaa.oss;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClient;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

/**
 * @author ：Teacher陈
 * @date ：Created in 2020/7/22 20:35
 * @description：阿里云的oss配置类
 * @modified By：
 * @version: 1.0
 */
@Configuration
@PropertySource(value = {"classpath:application.properties"})
@ConfigurationProperties(prefix = "aliyun")
@Data
public class AliyunOssConfig {
    private String endpoint;
    private String accessKeyId;
    private String accessKeySecret;
    private String bucketName;
    private String urlPrefix;

    @Bean
    public OSS oSSClient() {
        return new OSSClient(endpoint, accessKeyId, accessKeySecret);
    }
}
