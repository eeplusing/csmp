package com.moutum.csmp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.moutum.csmp.domain.Storage;
import com.moutum.csmp.service.StorageService;

/************************************************************************************
 * @Title        : StorageServiceImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:18:38
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Service @Transactional
public class StorageServiceImpl extends ServiceSupportImpl<Storage> implements StorageService
{

	/**
	 * 获取仓库信息
	 */
	@Override
	public List<Storage> getStorageList() {
		return storageDao.getStorageList();
	}
	/**
     * 查询未被删除的仓库
     */
	@Override
	public List<Storage> findUnDel()
	{
	  return storageDao.findUnDel();
	}
	/**
	 * 入库确认更新仓库信息
	 */
	@Override
	public void updateStorage(Map<String, Object> map) {
		storageDao.updateStorage(map);
	}
}

