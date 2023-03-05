package com.icoolkj.company.service.impl;

import com.icoolkj.common.constant.UserConstants;
import com.icoolkj.common.utils.DateUtils;
import com.icoolkj.common.utils.SecurityUtils;
import com.icoolkj.common.utils.StringUtils;
import com.icoolkj.common.utils.uuid.IdWorker;
import com.icoolkj.company.domain.IcCompBasic;
import com.icoolkj.company.mapper.IcCompBasicMapper;
import com.icoolkj.company.service.IIcCompBasicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 企业基本信息Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-03-05
 */
@Service
public class IcCompBasicServiceImpl implements IIcCompBasicService 
{
    @Autowired
    private IcCompBasicMapper icCompBasicMapper;

    /**
     * 查询企业基本信息
     * 
     * @param compBasicId 企业基本信息主键
     * @return 企业基本信息
     */
    @Override
    public IcCompBasic selectIcCompBasicByCompBasicId(String compBasicId)
    {
        return icCompBasicMapper.selectIcCompBasicByCompBasicId(compBasicId);
    }

    /**
     * 查询企业基本信息列表
     * 
     * @param icCompBasic 企业基本信息
     * @return 企业基本信息
     */
    @Override
    public List<IcCompBasic> selectIcCompBasicList(IcCompBasic icCompBasic)
    {
        return icCompBasicMapper.selectIcCompBasicList(icCompBasic);
    }

    /**
     * 新增企业基本信息
     * 
     * @param icCompBasic 企业基本信息
     * @return 结果
     */
    @Override
    public int insertIcCompBasic(IcCompBasic icCompBasic)
    {
        icCompBasic.setCompBasicId(IdWorker.nextId().toString());
        icCompBasic.setCreateBy(SecurityUtils.getLoginUser().getUser().getUserId()+"");
        icCompBasic.setCreateTime(DateUtils.getNowDate());
        return icCompBasicMapper.insertIcCompBasic(icCompBasic);
    }

    /**
     * 修改企业基本信息
     * 
     * @param icCompBasic 企业基本信息
     * @return 结果
     */
    @Override
    public int updateIcCompBasic(IcCompBasic icCompBasic)
    {
        icCompBasic.setUpdateBy(SecurityUtils.getLoginUser().getUser().getUserId()+"");
        icCompBasic.setUpdateTime(DateUtils.getNowDate());
        return icCompBasicMapper.updateIcCompBasic(icCompBasic);
    }

    /**
     * 校验统一社会信用代码是否唯一
     *
     * @param icCompBasic
     * @return 结果
     */
    @Override
    public boolean checkCreditCodeUnique(IcCompBasic icCompBasic)
    {
        IcCompBasic info = icCompBasicMapper.checkCreditCodeUnique(icCompBasic.getCompCreditCode());
        if (StringUtils.isNotNull(info))
        {
            //如果是修改判断ID是否存在并且一致
            String id = icCompBasic.getCompBasicId();
            if(StringUtils.isNotEmpty(id) && id.equals(info.getCompBasicId())){
                return UserConstants.UNIQUE;
            }
            return UserConstants.NOT_UNIQUE;
        }
        return UserConstants.UNIQUE;
    }

}
