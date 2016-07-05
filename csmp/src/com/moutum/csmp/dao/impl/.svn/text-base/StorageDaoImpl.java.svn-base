package com.moutum.csmp.dao.impl;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.moutum.csmp.base.DaoSupportImpl;
import com.moutum.csmp.dao.StorageDao;
import com.moutum.csmp.domain.Storage;
/************************************************************************************
 * @Title        : StorageDaoImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:17:32
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Repository
public class StorageDaoImpl extends DaoSupportImpl<Storage> implements StorageDao
{

	/**
	 * 获取仓库信息
	 */
	@Override
	public List<Storage> getStorageList() {
		String hql = "FROM Storage st WHERE st.storageStat=1";              
        Query query = sessionFactory.getCurrentSession().createQuery(hql);

        @SuppressWarnings("unchecked")
        List<Storage> storage = query.list();
        return storage;
	}

	  /**
     * 查询商品状态为未删除的商品
     */
    @Override
    public List<Storage> findUnDel()
    {
        String hql = "FROM Storage s";
        hql += " WHERE s.storageStat = 1";
        Query query = sessionFactory.getCurrentSession().createQuery(hql);
        @SuppressWarnings("unchecked")
        List<Storage> stores = query.list();
        return stores;
    }
	
	/**
	 * 确认更新仓库信息
	 */
	@Override
	public void updateStorage(Map<String, Object> map) {
		//更新当前库容
		sessionFactory.getCurrentSession()
          .createQuery("UPDATE Storage SET stockAmount=stockAmount+"+Double.parseDouble(map.get("amount").toString())+
       		 " WHERE storageId="+Integer.parseInt(map.get("storageId").toString())).executeUpdate();
	}
}

