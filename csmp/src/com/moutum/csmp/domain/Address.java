package com.moutum.csmp.domain;
/************************************************************************************
 * @Title        : Address.java
 * @Description  : 配送地址信息
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月13日 上午11:20:25
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class Address
{

    /**
     * 地址编号
     */
    private int addressId;
    
    /**
     * 配送地址
     */
    private String address;
    
    /**
     * 邮编
     */
    private String postCode;
    
    /** 
     * 收货人姓名
     */
    private String consigneName;
    
    /**
     * 收货人电话
     */
    private String consignePhone;

    public int getAddressId()
    {
        return addressId;
    }

    public void setAddressId(int addressId)
    {
        this.addressId = addressId;
    }

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    public String getPostCode()
    {
        return postCode;
    }

    public void setPostCode(String postCode)
    {
        this.postCode = postCode;
    }

    public String getConsigneName()
    {
        return consigneName;
    }

    public void setConsigneName(String consigneName)
    {
        this.consigneName = consigneName;
    }

    public String getConsignePhone()
    {
        return consignePhone;
    }

    public void setConsignePhone(String consignePhone)
    {
        this.consignePhone = consignePhone;
    }
    
}

