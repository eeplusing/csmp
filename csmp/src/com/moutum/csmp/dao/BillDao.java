package com.moutum.csmp.dao;

import java.util.List;
import java.util.Map;

import com.moutum.csmp.base.DaoSupport;
import com.moutum.csmp.domain.Bill;

/************************************************************************************
 * @Title        : BillDao.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午6:00:39
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface BillDao extends DaoSupport<Bill>
{

	/**
	 * 通过入库单单据编号查询此单号是否存在
	 */
	Bill getBillByNo(String billNo);
	
	/**
	 * 查询当前最大的入库单单据编号
	 */
	Bill getMaxBillNo();
	
	/**
	 * 获取入库单信息
	 */
	List<Bill> getBillList();
	
	/**
	 * 入库单确认更新入库单信息
	 */
	public void updateBill(Map<String,Object> map);

	/**
	 * 出库单信息
	 * @return
	 */
    List<Bill> getOutBillList();

    /**
     * 根据出库单id查询出库单信息
     * @param billNos
     * @return
     */
    Bill outBillByNo(String billNos);

    /**
     * 查询当前最大的出库单单据编号
     * @return
     */
    Bill getOutMaxBillNo();
}

