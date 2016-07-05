package com.moutum.csmp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.Good;
import com.moutum.csmp.service.GoodService;
import com.moutum.csmp.util.QueryHelper;

/************************************************************************************
 * @Title        : GoodServiceImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:04:24
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Service @Transactional
public class GoodServiceImpl extends ServiceSupportImpl<Good> implements GoodService
{

    @SuppressWarnings("unchecked")
    @Override
    public List<Good> getByName(String goodName)
    {
        QueryHelper queryHelper = new QueryHelper(Good.class, "g");
        if(null != goodName)
        {
            queryHelper.addCondition("g.goodName like ?",  "%" + goodName + "%");
            queryHelper.addCondition("g.goodStat != ?", 2);
        }
        queryHelper.addOrderProperty("goodId", true);
        List<Object> parameters = queryHelper.getParameters();
        Query listQuery = getSession().createQuery(queryHelper.getListQueryHql()); //查询符合条件商品
        if (parameters != null)
        { 
            for (int i = 0; i < parameters.size(); i++)
            {
                listQuery.setParameter(i, parameters.get(i));
                System.out.println(parameters.get(i));
            }
        }
        List<Good> goods = listQuery.list();
        return goods; 
    }
    @Override
    public List<Good> findUnDel()
    {
        return goodDao.findUnDel();
    }
  
    //按商品状态查询商品
    @Override
    public List<Good> getByMap(int goodStat)
    {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("goodStat", goodStat);
        return goodDao.getByMap(map);
    }
    
    //分页查询商品
    @Override
    public PageBean joinQuery(int pageSize, int pageNum, Map<String, Object> selMap)
    {
        QueryHelper queryHelper = new QueryHelper(Good.class, "g");
        int goodStat = (Integer)selMap.get("goodStat");
        if(goodStat == -1)
        {
            queryHelper.addCondition("g.goodStat != ?", 2);
        }
        else if(goodStat == 3)
        {
            queryHelper.addCondition("g.goodHot = ?", 1);
        }
        else
        {
            queryHelper.addCondition("g.goodStat = ?", goodStat);
        } 
        if(null != selMap.get("goodName"))
        {
            queryHelper.addCondition("g.goodName like ?", "%" + selMap.get("goodName") + "%");
        }
        //添加排序为倒序
        queryHelper.addOrderProperty("g.goodId", false);
        return getPageBean(pageNum, pageSize, queryHelper);
    }
    
    //查询热卖商品
    @Override
    public List<Good> findHot(int typeId, int amount)
    {
        return goodDao.findHot(typeId, amount);
    }

    @Override
    public boolean modifyRack(Integer[] ids, int stat)
    {
        try
        {
            goodDao.modifyRack(ids, stat);
            return true;
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        
        return false;
    }


    /**
     * 商品查询
     */
    @Override
	public PageBean getGoodByName(int pageNum, int pageSize, Map<String, Object> map)
	{     
        return goodDao.getPageBean(pageNum, pageSize, map);
	}

    /**
     * 商品详情查询
     */
	@Override
	public Good getGoodById(Map<String, Object> map)
	{
		return goodDao.getGoodById(map);
	}

	/**
	 * 获取商品信息
	 */
	@Override
	public List<Good> getGoodList()
	{
		return goodDao.getGoodList();
	}
	
	/**
	 * 将商品设为热销
	 * */
    @Override
    public boolean setHot(Integer[] ids, int hotGood)
    {
        try
        {
            goodDao.setHot(ids, hotGood);
            return true;
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        
        return false;
    }
    
    /**
     * 通过一二级分类查询
     */
	@Override
	public List<Good> getGoodForTypeId(int typeId1, int typeId2) {
		return goodDao.getGoodForTypeId(typeId1, typeId2);
	}
  
}

