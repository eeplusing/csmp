package com.moutum.csmp.dao;

import java.util.List;

import com.moutum.csmp.base.DaoSupport;
import com.moutum.csmp.domain.Idepot;

/************************************************************************************
 * @Title        : IdepotDao.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:37:59
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface IdepotDao extends DaoSupport<Idepot>
{
	/**
     * 通过billId分组查询相同billId的入库总数量
     */
    List<Idepot> getSumAmountByBillId();
    
    /**
     * 通过billId查询所有记录
     */
    List<Idepot> getByBillId(int billId);

    /**
     * 出库总数量
     * @return
     */
    List<Idepot> AmountOutByBillId();

    /**
     * 根据单据id查询出库单信息 
     * @param billId
     * @return
     */
    List<Idepot> getOutByBillId(int billId);
}

