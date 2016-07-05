package com.moutum.csmp.service;

import java.util.List;
import java.util.Map;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.Order;

/************************************************************************************
 * @Title        : OrderService.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午4:48:48
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface OrderService extends ServiceSupport<Order>
{

    /********************************************************************************
     * 通过查询条件的Map集合进行分页查询
     * @param pageNum
     * @param pageSize
     * @param selMap
     * @return
     ********************************************************************************/
    PageBean getPageBean(int pageNum, int pageSize, Map<String, Object> selMap);

    /********************************************************************************
     * 获取指定客户各个状态下的订单数量,若客户ID为空则获取所有
     * @return
     ********************************************************************************/
    Map<String, Integer> getMapForNumState(Integer userId);

    /********************************************************************************
     * 订单评价服务层方法
     * @param orderId
     * @param evaluateInfo
     * @param userName
     * @return
     ********************************************************************************/
    boolean saveEvaluate(int orderId, String evaluateInfo, String userName);

    /********************************************************************************
     * 确认收货服务层方法
     * @param orderId
     * @param userName
     * @return
     ********************************************************************************/
    boolean saveTaken(int orderId, String userName);

    /********************************************************************************
     * 申请取消订单服务层方法
     * @param orderId
     * @param reason
     * @param userName
     * @return
     ********************************************************************************/
    boolean updateCancel(int orderId, String reason, String userName);

    /********************************************************************************
     * 管理端订单查询
     * @param pageSize
     * @param pageNum
     * @param selMap
     * @return
     ********************************************************************************/
    PageBean joinQuery(int pageSize, int pageNum, Map<String, Object> selMap);
    
    /********************************************************************************
     * 审核订单
     * @param orderId
     * @param userName
     * @param carriage
     * @return
     ********************************************************************************/
    boolean modifyCheck(int orderId, String userName, double carriage);

    /********************************************************************************
     * 通过订单取消申请
     * @param orderId
     * @param userName
     * @return
     ********************************************************************************/
    boolean savePassApply(int orderId, String userName);

    /********************************************************************************
     * 拒绝订单取消申请
     * @param orderId
     * @param userName
     * @return
     ********************************************************************************/
    boolean saveRefApply(int orderId, String userName);

    /********************************************************************************
     * 通过订单编号查询订单
     * @param orderNo
     * @return
     ********************************************************************************/
    Order getByNo(String orderNo);

    /**
	 * 导出查询订单信息
	 */
	List<Order> getExportOrder(Map<String,Object> map);
    
    /**
     * 通过订单状态查询订单信息
     * @param orderState
     * @return
     */
    Order getOrderState(int orderState);

    /**
     * 通过userId查询订单信息
     */
    List<Order> getInfoByUserId(int userId);
}