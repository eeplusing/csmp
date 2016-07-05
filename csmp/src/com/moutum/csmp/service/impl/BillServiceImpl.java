package com.moutum.csmp.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.Bill;
import com.moutum.csmp.service.BillService;
import com.moutum.csmp.util.QueryHelper;

/************************************************************************************
 * @Title        : BillServiceImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午6:02:58
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Service @Transactional
public class BillServiceImpl extends ServiceSupportImpl<Bill> implements BillService
{

	/**
	 * 通过入库单单据编号查询此单号是否存在
	 */
	@Override
	public Bill getBillByNo(String billNo) {
		return billDao.getBillByNo(billNo);
	}

	/**
	 * 查询当前最大的入库单单据编号
	 */
	@Override
	public Bill getMaxBillNo() {
		return billDao.getMaxBillNo();
	}

	/**
	 * 获取入库单信息
	 */
	@Override
	public List<Bill> getBillList() {
		return billDao.getBillList();
	}

	/**
	 * 入库单确认更新入库单信息
	 */
	@Override
	public void updateBill(Map<String, Object> map) {
		billDao.updateBill(map); 		
	}

	/**
     * 入库单查询
     */
	@Override
	public PageBean getInStorageList(int pageNum, int pageSize, Map<String, Object> map) {
		QueryHelper queryHelper = new QueryHelper(Bill.class, "bill");
        /*
         * 通过Map生成对应的QueryHelper实例
         */
		queryHelper.addCondition("bill.billType=0");
		
        if(null != map.get("billNo") && !map.get("billNo").equals(""))
        {
            queryHelper.addCondition("bill.billNo="+map.get("billNo"));
        }

		queryHelper.addOrderProperty("bill.createTime", false);
       
        return getPageBean(pageNum, pageSize, queryHelper);
	}

	/**
	 * 出库单查询
	 */
    @Override
    public PageBean getOutStorageList(int pageNum, int pageSize, Map<String, Object> map)
    {
        QueryHelper queryHelper = new QueryHelper(Bill.class, "bill");
        
        queryHelper.addCondition("bill.billType=1");
        
        if(null != map.get("billNo") && !map.get("billNo").equals(""))
        {
            queryHelper.addCondition("bill.billNo="+map.get("billNo"));
        }

        queryHelper.addOrderProperty("bill.createTime", false);
       
        return getPageBean(pageNum, pageSize, queryHelper);
    
    }

    /**
     * 出库单信息
     */
    @Override
    public List<Bill> getOutBillList()
    {  
        return billDao.getOutBillList();
    }

    /**
     * 根据出库单id查询出库单信息
     */
    @Override
    public Bill outBillByNo(String billNos)
    {
        
        return billDao.outBillByNo(billNos);
    }

    /**
     * 查询当前最大的出库单单据编号
     */
    @Override
    public Bill getOutMaxBillNo()
    {
        
        return billDao.getOutMaxBillNo();
    }
}

