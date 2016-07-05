package com.moutum.csmp.domain;
/************************************************************************************
 * @Title        : Storage.java
 * @Description  : 仓库信息
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月13日 上午11:37:52
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class Storage
{

    /**
     * 仓库编号
     */
    private int storageId;
    
    /**
     * 仓库名称
     */
    private String storageName;
    
    /**
     * 规格
     */
    private String storageSpecification;
    
    /**
     * 地址
     */
    private String storageAddress;
    
    /**
     * 所有者
     */
    private String ower;
    
    /**
     * 最大库容
     */
    private Double stockMaxAmount;
    
    /**
     * 初始库容
     */
    private Double stockIniAmount;
    
    /**
     * 当前库容
     */
    private Double stockAmount;
    
    /**
     * 配送方式
     */
    private String distributionWay;
    
    /**
     * 防水级别
     */
    private String waterproofGrade;
    
    /**
     * 地表
     */
    private String surface;
    
    /**
     * 仓库状态   1:正常  0:删除
     */
    private int storageStat;
    
    public int getStorageId()
    {
        return storageId;
    }

    public void setStorageId(int storageId)
    {
        this.storageId = storageId;
    }

    public String getStorageName()
    {
        return storageName;
    }

    public void setStorageName(String storageName)
    {
        this.storageName = storageName;
    }

    public String getStorageSpecification()
    {
        return storageSpecification;
    }

    public void setStorageSpecification(String storageSpecification)
    {
        this.storageSpecification = storageSpecification;
    }

    public String getStorageAddress()
    {
        return storageAddress;
    }

    public void setStorageAddress(String storageAddress)
    {
        this.storageAddress = storageAddress;
    }

    public String getOwer()
    {
        return ower;
    }

    public void setOwer(String ower)
    {
        this.ower = ower;
    }

    public Double getStockMaxAmount()
    {
        return stockMaxAmount;
    }

    public void setStockMaxAmount(Double stockMaxAmount)
    {
        this.stockMaxAmount = stockMaxAmount;
    }

    public Double getStockIniAmount()
    {
        return stockIniAmount;
    }

    public void setStockIniAmount(Double stockIniAmount)
    {
        this.stockIniAmount = stockIniAmount;
    }

    public Double getStockAmount()
    {
        return stockAmount;
    }

    public void setStockAmount(Double stockAmount)
    {
        this.stockAmount = stockAmount;
    }

    public String getDistributionWay()
    {
        return distributionWay;
    }

    public void setDistributionWay(String distributionWay)
    {
        this.distributionWay = distributionWay;
    }

    public String getWaterproofGrade()
    {
        return waterproofGrade;
    }

    public void setWaterproofGrade(String waterproofGrade)
    {
        this.waterproofGrade = waterproofGrade;
    }

    public String getSurface()
    {
        return surface;
    }

    public void setSurface(String surface)
    {
        this.surface = surface;
    }

    public int getStorageStat()
    {
        return storageStat;
    }

    public void setStorageStat(int storageStat)
    {
        this.storageStat = storageStat;
    }
    
    
}

