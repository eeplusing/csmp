package com.moutum.csmp.action;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Collections;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONObject;

import com.moutum.csmp.service.AddressService;
import com.moutum.csmp.service.BillDetailService;
import com.moutum.csmp.service.BillService;
import com.moutum.csmp.service.BuyGoodService;
import com.moutum.csmp.service.CarService;
import com.moutum.csmp.service.DataStatService;
import com.moutum.csmp.service.EvaluateService;
import com.moutum.csmp.service.FeedbackService;
import com.moutum.csmp.service.GoodService;
import com.moutum.csmp.service.GradeService;
import com.moutum.csmp.service.GroupService;
import com.moutum.csmp.service.IdepotService;
import com.moutum.csmp.service.ImageService;
import com.moutum.csmp.service.MailService;
import com.moutum.csmp.service.ModleService;
import com.moutum.csmp.service.NewsService;
import com.moutum.csmp.service.OperLogService;
import com.moutum.csmp.service.OrderDetailService;
import com.moutum.csmp.service.OrderService;
import com.moutum.csmp.service.PriceService;
import com.moutum.csmp.service.RecruitService;
import com.moutum.csmp.service.RightService;
import com.moutum.csmp.service.RoleService;
import com.moutum.csmp.service.StatService;
import com.moutum.csmp.service.StockService;
import com.moutum.csmp.service.StorageService;
import com.moutum.csmp.service.TypeService;
import com.moutum.csmp.service.UserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

/************************************************************************************
 * @Title        : BaseAction.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年3月9日 下午3:14:39
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class BaseAction<T> extends ActionSupport implements ModelDriven<T>
{
    private static final long serialVersionUID = 833612228869245847L;
    
    protected T model;
    
    protected int pageNum = 1; // 当前页
    
    protected int pageSize = 15; // 每页显示多少条记录
    
    protected int pageCount = 0;//总页数
    
    protected int recordCount = 0;//总记录数
    
    protected JSONObject result;
    
    protected List<?> recordList = Collections.EMPTY_LIST;
    
    @Resource protected UserService userService;
    
    @Resource protected AddressService addressService;
    
    @Resource protected BillDetailService billDetailService;
    
    @Resource protected BillService billService;
    
    @Resource protected BuyGoodService buyGoodService;
    
    @Resource protected CarService carService;
    
    @Resource protected EvaluateService evaluateService;
    
    @Resource protected FeedbackService feedbackService;
    
    @Resource protected GoodService goodService;
    
    @Resource protected GradeService gradeService;
    
    @Resource protected GroupService groupService;
    
    @Resource protected IdepotService idepotService;
    
    @Resource protected ImageService imageService;
    
    @Resource protected MailService mailService;
    
    @Resource protected ModleService modleService;
    
    @Resource protected NewsService newsService;
    
    @Resource protected OperLogService operLogService;
    
    @Resource protected OrderDetailService orderDetailService;
    
    @Resource protected OrderService orderService;
    
    @Resource protected PriceService priceService;
    
    @Resource protected RecruitService recruitService;
    
    @Resource protected RightService rightService;
    
    @Resource protected RoleService roleService;
    
    @Resource protected StatService statService;
    
    @Resource protected StockService stockService;
    
    @Resource protected StorageService storageService;
    
    @Resource protected TypeService typeService;
    
    @Resource protected DataStatService dataStatService;
    
    @SuppressWarnings("unchecked")
    public BaseAction()
    {
        try
        {
            Class<T> clazz = null;
            Class<?> c = getClass();
            Type t = c.getGenericSuperclass();
            if(t instanceof ParameterizedType)
            {
                Type[] p = ((ParameterizedType) t).getActualTypeArguments();
                clazz = (Class<T>) p[0];
            }
            model = clazz.newInstance();
        }
        catch (Exception e)
        {
            throw new RuntimeException(e);
        }
    }
    
    public HttpServletResponse getResponse()
    {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/xml");
        response.setCharacterEncoding("UTF-8");
        return response;
    }
    
    public void invalidate()//手动销毁session
    {
        try
        {
            ServletActionContext.getRequest().getSession().invalidate();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

    @Override
    public T getModel()
    {
        return model;
    }

    public int getPageNum()
    {
        return pageNum;
    }

    public void setPageNum(int pageNum)
    {
        this.pageNum = pageNum;
    }

    public int getPageSize()
    {
        return pageSize;
    }

    public void setPageSize(int pageSize)
    {
        this.pageSize = pageSize;
    }

    public int getPageCount()
    {
        return pageCount;
    }

    public void setPageCount(int pageCount)
    {
        this.pageCount = pageCount;
    }

    public int getRecordCount()
    {
        return recordCount;
    }

    public void setRecordCount(int recordCount)
    {
        this.recordCount = recordCount;
    }

    public List<?> getRecordList()
    {
        return recordList;
    }

    public void setRecordList(List<?> recordList)
    {
        this.recordList = recordList;
    }

    public JSONObject getResult()
    {
        return result;
    }

    public void setResult(JSONObject result)
    {
        this.result = result;
    }
}