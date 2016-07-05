package com.moutum.csmp.domain;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/************************************************************************************
 * @Title       : Price.java
 * @Description : 价格信息
 * @Author      : ZhaoShasha
 * @DateTime    : 2015年5月12日 上午11:37:55
 * @Copyright   : 2015 Moutum All Rights Reserved
 * @version     : V1.0
 ************************************************************************************/

public class Price implements Comparator<Price>
{

    /**
     * 编号
     */
    private int infoId;
    
    /**
     * 名称
     */
    private String priceName;

    /**
     * 价格
     */
    private Double price;

    /**
     * 等级
     */
    private Grade grade;
    
    /**
     * 所属商品
     */
    private Good good;

    public int getInfoId()
    {
        return infoId;
    }

    public void setInfoId(int infoId)
    {
        this.infoId = infoId;
    }

    public Double getPrice()
    {
        return price;
    }

    public void setPrice(Double price)
    {
        this.price = price;
    }

    public Grade getGrade()
    {
        return grade;
    }

    public void setGrade(Grade grade)
    {
        this.grade = grade;
    }

    public String getPriceName()
    {
        return priceName;
    }

    public void setPriceName(String priceName)
    {
        this.priceName = priceName;
    }
    
    public Good getGood()
    {
        return good;
    }

    public void setGood(Good good)
    {
        this.good = good;
    }

    @Override
    public int compare(Price p1, Price p2)
    {
        return (int)(p2.getPrice() - p1.getPrice());
    }
    
    public static void main(String[] args)
    {
        List<Price> ps = new ArrayList<Price>();
        Price p1 = new Price();
        p1.setInfoId(1);
        p1.setPrice(1.0);
        Price p2 = new Price();
        p2.setInfoId(2);
        p2.setPrice(8.0);
        Price p3 = new Price();
        p3.setInfoId(3);
        p3.setPrice(2.0);
        ps.add(p1);
        ps.add(p2);
        ps.add(p3);
        Collections.sort(ps, new Price());
        
        for(Price p : ps)
        {
            System.out.println(p.getInfoId() + "-" + p.getPrice());
        }
        
    }
}