package com.moutum.csmp.service;

import java.util.List;
import java.util.Map;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.Idepot;
import com.moutum.csmp.domain.Storage;

/************************************************************************************
 * @Title        : IdepotService.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:40:08
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface IdepotService extends ServiceSupport<Idepot>
{
	/**
     * 入库单查询
     */
    PageBean getInStorageList(int pageNum, int pageSize, Map<String, Object> map);
    
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
     * 出库单查询
     * @param pageNum
     * @param pageSize
     * @param map
     * @return
     */
    PageBean getOutStorageList(int pageNum, int pageSize, Map<String, Object> map);

   /**
    * 根据单据id查询出库单信息 
    * @param billId
    * @return
    */
    List<Idepot> getOutByBillId(int billId);

    /**
     * 根据单据id查询仓库 
     * @param map
     * @return
     */
    List<Storage> getByMap(Map<String, Object> map);
}

