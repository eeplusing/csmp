package com.moutum.csmp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.domain.Stock;
import com.moutum.csmp.service.StockService;

/************************************************************************************
 * @Title        : StockServiceImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:23:02
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Service @Transactional
public class StockServiceImpl extends ServiceSupportImpl<Stock> implements StockService
{

    /**
     * 根据库存编号修改库存信息的库存量
     */
    @Override
    public void updateAmount( Double amount ,int storageId)
    {
        stockDao.updateAmount( amount ,storageId);
        
    }

	/**
	 * 通过storageId和goodId去查询库存中有没有该商品
	 */
	@Override
	public Stock getStock(Map<String, Object> map) {
		return stockDao.getStock(map);
	}

	/**
	 * 入库确认更新库存
	 */
	@Override
	public void updateStock(Map<String, Object> map) {
		stockDao.updateStock(map);
	}

	/**
	 * 获取导出库存信息
	 */
	@Override
	public List<Stock> getExportStock(Map<String, Object> map) {
		return stockDao.getExportStock(map);
	}

	/**
	 * 查询商品当前库存
	 * */
    @Override
    public double getAmount(int gid)
    {
        return stockDao.getAmount(gid);
    }

}

