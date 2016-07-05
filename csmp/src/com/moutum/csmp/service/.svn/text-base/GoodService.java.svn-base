package com.moutum.csmp.service;

import java.util.List;
import java.util.Map;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.Good;

/************************************************************************************
 * @Title        : GoodService.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午5:04:05
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface GoodService extends ServiceSupport<Good>
{
    /**
     * 根据名称查询商品
     * @param goodName
     * @return
     */
    List<Good> getByName(String goodName);

    /**
     * 根据状态查询商品
     * @param goodStat
     * @return
     * 0：下架；1：上架；2：删除状态
     */
    List<Good> getByMap(int goodStat);

    /**
     * 查询没有被删除的商品；
     * @param 
     * @return
     * 0：下架；1：上架；2：删除状态
     */
    List<Good> findUnDel();
    
    /**
     * 分页查询商品
     */
    PageBean joinQuery(int pageSize, int pageNum, Map<String, Object> selMap);
    
    /**
     * 查询热卖商品；
     */
    List<Good> findHot(int typeId, int amount);
    
    /**
     * 上下架操作
     * @param ids
     * @param stat
     * @return
     */
    boolean modifyRack(Integer[] ids, int stat);
    
    /**
     * 商品设为热销操作
     * @param ids
     * @return
     */
    boolean setHot(Integer[] ids, int hotGood);

    /**
     * 商品浏览查询
     */
    PageBean getGoodByName(int pageNum, int pageSize, Map<String, Object> map);
    /**
     * 商品详情查询
     */
    Good getGoodById(Map<String, Object> map);
    
    /**
     * 获取商品信息
     */
    List<Good> getGoodList();

    /**
     * 通过一二级分类查询
     */
    List<Good> getGoodForTypeId(int typeId1, int typeId2);
}

