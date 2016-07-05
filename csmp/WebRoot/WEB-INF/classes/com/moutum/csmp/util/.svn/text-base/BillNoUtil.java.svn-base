package com.moutum.csmp.util;

import java.util.Date;

import com.moutum.csmp.domain.Bill;
import com.moutum.csmp.service.BillService;
/**
 * 
 * @author wanghuan
 * @DateTime 2015-06-08
 * @Description 生成入库/出库单编号
 * 入库单单据编号 = "0" + 年的后两位 + 月 + 日 + 四位数字(单据编号每天的四位数字都从0001开始，每次加1)
 * 出库单单据编号 = "1" + 年的后两位 + 月 + 日 + 四位数字(单据编号每天的四位数字都从0001开始，每次加1)
 * 
 */
public class BillNoUtil
{
	private static BillNoUtil  billNoUtil = null;
	
	private BillNoUtil(){}
	
	private static String getBillNo(String maxBillNo, int type)
	{
		String subappend = "0000" + (Integer.parseInt(maxBillNo.substring(7))+1);
		return type + DateUtil.dateToString(new Date(), DateUtil.YYYYMMDD).substring(2) + subappend.substring(subappend.length() - 4, subappend.length());
	}
	
	@SuppressWarnings("static-access")
	public static String getBillNo(BillService billService, int type)
	{
		synchronized (BillNoUtil.class) 
		{
			if(billNoUtil == null)
			{
				billNoUtil = new BillNoUtil();
			}
			Bill bill = billService.getMaxBillNo();
			if(null != bill)
			{
				return billNoUtil.getBillNo(bill.getBillNo(), type);
			}
			else
			{
				return billNoUtil.getBillNo("00000000000", type);
			}
		}
	}
}