package com.moutum.csmp.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.moutum.csmp.base.DaoSupportImpl;
import com.moutum.csmp.dao.StockDao;
import com.moutum.csmp.domain.Stock;

/************************************************************************************
 * @Title        : StockDaoImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:21:57
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Repository
public class StockDaoImpl extends DaoSupportImpl<Stock> implements StockDao
{

    /**
     * 根据库存编号修改库存信息的库存量
     */
    @Override
    public void updateAmount(Double amount ,int storageId )
    {
        
       sessionFactory.getCurrentSession()
         .createQuery("UPDATE Stock s SET s.stockAmount = ? WHERE s.storageId =?")
         .setParameter(0, amount).setParameter(1, storageId).executeUpdate();
        
    }


	/**
	 * 通过storageId和goodId去查询库存中有没有该商品
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Stock getStock(Map<String, Object> map) {
		
		List<Stock> stock = sessionFactory.getCurrentSession()
                .createQuery("FROM Stock s WHERE s.storageId="+Integer.parseInt(map.get("storageId").toString())+
                		" AND s.goodId="+Integer.parseInt(map.get("goodId").toString())).list();
		if(stock.size()>0)
		{
			return stock.get(0);
		}
					
        return null;
	}

	/**
	 * 出入库确认更新库存
	 */
	@Override
	public void updateStock(Map<String, Object> map) {
		sessionFactory.getCurrentSession()
         .createQuery("UPDATE Stock SET stockAmount=stockAmount+"+Double.parseDouble(map.get("amount").toString())+
        		 " WHERE goodId="+Integer.parseInt(map.get("goodId").toString())+" AND storageId="+
        		 Integer.parseInt(map.get("storageId").toString())).executeUpdate();
	}

	/**
	 * 获取导出库存信息
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Stock> getExportStock(Map<String, Object> map) {
		String hql = "SELECT new Stock(s.stockId,s.goodId,s.storageId,s.stockAmount) FROM Stock s,Good g WHERE 1=1 AND s.goodId=g.goodId";
        Map<Integer, Object> valueMap = new HashMap<Integer, Object>();
        int index = 0; 
        //仓库
        if(null != map.get("storageId") && !map.get("storageId").equals(""))
        {
            hql += " AND s.storageId = ?";
            valueMap.put(index++, Integer.parseInt(map.get("storageId").toString()));
        }
        //一级分类
        if(null != map.get("typeId1") && !map.get("typeId1").equals(""))
        {
            hql += " AND g.type.parentId = ?";
            valueMap.put(index++, Integer.parseInt(map.get("typeId1").toString()));
        }
        //二级分类
        if(null != map.get("typeId2") && !map.get("typeId2").equals(""))
        {
            hql += " AND g.type.typeId = ?";
            valueMap.put(index++, Integer.parseInt(map.get("typeId2").toString()));
        }
        //商品
        if(null != map.get("goodId") && !map.get("goodId").equals(""))
        {
            hql += " AND s.goodId = ?";
            valueMap.put(index++, Integer.parseInt(map.get("goodId").toString()));
        }
        
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        
        for(Integer idx : valueMap.keySet())
        {
            query.setParameter(idx, valueMap.get(idx));
        }

		List<Stock> stockList = query.list();
		return stockList;
	}

	/**
     * 查询商品当前库存
     * @param goodId 
     * */
    @SuppressWarnings("unchecked")
    @Override
    public double getAmount(int gid)
    {
        try
        {
            Query query = sessionFactory.getCurrentSession()
                    .createQuery("SELECT SUM(s.stockAmount) FROM Stock s WHERE s.goodId = ?")
                    .setParameter(0, gid);
            List<Object> list = query.list();
            if(list.size() > 0 && null != list.get(0))
            {
                return (Double)list.get(0);
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        return 0;
    }
}
