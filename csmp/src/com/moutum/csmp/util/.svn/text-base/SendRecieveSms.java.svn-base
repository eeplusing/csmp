package com.moutum.csmp.util;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.rmi.RemoteException;
import java.util.Properties;

import javax.xml.namespace.QName;
import javax.xml.rpc.ParameterMode;
import javax.xml.rpc.ServiceException;

import org.apache.axis.client.Call;
import org.apache.axis.client.Service;
import org.apache.axis.encoding.XMLType;

public class SendRecieveSms {
	private String endPoint;
	private String namespace;
	private String method;
	
	private static SendRecieveSms  sendRecieveSms = null;
	static Properties p = new Properties();

	public SendRecieveSms(String endPoint, String namespace, String method) {
		this.endPoint = endPoint;
		this.namespace = namespace;
		this.method = method;
	}
	
	/**
	 * 发短信
	 */
	public String sendSms(String phone, String msg, String com){
		 String strRtn = null;
		try {
			Service service = new Service();
			Call call = (Call) service.createCall();
			call.setTargetEndpointAddress(new URL(this.endPoint));
			call.setOperationName(new QName(this.namespace, method));
			call.addParameter(new QName(this.namespace, "phone"),XMLType.XSD_STRING, ParameterMode.IN);
			call.addParameter(new QName(this.namespace, "msg"),XMLType.XSD_STRING, ParameterMode.IN);
			call.addParameter(new QName(this.namespace, "com"),XMLType.XSD_STRING, ParameterMode.IN);
			call.setUseSOAPAction(true);
			call.setSOAPActionURI(namespace + method);
			call.setReturnType(XMLType.XSD_STRING);
			strRtn = call.invoke(new Object[] { phone, msg , com }).toString();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (RemoteException e) {
			e.printStackTrace();
		} catch (ServiceException e) {
			e.printStackTrace();
		}
		return strRtn;
		
	}
	
	public static String getSendSms(String phoneNo, String smsContext, InputStream inputStream)
	{
		synchronized (SendRecieveSms.class) 
		{
			if(sendRecieveSms == null)
			{
				try {
				   p.load(inputStream);
				} catch (IOException e1) {
				   e1.printStackTrace();
				}
				
				sendRecieveSms = new SendRecieveSms(
	    				"http://"+p.getProperty("message.service.host")+":"+p.getProperty("message.service.port")+"/Service.asmx",
	    				"http://qxtweb/webservices", "Sendmsg");
			}
			
			return sendRecieveSms.sendSms(phoneNo, smsContext, p.getProperty("message.service.com"));			
		}
	}
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		SendRecieveSms lmm = new SendRecieveSms(
				"http://localhost:4305/Service.asmx",
				"http://qxtweb/webservices", "Sendmsg");
		System.out.println(lmm.sendSms("18706897798", "您好，您的验证码为：【9645】", "COM3"));
	}

}
