package com.moutum.csmp.dao.impl;

import org.springframework.stereotype.Repository;
import com.moutum.csmp.base.DaoSupportImpl;
import com.moutum.csmp.dao.ImageDao;
import com.moutum.csmp.domain.Image;

/************************************************************************************
 * @Title        : ImageDaoImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:13:21
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Repository
public class ImageDaoImpl extends DaoSupportImpl<Image> implements ImageDao
{

    @Override
    public void setToNormal(Integer[] mids)
    {
        sessionFactory.getCurrentSession()
                      .createQuery("UPDATE Image i SET i.isDefault = 0 WHERE i.imageId IN (:mids)")
                      .setParameterList("mids", mids).executeUpdate();
    }
}