package com.moutum.csmp.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.moutum.csmp.base.DaoSupportImpl;
import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.dao.GoodDao;
import com.moutum.csmp.domain.Good;
import com.moutum.csmp.domain.User;

/************************************************************************************
 * @Title        : GoodDaoImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:02:22
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Repository 
public class GoodDaoImpl extends DaoSupportImpl<Good> implements GoodDao
{


        @SuppressWarnings("unchecked")
        @Override
        public List<Good> getByMap(Map<String, Object> map)
        {
            String hql = "FROM Good g";
            Map<Integer, Object> valueMap = new HashMap<Integer, Object>();
            int index = 0; 
            if(null != map.get("goodStat"))
            {
                hql += " WHERE g.goodStat = ?";
                valueMap.put(index++, map.get("goodStat"));
            }
            
            Query query = sessionFactory.getCurrentSession().createQuery(hql);
            
            for(Integer idx : valueMap.keySet())
            {
                query.setParameter(idx, valueMap.get(idx));
            }
            List<Good> goods = query.list();
            
            return goods;
        }

        /**
         * 查询商品状态为未删除的商品
         */
        @Override
        public List<Good> findUnDel()
        {
            String hql = "FROM Good g";
            Map<Integer, Object> valueMap = new HashMap<Integer, Object>();
            hql += " WHERE g.goodStat >= ? AND g.goodStat <= ?";
            valueMap.put(0, 0);//状态为0：已下架商品
            valueMap.put(1, 1);//状态为1：已上架商品
            Query query = sessionFactory.getCurrentSession().createQuery(hql);
            for(Integer idx : valueMap.keySet())
            {
                query.setParameter(idx, valueMap.get(idx));
            }
            @SuppressWarnings("unchecked")
            List<Good> goods = query.list();
            return goods;
        }
        
        /**
         * 查询热卖商品
         * */
        @Override
        public List<Good> findHot(int typeId, int amount)
        {
            String hql = "FROM Good g WHERE g.goodHot = 1 AND (g.type.typeId = ? OR g.type.parentId = ?)" + "ORDER BY g.goodId DESC";
            Query query = sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, typeId).setParameter(1, typeId);
            query.setMaxResults(amount);
            @SuppressWarnings("unchecked")
            List<Good> goods = query.list();
            return goods;
        }

        @Override
        public void modifyRack(Integer[] ids, int stat)
        {
            String hql = "UPDATE Good g SET g.goodStat = ?";
            if(stat == 0 || (stat == 1))
            {
                if(stat == 0)
                {
                    hql += ", g.downRackTime = ?" ;
                }
                else if(stat == 1)
                {
                    hql += ", g.upRackTime = ?" ;
                }
                hql += " WHERE g.goodId IN (:ids)";
                sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, stat)
                .setParameter(1, new Date()).setParameterList("ids", ids).executeUpdate();
            }
            if(stat == 2)
            {
                hql += " WHERE g.goodId IN (:ids)";
                sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, stat).setParameterList("ids", ids).executeUpdate();
            }
        }
        
        /**
         * 将商品设为热销商品
         * */
        @Override
        public void setHot(Integer[] ids, int hotGood)
        {            
            String hql = "UPDATE Good g SET g.goodHot = ? WHERE g.goodId IN (:ids)"; 
            sessionFactory.getCurrentSession().createQuery(hql).setParameter(0, hotGood).setParameterList("ids", ids).executeUpdate();
        }

        /**
         * 商品浏览详情
         */
		@Override
		public Good getGoodById(Map<String, Object> map)
		{
			Good goods = (Good) sessionFactory.getCurrentSession()
                    .createQuery("FROM Good g WHERE g.goodId=?")
                    .setParameter(0, Integer.parseInt(map.get("goodId").toString())).list().get(0);
            return goods;
		}


		/**
		 * 入库获取商品信息
		 */
		@SuppressWarnings("unchecked")
		@Override
		public List<Good> getGoodList()
		{
			String hql = "FROM Good g WHERE g.goodStat<>2";              
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);

	        List<Good> good = query.list();
	        
	        return good;
		}
		@SuppressWarnings("unchecked")
		@Override
		public PageBean getPageBean(int pageNum, int pageSize, Map<String, Object> map)
		{
			int keyIndex = 0;
			Map<Integer, Object> valueMap = new HashMap<Integer, Object>();
			String hql = "FROM Good g WHERE 1 = 1 AND g.goodStat=1";
			String chql = "SELECT COUNT(g) FROM Good g WHERE 1 = 1 AND g.goodStat=1";
			if(null != map.get("loginUser") && ((User)map.get("loginUser")).getGrade().getGradeNum() != 0)
			{
				hql = "SELECT g FROM Good g, User u, Price p WHERE g.goodId = p.good.goodId AND p.grade.gradeId = u.grade.gradeId AND g.goodStat=1 AND u.userId = ?";
	    		chql = "SELECT COUNT(g) FROM Good g, User u, Price p WHERE g.goodId = p.good.goodId AND p.grade.gradeId = u.grade.gradeId AND g.goodStat=1 AND u.userId = ?";
	    		valueMap.put(keyIndex++, ((User)map.get("loginUser")).getUserId());
			}
			else 
			{
				hql = "SELECT g FROM Good g, Price p WHERE g.goodId = p.good.goodId AND p.grade.gradeNum = 3 AND g.goodStat=1";
	    		chql = "SELECT COUNT(g) FROM Good g, Price p WHERE g.goodId = p.good.goodId AND p.grade.gradeNum = 3 AND g.goodStat=1";
			}
			//商品名称
			if(null != map.get("goodName") && !map.get("goodName").equals(""))
			{
				hql += " AND g.goodName like ?";
	    		chql += " AND g.goodName like ?";
	    		valueMap.put(keyIndex++, "%" + map.get("goodName") + "%");
			}
			//行业属性
			if(null != map.get("busyName") && !map.get("busyName").equals(""))
			{
				hql += " AND g.busyType = ?";
	    		chql += " AND g.busyType = ?";
	    		valueMap.put(keyIndex++, Integer.parseInt(map.get("busyName").toString()));
			}
			
			//商品种类，当选择子类时，父类选择将无效
			if(null != map.get("typeId") && !map.get("typeId").equals(""))
	    	{
				hql += " AND g.type.typeId = ?";
	    		chql += " AND g.type.typeId = ?";
	    		valueMap.put(keyIndex++, Integer.parseInt(map.get("typeId").toString()));
	    	}
			else if(null != map.get("ptypeId") && !map.get("ptypeId").equals(""))//当子类未选择时，父类选择有效
			{
			    
			    hql += " AND g.type.parentId = ?";
                chql += " AND g.type.parentId = ?";
                valueMap.put(keyIndex++, Integer.parseInt(map.get("ptypeId").toString()));
			}
			//热值
			if(null != map.get("minCalorificValue") && !map.get("minCalorificValue").equals(""))
			{
				hql += " AND g.calorificValue >= ? AND g.calorificValue <= ?";
	    		chql += " AND g.calorificValue >= ? AND g.calorificValue <= ?";
	    		valueMap.put(keyIndex++, map.get("minCalorificValue"));
	    		valueMap.put(keyIndex++, map.get("maxCalorificValue"));
			}
			//价格
			if(null != map.get("minPrice") && !map.get("minPrice").equals(""))
	    	{
				hql += " AND p.price >= ? AND p.price <= ?";
	    		chql += " AND p.price >= ? AND p.price <= ?";
	    		valueMap.put(keyIndex++, map.get("minPrice"));
	    		valueMap.put(keyIndex++, map.get("maxPrice"));
	    	}
			
			hql += " order by g.type.parentId asc,g.goodId desc";
			chql += " order by g.type.parentId asc,g.goodId desc";
			
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			Query cquery = sessionFactory.getCurrentSession().createQuery(chql);
			for(Integer index : valueMap.keySet())
			{
				query.setParameter(index, valueMap.get(index));
				cquery.setParameter(index, valueMap.get(index));
			}
			query.setFirstResult((pageNum - 1)*pageSize);
			query.setMaxResults(pageSize);
			int count = Integer.parseInt((Long)(cquery.list().get(0)) + "");
			List<Good> list = query.list();
			return new PageBean(pageNum, pageSize, count, list);
		}

		/**
	     * 通过一二级分类查询
	     */
		@SuppressWarnings("unchecked")
		@Override
		public List<Good> getGoodForTypeId(int typeId1, int typeId2) {
			
			String hql = "FROM Good g WHERE g.goodStat<>2 AND g.type.parentId="+typeId1+" AND g.type.typeId="+typeId2;              
	        Query query = sessionFactory.getCurrentSession().createQuery(hql);

	        List<Good> good = query.list();
	        
	        return good;
		}

}

