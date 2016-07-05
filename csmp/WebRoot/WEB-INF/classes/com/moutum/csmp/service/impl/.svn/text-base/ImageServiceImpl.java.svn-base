package com.moutum.csmp.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.domain.Image;
import com.moutum.csmp.service.ImageService;

/************************************************************************************
 * @Title        : ImageServiceImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:15:03
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Service @Transactional
public class ImageServiceImpl extends ServiceSupportImpl<Image> implements ImageService
{

    @Override
    public void modifyDefault(Integer[] mids)
    {
        /*将商品所有图片默认字段设为0*/
        imageDao.setToNormal(mids);
    }
}