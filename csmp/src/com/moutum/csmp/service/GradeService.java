package com.moutum.csmp.service;

import java.util.List;

import com.moutum.csmp.domain.Grade;

/************************************************************************************
 * @Title        : GradeService.java
 * @Description  : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月17日 下午4:04:05
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public interface GradeService extends ServiceSupport<Grade>
{

    List<Grade> findGroupGrade();

}

