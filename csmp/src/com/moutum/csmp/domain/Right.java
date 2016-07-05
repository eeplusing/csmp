package com.moutum.csmp.domain;


/************************************************************************************
 * @Title       : Right.java
 * @Description : 权限信息
 * @Author      : ZhaoShasha
 * @DateTime    : 2015年5月13日 上午10:55:22
 * @Copyright   : 2015 Moutum All Rights Reserved
 * @version     : V1.0
 ************************************************************************************/
public class Right
{

    /**
     * 权限ID
     */
    private int rightId;

    /**
     * 权限名称
     */
    private String rightName;

    /**
     * 请求方法
     */
    private String function;

    /**
     * 描述
     */
    private String rightRemark;
    
    /**
     * 模块Id
     */
    private int modleId;
    

	/**
	 * @return the modleId
	 */
	public int getModleId() {
		return modleId;
	}

	/**
	 * @param modleId the modleId to set
	 */
	public void setModleId(int modleId) {
		this.modleId = modleId;
	}

	public int getRightId()
    {
        return rightId;
    }

    public void setRightId(int rightId)
    {
        this.rightId = rightId;
    }

    public String getRightName()
    {
        return rightName;
    }

    public void setRightName(String rightName)
    {
        this.rightName = rightName;
    }

    public String getFunction()
    {
        return function;
    }

    public void setFunction(String function)
    {
        this.function = function;
    }

    public String getRightRemark()
    {
        return rightRemark;
    }

    public void setRightRemark(String rightRemark)
    {
        this.rightRemark = rightRemark;
    }

}
