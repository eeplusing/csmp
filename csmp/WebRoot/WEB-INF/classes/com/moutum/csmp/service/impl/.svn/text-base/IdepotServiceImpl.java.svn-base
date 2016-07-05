package com.moutum.csmp.service.impl;

import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.Idepot;
import com.moutum.csmp.domain.Storage;
import com.moutum.csmp.service.IdepotService;
import com.moutum.csmp.util.QueryHelper;

/************************************************************************************
 * @Title        : IdepotServiceImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:40:20
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@SuppressWarnings("unchecked")
@Service @Transactional
public class IdepotServiceImpl extends ServiceSupportImpl<Idepot> implements IdepotService
{

	/**
     * 入库单查询
     */
	@Override
	public PageBean getInStorageList(int pageNum, int pageSize, Map<String, Object> map)
	{
		QueryHelper queryHelper = new QueryHelper(Idepot.class, "depot");
        /*
         * 通过Map生成对应的QueryHelper实例
         */
		queryHelper.addCondition("depot.billId="+map.get("billId"));
		
        if(null != map.get("goodId") && !map.get("goodId").equals("") && !map.get("goodId").equals("0"))
        {
            queryHelper.addCondition("depot.goodId="+Integer.parseInt(map.get("goodId").toString()));
        }
        
        queryHelper.addCondition("depot.type=0");

		queryHelper.addOrderProperty("depot.time", false);
       
        return getPageBean(pageNum, pageSize, queryHelper);
	}

	/**
     * 通过billId分组查询相同billId的入库总数量
     */
	@Override
	public List<Idepot> getSumAmountByBillId() {
		return idepotDao.getSumAmountByBillId();
	}

	/**
     * 通过billId查询所有记录
     */
	@Override
	public List<Idepot> getByBillId(int billId) {
		return idepotDao.getByBillId(billId);
	}

	/**
	 *  出库总数量
	 */
    @Override
    public List<Idepot> AmountOutByBillId()
    {
        
        return idepotDao.AmountOutByBillId();
    }

    /**
     * 出库单查询
     */
    @Override
    public PageBean getOutStorageList(int pageNum, int pageSize, Map<String, Object> map)
    {
        
        QueryHelper queryHelper = new QueryHelper(Idepot.class, "depot");
        /*
         * 通过Map生成对应的QueryHelper实例
         */
        queryHelper.addCondition("depot.billId="+map.get("billId"));
        
        if(null != map.get("goodId") && !map.get("goodId").equals(""))
        {
            queryHelper.addCondition("depot.goodId="+Integer.parseInt(map.get("goodId").toString()));
        }
        
        queryHelper.addCondition("depot.type=1");

        queryHelper.addOrderProperty("depot.time", false);
       
        return getPageBean(pageNum, pageSize, queryHelper);
    }

    /**
     * 根据单据id查询出库单信息 
     */
    @Override
    public List<Idepot> getOutByBillId(int billId)
    {
        return idepotDao.getOutByBillId(billId);
    }

	@Override
	public List<Storage> getByMap(Map<String, Object> map) 
	{
		QueryHelper queryHelper = new QueryHelper(Storage.class, "s");
		queryHelper.addCondition("storageStat = ?", 1);
		if(-1 != (Integer)map.get("storageId")){
			queryHelper.addCondition("storageId = ?", map.get("storageId"));
		}
		if(null != map.get("storageName"))
			queryHelper.addCondition("storageName like ?", "%"+map.get("storageName")+"%");
		if(null != map.get("storageAddress"))
			queryHelper.addCondition("storageAddress like ?","%"+ map.get("storageAddress")+"%");
		if(null != map.get("ower"))
			queryHelper.addCondition("ower like ?", "%"+map.get("ower")+"%");
		if(null != map.get("distributionWay"))
			queryHelper.addCondition("distributionWay like ?", "%"+map.get("distributionWay")+"%");
		if(null !=map.get("waterproofGrade"))
			queryHelper.addCondition("waterproofGrade like ?", "%"+map.get("waterproofGrade")+"%");
		queryHelper.addOrderProperty("storageId", true);
		List<Object> parameters = queryHelper.getParameters();
        Query listQuery = getSession().createQuery(queryHelper.getListQueryHql()); //查询符合条件的仓库
        if (parameters != null)
        { 
            for (int i = 0; i < parameters.size(); i++)
            {
                listQuery.setParameter(i, parameters.get(i));
                System.out.println(parameters.get(i));
            }
        }
		List<Storage> list = listQuery.list();
        return list; 
	}
 
}

