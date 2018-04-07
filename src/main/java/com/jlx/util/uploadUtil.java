package com.jlx.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public enum uploadUtil {
    touxiang("D:\\tomcat\\apache-tomcat-8.0.30\\wtpwebapps\\touxiang"),
    tupian("D:\\tomcat\\apache-tomcat-8.0.30\\wtpwebapps\\upload");
    
	private String path;
	
	private  uploadUtil(String path){
		this.path = path;
	}
	
	public  String upload(File shoePicture,String shoePictureFileName) throws IOException{
		//获取输入流
		FileInputStream fs = new FileInputStream(shoePicture);	
		
		File files = new File(path);
		
		if (!files.exists()) {
			files.mkdir();
		}
		
		String a = System.currentTimeMillis()+shoePictureFileName;
		
		FileUtils.copyInputStreamToFile(fs,new File(path,a));
		
		return a;
	}
	//修改头像
	public  void upload2(File shoePicture,String shoePictureFileName) throws IOException{
		//获取输入流
		FileInputStream fs = new FileInputStream(shoePicture);	
		
		File files = new File(path);
		
		if (!files.exists()) {
			files.mkdir();
		}		
		
		FileUtils.copyInputStreamToFile(fs,new File(path,shoePictureFileName));
		
	}
	

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

    
}
