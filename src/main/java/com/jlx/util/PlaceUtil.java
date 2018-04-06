package com.jlx.util;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.*;
import java.net.URL;
import java.nio.charset.Charset;
public class PlaceUtil {

    public static  void  main(String args[]) throws IOException {
        JSONObject json = readJsonFromUrl("http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=");
        System.out.println(json);
        System.out.println(json.get("city"));

    }
   
    public static JSONObject getPath() throws JSONException, IOException{
    	JSONObject json = readJsonFromUrl("http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=json&ip=");
    	return json;
    }
    
    private static String readAll(Reader rd) throws IOException {
        StringBuilder sb = new StringBuilder();
        int cp;
        while ((cp = rd.read()) != -1) {
            sb.append((char) cp);
        }
        return sb.toString();
    }

    public static JSONObject readJsonFromUrl(String url) throws IOException, JSONException {
        InputStream is = new URL(url).openStream();
        try {
            BufferedReader rd = new BufferedReader(new InputStreamReader(is, Charset.forName("UTF-8")));
            String jsonText = readAll(rd);
            JSONObject json = new JSONObject(jsonText);
            return json;
        } finally {
            is.close();
            // System.out.println("同时 从这里也能看出 即便return了，仍然会执行finally的！");
        }
    }
}
