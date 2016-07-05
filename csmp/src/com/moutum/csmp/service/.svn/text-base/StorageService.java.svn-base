package com.moutum.csmp.service;

import java.util.List;
import java.util.Map;
import com.moutum.csmp.domain.Storage;

/************************************************************************************
 * @Title        : StorageService.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:18:25
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface StorageService extends ServiceSupport<Storage>
{

	/**
	 * 获取仓库信息
	 */
	List<Storage> getStorageList();
	
	/**
	 * 确认更新仓库信息
	 */
	public void updateStorage(Map<String, Object> map);
	
	 /**
     * 查询没有被删除的仓库；
     * @param 
     * @return
     * 0：删除；1：正常
     */
    List<Storage> findUnDel();
}

