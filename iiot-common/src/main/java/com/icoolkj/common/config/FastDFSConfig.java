package com.icoolkj.common.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import java.util.List;

/**
 * @author:haiwei.yu01
 * @version 1.0
 * @description FastDFSConfig
 * @createDate 2023/09/24
 */
@Configuration
@ConfigurationProperties(prefix = "fdfs")
public class FastDFSConfig {

    private String groupName;

    private boolean thumbImageEnabled;

    private List<String> supportImageTypes;

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public boolean isThumbImageEnabled() {
        return thumbImageEnabled;
    }

    public void setThumbImageEnabled(boolean thumbImageEnabled) {
        this.thumbImageEnabled = thumbImageEnabled;
    }

    public List<String> getSupportImageTypes() {
        return supportImageTypes;
    }

    public void setSupportImageTypes(List<String> supportImageTypes) {
        this.supportImageTypes = supportImageTypes;
    }
}
