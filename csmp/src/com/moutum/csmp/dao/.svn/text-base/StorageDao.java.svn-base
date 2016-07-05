package com.moutum.csmp.dao;

import java.util.List;
import java.util.Map;

import com.moutum.csmp.base.DaoSupport;
import com.moutum.csmp.domain.Storage;

/************************************************************************************
 * @Title        : StorageDao.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:16:39
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface StorageDao extends DaoSupport<Storage>
{
   /**
    * 获取仓库信息
    */
	List<Storage> getStorageList(); 
	
	/**
	 * 入库确认更新仓库信息
	 */
	public void updateStorage(Map<String, Object> map);
	
	 /**
     * 查询仓库状态为未删除的仓库
     */
    List<Storage> findUnDel();
}

