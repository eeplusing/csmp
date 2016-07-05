package com.moutum.csmp.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.domain.DataStat;
import com.moutum.csmp.service.DataStatService;

/************************************************************************************
 * @Title        : DataStatServiceImpl.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年7月17日 上午10:59:43
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Service @Transactional
public class DataStatServiceImpl extends ServiceSupportImpl<DataStat> implements DataStatService
{
    @Override
    public void modifyStat() throws Exception
    {
        try
        {
            List<DataStat> list = dataStatDao.findAll();
            //如果存在数据则对原数据进行更新
            if(null != list && list.size() > 0)
            {
                DataStat dataStat = list.get(0);
                dataStat.setBrowseTimes(dataStat.getBrowseTimes() + 1);
                dataStatDao.update(dataStat);
            }
            else//如果数据不存在，则新增一条数据，并将浏览总数初始化为1
            {
                DataStat dataStat = new DataStat();
                dataStat.setBrowseTimes(1);
                dataStatDao.save(dataStat); 
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
            throw new Exception(e);
        }
    }

}

