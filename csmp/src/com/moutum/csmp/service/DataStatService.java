package com.moutum.csmp.service;

import com.moutum.csmp.domain.DataStat;

/************************************************************************************
 * @Title        : DataStatService.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年7月17日 上午10:57:21
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface DataStatService extends ServiceSupport<DataStat>
{
    public void modifyStat() throws Exception;
}