package com.icoolkj.system.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.io.Serializable;
import java.util.Date;

/**
 * 编码生成记录对象 sys_codes
 *
 * @author:haiwei.yu01
 * @date 2023-11-11
 */
public class SysCodes implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 业务编码前缀 */
    private String prefix;

    /** 增量值 */
    private Long increment;

    /** 存储编码 */
    private String code;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setPrefix(String prefix)
    {
        this.prefix = prefix;
    }

    public String getPrefix()
    {
        return prefix;
    }
    public void setIncrement(Long increment)
    {
        this.increment = increment;
    }

    public Long getIncrement()
    {
        return increment;
    }
    public void setCode(String code)
    {
        this.code = code;
    }

    public String getCode()
    {
        return code;
    }
    public Date getCreateTime()
    {
        return createTime;
    }

    public void setCreateTime(Date createTime)
    {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("prefix", getPrefix())
            .append("increment", getIncrement())
            .append("code", getCode())
            .append("createTime", getCreateTime())
            .toString();
    }
}
