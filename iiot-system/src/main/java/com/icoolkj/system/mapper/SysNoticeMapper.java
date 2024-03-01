package com.icoolkj.system.mapper;

import java.util.List;
import com.icoolkj.system.domain.SysNotice;

/**
 * 通知公告表 数据层
 * 
 * @author icoolkj
 */
public interface SysNoticeMapper
{
    /**
     * 查询通知信息
     * 
     * @param noticeId 公告ID
     * @return 通知信息
     */
    public SysNotice selectNoticeById(String noticeId);

    /**
     * 查询公告列表
     * 
     * @param notice 通知信息
     * @return 公告集合
     */
    public List<SysNotice> selectNoticeList(SysNotice notice);

    /**
     * 新增公告
     * 
     * @param notice 通知信息
     * @return 结果
     */
    public int insertNotice(SysNotice notice);

    /**
     * 修改公告
     * 
     * @param notice 通知信息
     * @return 结果
     */
    public int updateNotice(SysNotice notice);

    /**
     * 批量删除公告
     * 
     * @param noticeId 公告ID
     * @return 结果
     */
    public int deleteNoticeById(String noticeId);

    /**
     * 批量删除通知信息
     * 
     * @param noticeIds 需要删除的公告ID
     * @return 结果
     */
    public int deleteNoticeByIds(String[] noticeIds);
}
