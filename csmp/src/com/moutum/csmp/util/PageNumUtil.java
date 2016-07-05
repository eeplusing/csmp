package com.moutum.csmp.util;
/************************************************************************************
 * @Title        : PageNumUtil.java
 * @Description : 
 * @Author       : BianWeiqing
 * @DateTime     : 2015年5月19日 下午2:07:10
 * @Copyright    : 2015 Moutum All Rights Reserved
 * @version      : V1.0
 ************************************************************************************/
public class PageNumUtil
{
    public static void pageNumList(int totalPages, int nowPage)
    {
        System.out.println("T : " + totalPages + " ; N : " + nowPage);
        if(totalPages <= 6)
        {
            System.out.print("1 -> ");
            for(int i = 1 ; i <= totalPages ; i++)
            {
                System.out.print(i + " ");
            }
            System.out.println();
        }
        else
        {
            if(nowPage == 1 || nowPage == 2 || nowPage == totalPages || nowPage == totalPages - 1)
            {
                System.out.println("2 -> 1 2 3 ... " + (totalPages - 2) + " " + (totalPages - 1) + " " + totalPages);
            }
            else if(nowPage == 3)
            {
                if(nowPage < totalPages - 4)
                {
                    System.out.println("3 -> 1 2 3 4 ... " + (totalPages - 2) + " " + (totalPages - 1) + " " + totalPages);
                }
                else
                {
                    System.out.println("4 -> 1 2 3 4 " + (totalPages - 2) + " " + (totalPages - 1) + " " + totalPages);
                }
            }
            else if(nowPage == 4)
            {
                if(nowPage < totalPages - 4)
                {
                    System.out.println("5 -> 1 2 3 4 5 ... " + (totalPages - 2) + " " + (totalPages - 1) + " " + totalPages);
                }
                else
                {
                    if(nowPage == totalPages - 4)
                    {
                        System.out.println("6 -> 1 2 3 4 5 " + (totalPages - 2) + " " + (totalPages - 1) + " " + totalPages);
                    }
                    else if(nowPage == totalPages - 3)
                    {
                        System.out.println("7 -> 1 2 3 4 " + (totalPages - 2) + " " + (totalPages - 1) + " " + totalPages);
                    }
                    
                }
            }
            else if(nowPage == 5)
            {
                if(nowPage < totalPages - 4)
                {
                    System.out.println("8 -> 1 2 3 4 5 6 ... " + (totalPages - 2) + " " + (totalPages - 1) + " " + totalPages);
                }
                else
                {
                    if(nowPage == totalPages - 4)
                    {
                        System.out.println("9 -> 1 2 3 4 5 6 " + (totalPages - 2) + " " + (totalPages - 1) + " " + totalPages);
                    }
                    else if(nowPage == totalPages - 3)
                    {
                        System.out.println("10 -> 1 2 3 4 5 6 " + (totalPages - 1) + " " + totalPages);
                    }
                    else
                    {
                        System.out.println("11 -> 1 2 3 4 5 6 " + totalPages);
                    }
                }
            }
            else
            {
                if(nowPage < totalPages - 4)
                {
                    System.out.println("12 -> 1 2 3 ... " + (nowPage - 1) + " " + nowPage + " " + (nowPage + 1) + " ... " + (totalPages - 2) + " " + (totalPages - 1) + " " + totalPages);
                }
                else
                {
                    if(nowPage == totalPages - 4)
                    {
                        System.out.println("13 -> 1 2 3 ... " + (nowPage - 1) + " " + nowPage + " " + (nowPage + 1) + " " + (totalPages - 2) + " " + (totalPages - 1) + " " + totalPages);
                    }
                    else if(nowPage == totalPages - 3)
                    {
                        System.out.println("14 -> 1 2 3 ... " + (nowPage - 1) + " " + nowPage + " " + (totalPages - 2) + " " + (totalPages - 1) + " " + totalPages);
                    }
                    else
                    {
                        System.out.println("15 -> 1 2 3 ... " + (nowPage - 1) + " " + nowPage + " " + (totalPages - 1) + " " + totalPages);
                    }
                }
            }
        }
    }
    
    public static void main(String[] args)
    {
        for(int i = 0; i < 20; i ++)
        {
            int totalPages = (int)(Math.random() * 50) + 1;//随机产生一个1-50的数
            int nowPage = (int)(Math.random() * totalPages) + 1;//随机产生一个1-50的数
            pageNumList(totalPages, nowPage);
        }
    }
}

