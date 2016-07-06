package test;

import java.util.*;

import javax.annotation.Resource;

import org.apache.commons.codec.digest.DigestUtils;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.moutum.csmp.base.PageBean;
import com.moutum.csmp.domain.*;
import com.moutum.csmp.service.*;
import com.moutum.csmp.util.DateUtil;
import com.moutum.csmp.util.OrderNoUtil;
import com.moutum.csmp.util.QueryHelper;
import com.moutum.csmp.util.SystemConstants;

/********************************************************************************
 * @Title        : ServiceTest.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015-5-10 下午05:35:33
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ********************************************************************************/
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring-beans.xml")
public class ServiceTest
{
    
    static ApplicationContext act = null;
    @Resource
    private UserService userService = null;
    //static UserService userService = null;
    @Resource
    private RoleService roleService = null;
    //static RoleService roleService = null;
    static GroupService groupService = null;
    static OrderService orderService = null;
    static OrderDetailService orderDetailService = null;
    @Resource
    private GradeService gradeService = null;
    //static GradeService gradeService = null;
    //static BillService billService = null;
    //static BillDetailService billDetailService = null;
   // static CarService carService = null;
   // static BuyGoodService buyGoodService = null;
   // static GoodService goodService = null;
   // static ImageService imageService = null;
   // static TypeService typeService = null;
   // static PriceService priceService = null;
   // static AddressService addressService = null;
  //  static StorageService storageService = null;
    

    static String[] loginAccount = {"admin", "Aaron", "Brant", "Caspar", "Charles", "Christian", "Daniel", "Dennis", 
        "Derek", "Donald", "Douglas", "Edward", "Edwin", "Elliott", "Elvis",
        "Eric", "Francis", "Frank", "Franklin", "Fred", "Gabriel", "Gaby",
        "Garfield", "Glendon", "Harrison", "Howard", "Ignativs",
        "Jackson", "Johnny", "Joseph", "Joshua", "Justin", "Kenneth", "Kenny", "Kevin", "Lance",
        "Larry", "Laurent", "Lawrence", "Leander", "Marcus", "Martin", "Matthew", "Michael",
        "Nicholas", "Patrick", "Philip", "Phoebe", "Quentin", "Randall", "Randolph", "Richard",
        "Richie", "Robert", "Robinson", "Samuel", "Sidney", "Solomon", "Spencer", "Stanley",
        "Steven", "Stuart", "Terence", "Timothy", "Thomas", "Vincent", "Wesley", "William"};
    static String[] userName = {"超级管理员", "亚伦", "布兰特", "卡斯帕", "查尔斯", "克里斯蒂安", "丹尼尔", "丹尼斯", "德里克", 
        "唐纳德", "道格拉斯", "爱德华", "艾德文", "艾略特", "埃尔维斯", "埃里克", "弗朗西斯", 
        "弗兰克", "富兰克林", "弗瑞德", "加百利", "加比", "加菲尔德", "格林顿", "哈里森", 
        "霍华德", "伊格纳缇伍兹", "杰克逊", "约翰尼", "约瑟夫", "约书亚", "贾斯汀", "肯尼斯", 
        "肯尼", "凯文", "兰斯", "拉里", "劳伦特", "劳伦斯", "利安德尔", "马库斯", "马丁", "马修", 
        "迈克尔", "尼古拉斯", "帕特里克", "菲利普", "菲比", "昆廷", "兰德尔", "伦道夫", "理查德", 
        "里奇", "罗伯特", "罗宾逊", "塞缪尔", "西德尼", "所罗门", "斯宾塞", "斯坦利", "史蒂文", 
        "斯图亚特", "特伦斯", "蒂莫西", "托马斯", "文森特", "卫斯理", "威廉"};
    static String[] userPhone = {"13685856969", "18717323908", "18710889906", "18710386996", "18392992355", "18392993926", "18392995929", "18392980199", 
        "18392970199", "18392359299", "18302950899", "18302936151", "18302919983", "18292835998", "18220573099", 
        "18220502899", "18209279901", "15929803151", "15902971511", "15891733150", "15829912018", "15829912685", 
        "15829912695", "15829912759", "15829912871", "15829913778", "15829915815", "15829916309", "15829916798", 
        "15829916928", "15829916965", "15829917057", "15829902129", "15829902167", "15829903209", "15829903327", 
        "15829905267", "15829905308", "15829908179", "15829908776", "15829909037", "15829909361", "15829909680", 
        "15829910020", "15829911795", "15829911813", "15829889757", "15829889780", "15829901083", "15829901196", 
        "15829901362", "15829901399", "15829901927", "15829902019", "15829902067", "15829881165", "15829882102", 
        "15829883550", "15829883576", "15829885593", "15829889270", "15829731150", "15829711501", "15829331509", 
        "15829315161", "15829282151", "15829061507", "15829015077"};
    static String[] companyName = {"甘肃央元热能有限公司", "中国石油天然气股份有限公司","中国石油化工股份有限公司","中国海洋石油总公司","上海宝钢集团公司","中国首钢集团","包头钢铁集团有限责任公司","鞍山钢铁集团公司",
        "吉林化学工业股份有限公司","中国第一汽车集团公司","上海大众汽车有限公司","中国海运总公司","中国远洋运输集团","中国电信集团公司","中国联合通信有限公司",
        "中国移动通信集团公司","中国网络通信有限公司","中国路桥集团","中国船舶工业集团公司","中国粮油食品进出口有限公司","中国人民财产保险股份有限公司",
        "中国平安保险股份有限公司","太平洋保险集团","中国工商银行","中国农业银行","中国建设银行","中国银行","招商银行","中国光大银行","中国国际信托投资公司",
        "中国铝业股份有限公司","神华集团有限责任公司","中国电力投资集团公司","中国华能集团公司","中国国际电视总公司","红塔集团","三九企业集团","中国国际航空公司",
        "中国东方航空股份有限公司","中国南方航空股份公司","中国兵器工业集团公司","中国华源集团","中国盐业总公司","中国非金属矿工业总公司","中国中化集团公司",
        "中国图书进出口总公司","华北制药集团","中国中旅公司","哈药集团有限公司","哈飞汽车股份有限公司","北京同仁堂有限责任公司","扬子江药业集团公司",
        "中国飞跃集团有限公司","联想集团有限公司","北大方正集团公司","清华同方股份有限公司","长城计算机集团","华为技术有限公司","夏新电子有限公司","中兴通讯",
        "神州数码控股有限公司","太极计算机股份有限公司","熊猫电子集团有限公司","中国科健股份有限公司","大唐电信","海尔集团","TCL集团股份有限公司","四川长虹电器股份有限公司"};
    @BeforeClass
    public static void setUpBeforeClass() throws Exception
    {
       // act = new ClassPathXmlApplicationContext("spring-beans.xml");
//        userService = (UserService)act.getBean("userServiceImpl");
//        roleService = (RoleService)act.getBean("roleServiceImpl");
//        groupService = (GroupService)act.getBean("groupServiceImpl");
//        orderService = (OrderService)act.getBean("orderServiceImpl");
//        orderDetailService = (OrderDetailService)act.getBean("orderDetailServiceImpl");
//        gradeService = (GradeService)act.getBean("gradeServiceImpl");
//        billService = (BillService)act.getBean("billServiceImpl");
//        billDetailService = (BillDetailService)act.getBean("billDetailServiceImpl");
//        carService = (CarService)act.getBean("carServiceImpl");
//        buyGoodService = (BuyGoodService)act.getBean("buyGoodServiceImpl");
//        goodService = (GoodService)act.getBean("goodServiceImpl");
//        imageService = (ImageService)act.getBean("imageServiceImpl");
//        typeService = (TypeService)act.getBean("typeServiceImpl");
//        priceService = (PriceService)act.getBean("priceServiceImpl");
//        addressService = (AddressService)act.getBean("addressServiceImpl");
//        storageService = (StorageService)act.getBean("storageServiceImpl");
    }
    
    @Test public void testjar()
    {
        System.out.println("123");
    }
    
   /* @Test public void addUser()
    {
        Role role = roleService.getById(1);
        Grade grade = gradeService.getById(1);
       
        for(int i = 0; i < loginAccount.length; i++)
        {
            User user = new User();
            user.setLoginAccount(loginAccount[i].toLowerCase());
            //对密码进行MD5加密处理
            user.setLoginPassword(DigestUtils.md5Hex(loginAccount[i]));
            user.setUserName(userName[i]);
            user.setUserPhone(userPhone[i]);
            user.setCompanyName(companyName[i]);
            user.setState(0);
            user.setEmail(loginAccount[i].toLowerCase() + "@eplusing.com");
            user.setErrorNum(0);
            user.setCountDate(new Date());
            user.setGrade(grade);
//            user.setGroup(group);
            user.setRole(role);
            userService.save(user);
        }
        User user = new User();
        user.setLoginAccount("test-customer");
        user.setLoginPassword(DigestUtils.md5Hex(DigestUtils.md5Hex("pass-customer") + "{test-customer}"));
        user.setUserName("测试客户");
        user.setUserPhone("15836369292");
        user.setCompanyName("甘肃央元热能有限公司");
        user.setState(SystemConstants.USER_STAT_OFFLINE);
        user.setEmail("test-customer@csmp.com.cn");
        user.setGrade(grade);
        user.setRole(role);
        userService.save(user);
    }*/
    
    @Test public void selUser()
    {
//        User user = userService.get(1);
//        System.out.println(user.getCompanyName());
        
//        List<User> users = userService.findAll();
//        for(int i = 0; i < users.size(); i++)
//        {
//            System.out.println(i + " -> " + users.get(i).getCompanyName());
//        }
      /*  
        Integer[] ids = {1, 2, 3, 4, 5, 6};
        List<User> users = userService.getByIds(ids);
        for(int i = 0; i < users.size(); i++)
        {
            System.out.println(i + " -> " + users.get(i).getCompanyName());
        }*/
    }
    
    @SuppressWarnings("unchecked")
    @Test public void getPageBean()
    {
      /*  QueryHelper queryHelper = new QueryHelper(User.class, "u");
        queryHelper.addCondition("u.userId >= ?", 15)
        .addCondition("u.loginAccount like ?", "%i%")
        .addOrderProperty("u.userId", true);
        PageBean pageBean = userService.getPageBean(1, 10, queryHelper);
        List<User> users = pageBean.getRecordList();
        for(User user : users)
        {
            System.out.println(user.getUserId() + " -> " + user.getLoginAccount());
        }*/
    }
    
    @Test public void updateUser()
    {
    	//Role role = new Role();
       // role.setRoleName("超级管理员");
       // roleService.save(role);
        User user1 = userService.getById(73);
        User user2 = userService.getById(74);
        user1.setLoginPassword(DigestUtils.md5Hex("123"));
        user2.setLoginPassword(DigestUtils.md5Hex("456"));
        userService.update(user1);
        userService.update(user2);
    }
    
    @Test public void deleteUser()
    {
        /*try
        {
            userService.delete(169);
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }*/
    }
    
    /*@Test public void addBill()
    {
        Set<BillDetail> billDetails = new HashSet<BillDetail>();
        
        BillDetail billDetail1 = new BillDetail();
        billDetail1.setAmount(5.0);
        billDetail1.setGoodId(1);
        
        BillDetail billDetail2 = new BillDetail();
        billDetail2.setAmount(7.5);
        billDetail2.setGoodId(2);
        
        billDetails.add(billDetail1);
        billDetails.add(billDetail2);
        
        Bill bill = new Bill();
        bill.setBillStat(0);
        bill.setBillType(0);
        bill.setCreateTime(new Date());
        bill.setStorageId(1);
        bill.setBillDetails(billDetails);
        billService.save(bill);
    }*/
    
    @Test public void selBill()
    {
//        Bill bill = billService.getById(3);
    }
    
    /*@Test public void addOrder()
    {
//        Set<Address> as = new HashSet<Address>();
        User user = userService.getById(69);
//        Address address = new Address();
//        address.setAddress("甘肃省兰州市西关十字金城名苑2203室");
//        address.setConsigneName(user.getUserName());
//        address.setConsignePhone(user.getUserPhone());
//        address.setPostCode("000000");
//        addressService.save(address);
//        user.setAddresss(as);
//        userService.update(user);
        
        Address address = addressService.getById(1);
        
        for(int i = 1; i < 100; i++)
        {
            int goodNum = (int)(Math.random()*3) + 1;
            Set<OrderDetail> ods = new HashSet<OrderDetail>();
            double amount = 0;
            for(int j = 0; j < goodNum; j++)
            {
                int goodId = (int)(Math.random()*16) + 1;
                boolean isHave = false;
                for(OrderDetail od : ods)
                {
                    if(od.getGoodId() == goodId)
                    {
                        isHave = true;
                    }
                }
                if(isHave)
                {
                    j--;
                    continue;
                }
                Good good = goodService.getById(goodId);
                
                double price = (int)(Math.random()*101) + 1000;
                double num = (int)(Math.random()*10) + 1;
                OrderDetail ord = new OrderDetail();
                ord.setGoodId(goodId);
                ord.setGoodName(good.getGoodName());
                ord.setHeadValue(good.getHeadValue());
                ord.setSpecification(good.getSpecification());
                ord.setNum(num);
                ord.setSalePrice(price);
                ods.add(ord);
                amount += price * num;
            }
            
            Order order = new Order();
            
            order.setOrderCycle(120);
            order.setOrderDate(new Date());
            order.setOrderDetails(ods);
            order.setOrderAmount(amount);
            //String no = i < 10 ? ("0" + i) : (i + "");
            order.setOrderNo(OrderNoUtil.getOrderNo());
            order.setOrderState(i%9);
            order.setUserId(user.getUserId());
            order.setAddress(address);
            orderService.save(order);
        }
    }*/
    
    @Test public void selOrder()
    {
       /* Order order = orderService.getById(1);
        for(OrderDetail od : order.getOrderDetails())
        {
            System.out.println(od.getGoodName());
        }
        System.out.println(order.getAddress().getAddress());*/
    }
    
    @Test public void updateOrder()
    {
        /*List<Order> list = orderService.findAll();
        for(Order order : list)
        {
            int eno = Integer.parseInt(order.getOrderNo().substring(9));
            StringBuffer stringBuffer = new StringBuffer(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tXXX1提交订单;\r\t");
            if(eno%40 == 7)
            {
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tXXX1申请取消订单;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tMMM1处理订单取消申请,结果:未通过;\r\t");
            }
            switch (order.getOrderState())
            {
            case 1:
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tXXX2审核订单;\r\t");
                if(eno%40 == 4)
                {
                    stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tXXX1申请取消订单;\r\t");
                    stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tMMM1处理订单取消申请,结果:未通过;\r\t");
                }
                break;
            case 2:
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tXXX2审核订单;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tXXX1成功支付了订单;\r\t");
                break;
            case 3:
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tXXX2审核订单;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tXXX1成功支付了订单;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\t订单开始出库，出库员XXX3;\r\t");
                break;
            case 4:
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tXXX2审核订单;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tXXX1成功支付了订单;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\t订单开始出库，出库员XXX3;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\t订单出库完成，已经开始配送;\r\t");
                break;
            case 5:
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tXXX2审核订单;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tXXX1成功支付了订单;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\t订单开始出库，出库员XXX3;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\t订单出库完成，已经开始配送，配送员XXX4,联系方式136xxxxxxxx;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\t商品已经配送至目的地，配送员XXX4,联系方式136xxxxxxxx;\r\t");
                break;
            case 6:
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tXXX2审核订单;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tXXX1成功支付了订单;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\t订单开始出库，出库员XXX3;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\t订单出库完成，已经开始配送，配送员XXX4,联系方式136xxxxxxxx;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\t商品已经配送至目的地，配送员XXX4,联系方式136xxxxxxxx;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tXXX1签字确认收货;\r\t");
                break;
            case 7:
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tXXX2审核订单;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tXXX1成功支付了订单;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\t订单开始出库，出库员XXX3;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\t订单出库完成，已经开始配送，配送员XXX4,联系方式136xxxxxxxx;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\t商品已经配送至目的地，配送员XXX4,联系方式136xxxxxxxx;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tXXX1签字确认收货;\r\t");
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tXXX1对订单进行了评价,订单已完成;\r\t");
                break;
            case 8:
                stringBuffer.append(DateUtil.dateToString(new Date(), DateUtil.YYYY_MM_DD_HH_MM_SS) + "\tXXX1申请取消订单;\r\t");
                break;
            }
            
            order.setInfoFlow(stringBuffer.toString());
            orderService.update(order);
        }*/
    }
    
    @Test public void aveOrder()
    {
       /* boolean r = orderService.saveEvaluate(33, "dwadwa我的", "测试用户");
        System.out.println(r);*/
        
    }
    
    @Test public void addCar()
    {
     /*   Car car = new Car();
        car.setUserId(1);
        carService.save(car);*/
    }
    
   @Test public void getCar()
   {
      // Car car = new Car();
       
       //carService.getCar(69);
   }
    
    
    
    
    @Test public void modifyCar()
    {
       /* Car car = carService.getById(1);
        
        Set<BuyGood> buyGoods = new HashSet<BuyGood>();
        
        BuyGood buyGood1 = new BuyGood();
        buyGood1.setGood(goodService.getById(1));
        buyGood1.setAmount(10.0);
        
        BuyGood buyGood2 = new BuyGood();
        buyGood2.setGood(goodService.getById(3));
        buyGood2.setAmount(8.0);
        
        BuyGood buyGood3 = new BuyGood();
        buyGood3.setGood(goodService.getById(4));
        buyGood3.setAmount(6.0);
        
        BuyGood buyGood4 = new BuyGood();
        buyGood4.setGood(goodService.getById(7));
        buyGood4.setAmount(4.0);
        
        BuyGood buyGood5 = new BuyGood();
        buyGood5.setGood(goodService.getById(11));
        buyGood5.setAmount(2.0);
        
        buyGoods.add(buyGood1);
        buyGoods.add(buyGood2);
        buyGoods.add(buyGood3);
        buyGoods.add(buyGood4);
        buyGoods.add(buyGood5);
        
        car.setBuyGoods(buyGoods);
        carService.update(car);*/
    }
    
    @Test public void selCar()
    {
//        Car car = carService.getById(1);
//        for(BuyGood bg : car.getBuyGoods())
//        {
////            System.out.println(bg.getGoodName());
//        }
    }
    
    /*@Test public void addGood()
    {
        Type type = new Type();
        type.setTypeName("煤炭");
        typeService.save(type);
        
        Good good = new Good();
        good.setBusyType(1);
        good.setGoodName("无烟煤");
        good.setGoodStat(1);
        good.setType(type);
        
        Good good1 = new Good();
        good1.setBusyType(1);
        good1.setGoodName("工业型煤");
        good1.setGoodStat(1);
        good1.setType(type);
        
        Good good2 = new Good();
        good2.setBusyType(1);
        good2.setGoodName("贫煤");
        good2.setGoodStat(1);
        good2.setType(type);
        
        Good good3 = new Good();
        good3.setBusyType(1);
        good3.setGoodName("焦炭");
        good3.setGoodStat(1);
        good3.setType(type);
        
        Good good4 = new Good();
        good4.setBusyType(1);
        good4.setGoodName("沫煤");
        good4.setGoodStat(1);
        good4.setType(type);
        
        Good good5 = new Good();
        good5.setBusyType(1);
        good5.setGoodName("青烟煤");
        good5.setGoodStat(1);
        good5.setType(type);
        
        Good good6 = new Good();
        good6.setBusyType(1);
        good6.setGoodName("蜂窝煤");
        good6.setGoodStat(1);
        good6.setType(type);
        
        Good good7 = new Good();
        good7.setBusyType(1);
        good7.setGoodName("原煤");
        good7.setGoodStat(1);
        good7.setType(type);
        
        Good good8 = new Good();
        good8.setBusyType(1);
        good8.setGoodName("天然焦");
        good8.setGoodStat(1);
        good8.setType(type);
        
        Good good9 = new Good();
        good9.setBusyType(1);
        good9.setGoodName("气煤");
        good9.setGoodStat(1);
        good9.setType(type);
        
        Good good10 = new Good();
        good10.setBusyType(1);
        good10.setGoodName("烟煤");
        good10.setGoodStat(1);
        good10.setType(type);
        
        Good good11 = new Good();
        good11.setBusyType(1);
        good11.setGoodName("长焰煤");
        good11.setGoodStat(1);
        good11.setType(type);
        
        Good good12 = new Good();
        good12.setBusyType(1);
        good12.setGoodName("褐煤");
        good12.setGoodStat(1);
        good12.setType(type);
        
        Good good13 = new Good();
        good13.setBusyType(1);
        good13.setGoodName("精煤");
        good13.setGoodStat(1);
        good13.setType(type);
        
        Good good14 = new Good();
        good14.setBusyType(1);
        good14.setGoodName("无烟煤");
        good14.setGoodStat(1);
        good14.setType(type);
        
        Good good15 = new Good();
        good15.setBusyType(1);
        good15.setGoodName("焦煤");
        good15.setGoodStat(1);
        good15.setType(type);
        
        goodService.save(good);
        goodService.save(good1);
        goodService.save(good2);
        goodService.save(good3);
        goodService.save(good4);
        goodService.save(good5);
        goodService.save(good6);
        goodService.save(good7);
        goodService.save(good8);
        goodService.save(good9);
        goodService.save(good10);
        goodService.save(good11);
        goodService.save(good12);
        goodService.save(good13);
        goodService.save(good14);
        goodService.save(good15);
    }
    
    @Test public void modifyGood()
    {
        Image image1 = new Image();
        image1.setImagePath("d://image/pic1.jpeg");
        image1.setIsDefault(1);
        
        Image image2 = new Image();
        image2.setImagePath("d://image/pic1.jpeg");
        image2.setIsDefault(0);
        
        Image image3 = new Image();
        image3.setImagePath("d://image/pic1.jpeg");
        image3.setIsDefault(0);
        
        Image image4 = new Image();
        image4.setImagePath("d://image/pic1.jpeg");
        image4.setIsDefault(1);
        
        Image image5 = new Image();
        image5.setImagePath("d://image/pic1.jpeg");
        image5.setIsDefault(0);
        
        Image image6 = new Image();
        image6.setImagePath("d://image/pic1.jpeg");
        image6.setIsDefault(0);
        
        Image image7 = new Image();
        image7.setImagePath("d://image/pic1.jpeg");
        image7.setIsDefault(1);
        
        Image image8 = new Image();
        image8.setImagePath("d://image/pic1.jpeg");
        image8.setIsDefault(0);
        
        Image image9 = new Image();
        image9.setImagePath("d://image/pic1.jpeg");
        image9.setIsDefault(0);
        
        Image image10 = new Image();
        image10.setImagePath("d://image/pic1.jpeg");
        image10.setIsDefault(1);
        
        Image image11 = new Image();
        image11.setImagePath("d://image/pic1.jpeg");
        image11.setIsDefault(0);
        
        Image image12 = new Image();
        image12.setImagePath("d://image/pic1.jpeg");
        image12.setIsDefault(0);
        
        Image image13 = new Image();
        image13.setImagePath("d://image/pic1.jpeg");
        image13.setIsDefault(1);
        
        Image image14 = new Image();
        image14.setImagePath("d://image/pic1.jpeg");
        image14.setIsDefault(0);
        
        Image image15 = new Image();
        image15.setImagePath("d://image/pic1.jpeg");
        image15.setIsDefault(0);
        
        Image image16 = new Image();
        image16.setImagePath("d://image/pic1.jpeg");
        image16.setIsDefault(1);
        
        Image image17 = new Image();
        image17.setImagePath("d://image/pic1.jpeg");
        image17.setIsDefault(0);
        
        Image image18 = new Image();
        image18.setImagePath("d://image/pic1.jpeg");
        image18.setIsDefault(0);
        
        Image image19 = new Image();
        image19.setImagePath("d://image/pic1.jpeg");
        image19.setIsDefault(0);
        
        Set<Image> images1 = new HashSet<Image>();
        images1.add(image1);
        images1.add(image2);
        images1.add(image3);
        
        Set<Image> images2 = new HashSet<Image>();
        images2.add(image4);
        images2.add(image5);
        images2.add(image6);
        
        Set<Image> images3 = new HashSet<Image>();
        images3.add(image7);
        images3.add(image8);
        images3.add(image9);
        
        Set<Image> images4 = new HashSet<Image>();
        images4.add(image10);
        images4.add(image11);
        images4.add(image12);
        
        Set<Image> images5 = new HashSet<Image>();
        images5.add(image13);
        images5.add(image14);
        images5.add(image15);
        
        Set<Image> images6 = new HashSet<Image>();
        images6.add(image16);
        images6.add(image17);
        images6.add(image18);
        images6.add(image19);
        
        Good good1 = goodService.getById(4);
        good1.setImages(images1);
        good1.setSpecification("俗称白煤或红煤。是煤化程度最大的煤。无烟煤固定碳含量高，挥发分产率低，密度大，硬度大，燃点高，燃烧时不冒烟。黑色坚硬，有金属光泽。");
        good1.setHeadValue("破碎率+磨损率/% ≤ 3 密度/g·㎝31.4~1.6 挥发分﹤10% 含泥量/% ≤ 4 盐酸可容率/% ≤ 3.5");
        goodService.update(good1);
        
        Good good2 = goodService.getById(3);
        good2.setImages(images2);
        good2.setSpecification("俗称白煤或红煤。是煤化程度最大的煤。无烟煤固定碳含量高，挥发分产率低，密度大，硬度大，燃点高，燃烧时不冒烟。黑色坚硬，有金属光泽。");
        good2.setHeadValue("破碎率+磨损率/% ≤ 3 密度/g·㎝31.4~1.6 挥发分﹤10% 含泥量/% ≤ 4 盐酸可容率/% ≤ 3.5");
        goodService.update(good2);
        
        Good good3 = goodService.getById(2);
        good3.setImages(images3);
        good3.setSpecification("俗称白煤或红煤。是煤化程度最大的煤。无烟煤固定碳含量高，挥发分产率低，密度大，硬度大，燃点高，燃烧时不冒烟。黑色坚硬，有金属光泽。");
        good3.setHeadValue("破碎率+磨损率/% ≤ 3 密度/g·㎝31.4~1.6 挥发分﹤10% 含泥量/% ≤ 4 盐酸可容率/% ≤ 3.5");
        goodService.update(good3);
        
        Good good4 = goodService.getById(1);
        good4.setImages(images4);
        good4.setSpecification("俗称白煤或红煤。是煤化程度最大的煤。无烟煤固定碳含量高，挥发分产率低，密度大，硬度大，燃点高，燃烧时不冒烟。黑色坚硬，有金属光泽。");
        good4.setHeadValue("破碎率+磨损率/% ≤ 3 密度/g·㎝31.4~1.6 挥发分﹤10% 含泥量/% ≤ 4 盐酸可容率/% ≤ 3.5");
        goodService.update(good4);
        
        Good good5 = goodService.getById(6);
        good5.setImages(images5);
        good5.setSpecification("俗称白煤或红煤。是煤化程度最大的煤。无烟煤固定碳含量高，挥发分产率低，密度大，硬度大，燃点高，燃烧时不冒烟。黑色坚硬，有金属光泽。");
        good5.setHeadValue("破碎率+磨损率/% ≤ 3 密度/g·㎝31.4~1.6 挥发分﹤10% 含泥量/% ≤ 4 盐酸可容率/% ≤ 3.5");
        goodService.update(good5);
        
        Good good6 = goodService.getById(5);
        good6.setImages(images6);
        good6.setSpecification("俗称白煤或红煤。是煤化程度最大的煤。无烟煤固定碳含量高，挥发分产率低，密度大，硬度大，燃点高，燃烧时不冒烟。黑色坚硬，有金属光泽。");
        good6.setHeadValue("破碎率+磨损率/% ≤ 3 密度/g·㎝31.4~1.6 挥发分﹤10% 含泥量/% ≤ 4 盐酸可容率/% ≤ 3.5");
        goodService.update(good6);
    }*/

    @Test public void addPrice()
    {
       /* Price price = new Price();
//        price.setGoodId(2);
        price.setPrice(1080.0*0.95);
        price.setGrade(gradeService.getById(2));
        priceService.save(price);*/
    }
    //单元测试
    @Test public void gsTest()
    {
       // goodService.getByName("abc");
    }
    
    @Test public void modifyPrice()
    {
//        List<Good> list = goodService.findAll();
//        for(Good good : list)
//        {
//            Set<Price> prices = new HashSet<Price>();
//            Price p1 = new Price();
//            p1.setGrade(gradeService.getById(1));
//            p1.setPrice((double)good.getGoodId()*60);
//            
//            Price p2 = new Price();
//            p2.setGrade(gradeService.getById(21));
//            p2.setPrice((double)good.getGoodId()*55);
//           
//            Price p3 = new Price();
//            p3.setGrade(gradeService.getById(22));
//            p3.setPrice((double)good.getGoodId()*50);
//            
//            prices.add(p1);
//            prices.add(p2);
//            prices.add(p3);
//            
//            good.setPrices(prices);
//            goodService.update(good);
//        }
       // Price price = priceService.getById(112);
//        price.setPriceName("三类价格");
       // price.setGrade(gradeService.getById(22));
       // priceService.modify(0,price);
    }
    
    @Test public void addGrade()
    {
       /* Grade grade = new Grade();
        
        grade.setGradeName("默认级别");
        grade.setGradeNum(0);*/
        
//        Grade grade2 = new Grade();
//        
//        grade2.setGradeName("三级");
//        grade2.setGradeNum(3);
        
       // gradeService.save(grade);
//        gradeService.save(grade2);
    }
    
    @Test public void modifyImage()
    {
        /*List<Image> images = imageService.findAll();
        for(Image img : images)
        {
            String src = img.getImagePath();
            img.setImagePath("c" + src.substring(1));
            imageService.update(img);
        }*/
    }
   /* @Test public void addStorage()
    {
        Storage storage = new Storage();
        storage.setStorageName("测试仓库");
        storage.setStorageSpecification("5*5*5");
        storage.setStockIniAmount(0.0);
        storage.setStockAmount(0.0);
        storage.setStockMaxAmount(10000.0);
        storage.setOwer("admin");
        storage.setStorageAddress("陕西省西安市");
        
        storageService.save(storage);
    }*/
    
    @Test public void test()
    {
        System.out.println("测试成功");
    }
}