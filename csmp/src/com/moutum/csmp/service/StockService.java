package com.moutum.csmp.service;

import java.util.List;
import java.util.Map;

import com.moutum.csmp.domain.Stock;

/************************************************************************************
 * @Title        : StockService.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:22:45
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface StockService extends ServiceSupport<Stock>
{


    /**
     * 根据库存编号修改库存信息的库存量
     * @param amount 
     * @param storageId
     */
    void updateAmount(Double amount, int storageId);


	/**
	 * 通过storageId和goodId去查询库存中有没有该商品
	 */
	Stock getStock(Map<String, Object> map);
	
	/**
	 * 入库确认更新库存
	 */
	public void updateStock(Map<String, Object> map);
	
	/**
	 * 获取导出库存信息
	 */
	List<Stock> getExportStock(Map<String, Object> map);
	
	/**
	 * 查询商品当前库存
	 * @param goodId 
	 * */
	double getAmount(int gid);
}

