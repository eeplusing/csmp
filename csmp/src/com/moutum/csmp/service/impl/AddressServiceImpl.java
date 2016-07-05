package com.moutum.csmp.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.moutum.csmp.domain.Address;
import com.moutum.csmp.service.AddressService;

/************************************************************************************
 * @Title        : AddressServiceImpl.java
 * @Description : 
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月15日 下午4:58:58
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
@Service @Transactional
public class AddressServiceImpl extends ServiceSupportImpl<Address> implements AddressService
{

}

