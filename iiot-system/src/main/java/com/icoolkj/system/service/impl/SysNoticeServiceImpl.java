package com.icoolkj.system.service.impl;

import java.util.List;

import com.icoolkj.common.utils.uuid.IdWorker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.icoolkj.system.domain.SysNotice;
import com.icoolkj.system.mapper.SysNoticeMapper;
import com.icoolkj.system.service.ISysNoticeService;

/**
 * 公告 服务层实现
 * 
 * @author:haiwei.yu01
 */
@Service
public class SysNoticeServiceImpl implements ISysNoticeService
{
    @Autowired
    private SysNoticeMapper noticeMapper;

    /**
     * 查询通知信息
     * 
     * @param noticeId 公告ID
     * @return 通知信息
     */
    @Override
    public SysNotice selectNoticeById(String noticeId)
    {
        return noticeMapper.selectNoticeById(noticeId);
    }

    /**
     * 查询公告列表
     * 
     * @param notice 通知信息
     * @return 公告集合
     */
    @Override
    public List<SysNotice> selectNoticeList(SysNotice notice)
    {
        return noticeMapper.selectNoticeList(notice);
    }

    /**
     * 新增公告
     * 
     * @param notice 通知信息
     * @return 结果
     */
    @Override
    public int insertNotice(SysNotice notice)
    {
        notice.setNoticeId(IdWorker.nextId().toString());
        return noticeMapper.insertNotice(notice);
    }

    /**
     * 修改公告
     * 
     * @param notice 通知信息
     * @return 结果
     */
    @Override
    public int updateNotice(SysNotice notice)
    {
        return noticeMapper.updateNotice(notice);
    }

    /**
     * 删除公告对象
     * 
     * @param noticeId 公告ID
     * @return 结果
     */
    @Override
    public int deleteNoticeById(String noticeId)
    {
        return noticeMapper.deleteNoticeById(noticeId);
    }

    /**
     * 批量删除通知信息
     * 
     * @param noticeIds 需要删除的公告ID
     * @return 结果
     */
    @Override
    public int deleteNoticeByIds(String[] noticeIds)
    {
        return noticeMapper.deleteNoticeByIds(noticeIds);
    }
}
