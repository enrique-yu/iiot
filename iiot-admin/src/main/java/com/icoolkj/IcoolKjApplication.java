package com.icoolkj;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 * 
 * @author:haiwei.yu01
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class IcoolKjApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(IcoolKjApplication.class, args);
    }
}
