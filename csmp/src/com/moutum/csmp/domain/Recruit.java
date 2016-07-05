package com.moutum.csmp.domain;

import java.util.Date;

/************************************************************************************
 * @Title        : Recruit.java
 * @Description  : 招聘信息
 * @Author       : ZhaoShasha
 * @DateTime     : 2015年5月13日 下午3:22:34
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class Recruit
{

    /**
     * 1招聘编号
     */
    private int recruitId;
    
    /**
     * 发布人
     */
    private int userId;
    
    /**
     * 发布时间
     */
    private Date time;
    
    /**
     * 职务名称
     */
    private String jobName;
    
    /**
     * 工作性质
     */
    private int workNature;
    
    /**
     * 工作地点
     */
    private String workAddress;
    
    /**
     * 性别要求
     */
    private int sexRequire;
    
    /**
     * 2薪资待遇
     */
    private String wage;
    
    /**
     * 3工作职责
     */
    private String postDuty;
    
    /**
     * 4任职条件
     */
    private String factor;
    
	/**
	 * 招聘人数
	 */
	private int recruitMember;
    
    
	public int getRecruitMember() {
		return recruitMember;
	}

	public void setRecruitMember(int recruitMember) {
		this.recruitMember = recruitMember;
	}


    public int getRecruitId()
    {
        return recruitId;
    }

    public void setRecruitId(int recruitId)
    {
        this.recruitId = recruitId;
    }

    public int getUserId()
    {
        return userId;
    }

    public void setUserId(int userId)
    {
        this.userId = userId;
    }

    public Date getTime()
    {
        return time;
    }

    public void setTime(Date time)
    {
        this.time = time;
    }

    public String getJobName()
    {
        return jobName;
    }

    public void setJobName(String jobName)
    {
        this.jobName = jobName;
    }

    public int getWorkNature()
    {
        return workNature;
    }

    public void setWorkNature(int workNature)
    {
        this.workNature = workNature;
    }

    public String getWorkAddress()
    {
        return workAddress;
    }

    public void setWorkAddress(String workAddress)
    {
        this.workAddress = workAddress;
    }

    public int getSexRequire()
    {
        return sexRequire;
    }

    public void setSexRequire(int sex_Require)
    {
        this.sexRequire = sex_Require;
    }

    public String getWage()
    {
        return wage;
    }

    public void setWage(String wage)
    {
        this.wage = wage;
    }

    public String getPostDuty()
    {
        return postDuty;
    }

    public void setPostDuty(String postDuty)
    {
        this.postDuty = postDuty;
    }

    public String getFactor()
    {
        return factor;
    }

    public void setFactor(String factor)
    {
        this.factor = factor;
    }
    
}

