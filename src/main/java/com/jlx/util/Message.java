package com.jlx.util;

import java.util.Random;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

public class Message {
	public static String regionId = "cn-hangzhou";// 机房信息,可以不用更改
	/********** 需要准备的参数 **************/
	public static String accessKey = "LTAIxRNT8m5D6Wid";// 需要修改
	public static String accessSecret = "rQLeIPFklR72vcxGTRc9bNUAT0vq0J";// 需要修改
	public static String code = "SMS_126781319";// 模板code
	public static String signName = "网上鞋店";// 短信签名
	static final String product = "Dysmsapi";//短信API产品名称（短信产品名固定，无需修改）
	static final String domain = "dysmsapi.aliyuncs.com";//短信API产品域名（接口地址固定，无需修改）

	/**********************************/
	public static void main(String[] args) {
		String sendCode = getCode();
		String jsonstr = "{\"code\":\"" + sendCode + "\"}";
        send("15335279506",jsonstr,code,signName);
	}

	public static String send(String phone, String jsonStr, String code, String signName) {

		try {
			IClientProfile profile = DefaultProfile.getProfile(regionId, accessKey, accessSecret);
			DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", product, domain);
			IAcsClient client = new DefaultAcsClient(profile);
			SendSmsRequest request = new SendSmsRequest();
			// 使用post提交
			request.setMethod(MethodType.POST);
			// 必填:待发送手机号。支持以逗号分隔的形式进行批量调用，批量上限为1000个手机号码,批量调用相对于单条调用及时性稍有延迟,验证码类型的短信推荐使用单条调用的方式
			request.setPhoneNumbers(phone);
			// 必填:短信签名-可在短信控制台中找到
			request.setSignName(signName);
			// 必填:短信模板-可在短信控制台中找到
			request.setTemplateCode(code);
			// 可选:模板中的变量替换JSON串,如模板内容为"亲爱的${name},您的验证码为${code}"时,此处的值为
			// 友情提示:如果JSON中需要带换行符,请参照标准的JSON协议对换行符的要求,比如短信内容中包含\r\n的情况在JSON中需要表示成\\r\\n,否则会导致JSON在服务端解析失败
			request.setTemplateParam(jsonStr);
			SendSmsResponse sendSmsResponse = client.getAcsResponse(request);
			if (sendSmsResponse.getCode() != null && sendSmsResponse.getCode().equals("OK")) {
				System.out.println(sendSmsResponse.getMessage());
				return code;
			} 
		} catch (ClientException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "1";
	}

	public static String getCode() {
		String s = "0123456789";
		String a1 = "";
		char[] a = s.toCharArray();
		for (int c = 0; c < 6; c++) {
			int b = new Random().nextInt(10);
			a1 += a[b];
		}
		return a1;
	}

}
