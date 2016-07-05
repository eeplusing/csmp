package com.moutum.csmp.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.Evaluate;
import com.moutum.csmp.service.EvaluateService;
import com.moutum.csmp.util.QueryHelper;

/************************************************************************************
 * @Title        : EvaluateServiceImpl.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月14日 下午6:21:34
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Service @Transactional
public class EvaluateServiceImpl extends ServiceSupportImpl<Evaluate> implements EvaluateService
{

	/**
     * 根据商品id查询评论信息
     */
	@Override
	public PageBean getEvaluateById(int pageNum, int pageSize, int goodId)
	{
		QueryHelper queryHelper = new QueryHelper(Evaluate.class, "evaluate");
        /*
         * 通过Map生成对应的QueryHelper实例
         */
  
        queryHelper.addCondition("evaluate.goodId="+goodId+" order by evaluate.evaluateTime desc");
       
        return getPageBean(pageNum, pageSize, queryHelper);
	}

}

