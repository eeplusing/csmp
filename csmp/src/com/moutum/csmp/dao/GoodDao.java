package com.moutum.csmp.dao;

import java.util.List;
import java.util.Map;

import com.moutum.csmp.base.DaoSupport;
import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.Good;

/************************************************************************************
 * @Title        : GoodDao.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:01:49
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface GoodDao extends DaoSupport<Good>
{
    /**
     * 查询商品
     */
    List<Good> getByMap(Map<String, Object> map);
    
    /**
     * 查询商品状态为未删除的商品
     */
    List<Good> findUnDel();
    
    /**
     * 查询热销商品
     */
    List<Good> findHot(int typeId, int amount);
    
    /**
     * 按名称查询商品
     */
   // List<Good> getByName(Map<String, Object> map);

    /**
     * 上下架持久化操作
     */
    void modifyRack(Integer[] ids, int stat);
   
    /**
     * 设置热销商品
     */
    void setHot(Integer[] ids, int hotGood);


    /**
     * 商品浏览详情
     */
    Good getGoodById(Map<String, Object> map);

    /**
     * 获取商品信息
     */
    List<Good> getGoodList();

	PageBean getPageBean(int pageNum, int pageSize, Map<String, Object> map);
	
	/**
     * 通过一二级分类查询
     */
    List<Good> getGoodForTypeId(int typeId1, int typeId2);
}

