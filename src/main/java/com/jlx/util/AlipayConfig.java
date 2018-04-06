package com.jlx.util;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016091100482823";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCXM3UsvpjZio1+w7Syc+MMGbgwfARhzC1OZt/XtjEi+3cC5JxN8a75S6kRiX1hKQzPt28z9VN7TBys28/SWuEfBvvI2kZoGhH+6Ty9c7Yo6fqCw0X19ckeCOq7H291tLiJSq5lYR7BWUuysZiu8Q9ODZZXw2U8Vo21CXA7cxLbegdTUPx1p9x1LvUWqEy+LJs8B6OysiuErUROavIWxG8ewQ5IstI2a8JisqkX+mEGW+b5bSUgVfB5xHvIYqp7GaVoBndmRdocnA4qtYUYs07MH23KYMGLhFlO0jbQpqghgdGBL8JDunwspHRzVc7ta2owoENloxLlghoF4EhjCYUDAgMBAAECggEBAICcsrUGwvl4U3dafR+2V5D5Z6VGOGv/wyIHe6v/O7in8cmyMApU5CMF6qASNWYqBs3BGIQ3z3T3fwTCTPp/dzJvPEjS8kSmuFv+hT4ZaP9QV1hXRfE7yoET0KauzJ5wxO9zaPivLfwFOtCbJGbagcxA3nt0p241qYAusRrAfW/WApmu91zCbssgtxpEONpnxZPf1qPUji7U6zUe89U9UqN9hUQpbFiAklTpovTxrBVR9nh5eRi/D/RshkX1bSjU7Fhb+fvWHlkOQoPYCi3e5ogpvOjRdzarop9LmqSjx2EUrhyTZ4+9YXgtgRCH4iK3VL2YnEOD8MI+sOPuyCOGLRECgYEA2JFcgIn/iCRIjwzRBF4u4Y1yfbZx1WpSvYlnNKComG18b7ddtrWM+qdp/irAjDXhuiPlMdvVtY+aTgqKOdVIaDjZ/eS7cPnboDfNfkrPIcQl3AS7RaN3vqv29shqYCf92ovF759Qra4dvmzvZGrPh2MW2t1SqvDCS3rJOVNHkr8CgYEAsrs5iaJgDvc73ASp+sNPQZ+kX7rce3MzFoQpeZGL+RNW7grzXQ26m5V/uGN0jWjNXpNPmvBoIHKBto1Jzv1o4Q7E756ntVyhNEBR8Trxe3+vQwMk60SgEI+h2OE3vBcuYxdjnQubL6sfKxTcf5FJyb5Gasg4ENvCvZqtfd8PUr0CgYEAyHzxlLGsVV25qmykB5Ylcnue9VB0W609gef1GlxtGAervkSTxjSWmeloj3sGnAa5vLfEU37/fkC+CedqBZY0nP+cl5YsDK/SqaVfYL5iuRC8N85NjG+DyImsbNQm3nPHZ44kJOxpJRBeys5QZLcY/m42V1GzWTrftD6skJxPU0MCgYAHhjhC4hIXLzNW7N9XDjfc9GKQISa9D7l73i58zrLM1pKXTOC37ycG+8E3uwAiH+Jdc+grBqnri8aIL+SGkUaECwIhcFVxHigvMfIBLNETuOlg8dXxDZ+LcvCGV9znzzYFt+tapi1vUU3rm2I5AJ3Rn3AJeMpbc1T8dHGPVf+oJQKBgC5fn/GkV/WxTKmeOunxfDHHJ6O9ruJto3+ujzIn5n14UxjiHWF3kKEmF2OhXsULNvP72lVbcIKoBfDFKP62jNg4XyUEcpf0fBG98KPahLaVLTnWENQj1V3mlhskBEvBVm+K44hiyb9eKxsEZ7HpIpQhZBeRDwV2X2vY2wW7Sfr2";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAz9jdbCcyTLBACLeq0HgBbKAzg5UeI8ZHlmHnkxikV+TYyUhbWM/FGZbEvaK33HydzxGDH5MhcujUxoQ59ZWYcv/Pmz1pbHiE3z557QFri4JOaRsJ1Whi9CFM+8O4DfhLbx0jP2Gxn4uf7g8WNioS7A28Th9KLn5EQBnn9GIJSBNuVgINHAE0PekautSEnu/mEAPrW5W972LFbh7EbjMlx6mRUSATGko2ujKK0NqD+as98Vggb5NE6Wr/pDehpUYmIMUXyCvFv6nwOEBn7rDvSxCoE9PAJZfPcD4a0tY7fn+DCq6ncjDVE7FAm5s+3UJ/r0IcEopS0p/12Q4zIRSsKwIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://20103bb459.imwork.net/onlineshoeshop/order_changeBuyStatus";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8081/onlineshoeshop/front/successBuy.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

