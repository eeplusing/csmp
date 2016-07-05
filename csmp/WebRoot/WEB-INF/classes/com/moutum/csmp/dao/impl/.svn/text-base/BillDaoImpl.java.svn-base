package com.moutum.csmp.dao.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.moutum.csmp.base.DaoSupportImpl;
import com.moutum.csmp.dao.BillDao;
import com.moutum.csmp.domain.Bill;

/************************************************************************************
 * @Title        : BillDaoImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午6:01:09
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Repository
public class BillDaoImpl extends DaoSupportImpl<Bill> implements BillDao
{

	/**
	 * 通过入库单单据编号查询此单号是否存在
	 */
	@Override
	public Bill getBillByNo(String billNo)
	{
		Bill bill = (Bill) sessionFactory.getCurrentSession()
                .createQuery("FROM Bill b WHERE b.billNo=? AND b.billType=0")
                .setParameter(0, billNo).list().get(0);
					
        return bill;
	}
	
	/**
	 * 查询当前最大的入库单单据编号
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Bill getMaxBillNo()
	{
		Date d = new Date();  
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
		String dateNowStr = sdf.format(d);  
	
		List<Bill> bill = sessionFactory.getCurrentSession()
                .createQuery("FROM Bill b WHERE b.billNo=(SELECT MAX(billNo) FROM Bill WHERE createTime"+
		                " between to_date('"+dateNowStr+" 00:00:00','yyyy-mm-dd hh24:mi:ss')"+
		                "AND to_date('"+dateNowStr+" 23:59:59','yyyy-mm-dd hh24:mi:ss') AND billType=0)").list();
		if(bill.size()>0)
		{
			return bill.get(0);
		}
					
        return null;
	}

	/**
	 * 获取入库单信息
	 */
	@SuppressWarnings("unchecked")
    @Override
	public List<Bill> getBillList()
	{
		String hql = "FROM Bill WHERE billType=0";              
        Query query = sessionFactory.getCurrentSession().createQuery(hql);

        List<Bill> bill = query.list();
        return bill;
	}

	/**
	 * 出入库单确认更新出入库单信息
	 */
	@Override
	public void updateBill(Map<String, Object> map)
	{
		Date d = new Date();  
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		String dateNowStr = sdf.format(d);  
		
		sessionFactory.getCurrentSession()
          .createQuery("UPDATE Bill SET perator='"+map.get("perator").toString()+
             "',operTime=to_date('"+dateNowStr+"','yyyy-mm-dd hh24:mi:ss'),billStat=1"
     		 +" WHERE billId="+Integer.parseInt(map.get("billId").toString())).executeUpdate();		
	}

	/**
	 * 出库单信息
	 */
    @SuppressWarnings("unchecked")
    @Override
    public List<Bill> getOutBillList()
    {
        
        String hql = "FROM Bill WHERE billType=1";              
        Query query = sessionFactory.getCurrentSession().createQuery(hql);

        List<Bill> bill = query.list();
        
        return bill;
    }

    /**
     * 根据出库单id查询出库单信息
     */
    @Override
    public Bill outBillByNo(String billNos)
    {
        Bill bill = (Bill) sessionFactory.getCurrentSession()
                .createQuery("FROM Bill b WHERE b.billNo=? AND b.billType=1")
                .setParameter(0, billNos).list().get(0);
        
        return bill;
    }

    /**
     * 查询当前最大的出库单单据编号
     */
    @SuppressWarnings("unchecked")
    @Override
    public Bill getOutMaxBillNo()
    {
        Date d = new Date();  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
        String dateNowStr = sdf.format(d);  
    
        List<Bill> bill = sessionFactory.getCurrentSession()
                .createQuery("FROM Bill b WHERE b.billNo=(SELECT MAX(billNo) FROM Bill WHERE createTime"+
                        " between to_date('"+dateNowStr+" 00:00:00','yyyy-mm-dd hh24:mi:ss')"+
                        "AND to_date('"+dateNowStr+" 23:59:59','yyyy-mm-dd hh24:mi:ss') AND billType=1)").list();
        if(bill.size()>0)
        {
            return bill.get(0);
        }
                    
        return null;
      
    }

}

