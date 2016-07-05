package com.moutum.csmp.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.moutum.csmp.base.DaoSupportImpl;
import com.moutum.csmp.dao.TypeDao;
import com.moutum.csmp.domain.Type;

/************************************************************************************
 * @Title        : TypeDaoImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:07:05
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Repository
public class TypeDaoImpl extends DaoSupportImpl<Type> implements TypeDao
{

    @SuppressWarnings("unchecked")
    @Override
    public List<Type> getType(Map<String, Object> map) throws Exception
    {
        String hql = "FROM Type t";
        
        Map<Integer, Object> valueMap = new HashMap<Integer, Object>();
        int index = 0;
        
        if(null != map.get("name"))
        {
            if(hql.indexOf("WHERE") > 0)
            {
                hql += " AND t.typeName = ?";
            }
            else
            {
                hql += " WHERE t.typeName = ?";
            }
            valueMap.put(index++, map.get("name"));
        }
        
        if(null != map.get("id"))
        {
            if(hql.indexOf("WHERE") > 0)
            {
                hql += " AND t.typeId != ?";
            }
            else
            {
                hql += " WHERE t.typeId != ?";
            }
            valueMap.put(index++, map.get("id"));
        }
        
        if(null != map.get("grade"))
        {
            if(hql.indexOf("WHERE") > 0)
            {
                hql += " AND t.typeGrade = ?";
            }
            else
            {
                hql += " WHERE t.typeGrade = ?";
            }
            valueMap.put(index++, map.get("grade"));
        }
        
        if(null != map.get("pid"))
        {
            if(hql.indexOf("WHERE") > 0)
            {
                hql += " AND t.parentId = ?";
            }
            else
            {
                hql += " WHERE t.parentId = ?";
            }
            valueMap.put(index++, map.get("pid"));
        }
        
        try
        {
            Query query = sessionFactory.getCurrentSession().createQuery(hql);
            for(Integer i : valueMap.keySet())
            {
                query.setParameter(i, valueMap.get(i));
            }
            return query.list();
        }
        catch (Exception e)
        {
            throw new Exception(e);
        }
    }

    /**
     * 查询一类
     */
	@SuppressWarnings("unchecked")
	@Override
	public List<Type> getTypeOne()
	{
		String hql = "FROM Type t WHERE t.typeGrade=1";              
        Query query = sessionFactory.getCurrentSession().createQuery(hql);

        List<Type> type = query.list();
        
        return type;
	}

	/**
	 * 查询二类
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Type> getTypeTwo(int typeId)
	{
		String hql = "FROM Type t WHERE t.typeGrade=2 AND t.parentId="+typeId;              
        Query query = sessionFactory.getCurrentSession().createQuery(hql);

        List<Type> type = query.list();
        
        return type;
	}
}