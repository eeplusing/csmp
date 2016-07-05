package com.moutum.csmp.domain;
/************************************************************************************
 * @Title        : DataStat.java
 * @Description :  数据统计
 * @Author       : BianWeiqing
 * @DateTime     : 2015年7月17日 上午10:23:10
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class DataStat
{
    /**
     * 统计ID
     */
    private int id;
    
    /**
     * 系统访问量
     */
    private int browseTimes;

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public int getBrowseTimes()
    {
        return browseTimes;
    }

    public void setBrowseTimes(int browseTimes)
    {
        this.browseTimes = browseTimes;
    }
}