package com.blues.hades.util;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.Map;
import java.util.Properties;

/** 
 * @Description: 配置 读取properties 文件
 * @author Administrator蔡新阳
 * @version V1.0
 * @Date 2014-6-27-上午10:24:26 
 */
public class SysProperty {
	/**
	 * 通过key得到properties的值
	 * @Title: getProperty 
	 * @Description: 默认文件的读取（系统文件默认配置文件名称：default.properties）
	 * @param fileName 文件名称
	 * @param key    关键字
	 * @return String    返回类型
	 */
	public String getProperty(String fileName,String key){
		Properties prop = new Properties(); // 得到java文件的properties类
		if(fileName == null){
			fileName = "/default.properties";
		}
		InputStream in = getClass().getResourceAsStream(fileName);
		String result = null;
		try {
			prop.load(in);
			result = prop.getProperty(key);
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				if( in!=null) in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	/**
	 * 重写getProperty方法，得到系统默认值
	 * @Title: getProperty 
	 * @param key 关键字
	 * @param @return    设定文件 
	 * @return String    返回类型
	 */
	public String getProperty(String key){
		return getProperty(null, key);
	}
	/**
	 * 设置属性值，添加属性值
	 * map 要添加的键值对
	 * recover 是否覆盖，默认是true,覆盖
	 */
	public boolean setProperty(Map map,boolean recover){
		return setProperty(null,map,recover);
	}
	/**
	 * 设置属性值，添加属性值
	 * name 文件名称，为空时默认是系统文件路径default.properties
	 * map 要添加的键值对
	 * recover 是否覆盖，默认是true,覆盖
	 */
	public boolean setProperty(String fileName,Map map,boolean recover){
		Properties prop = new Properties(); // 得到java文件的properties类
		if(fileName==null){
			fileName = "/default.properties";
		}
		InputStream in = getClass().getResourceAsStream(fileName);
		OutputStream out = null;
		try {
			prop.load(in);
			// 新增之前必须要先读取以前的内容并进行保存
			Enumeration<?> enu = prop.propertyNames();
			while(enu.hasMoreElements()){ // 遍历枚举类型
				String nextEle = (String) enu.nextElement();
				if(map.containsKey(nextEle)){ // 如果map中包含这个key的话
					if(!recover){ // 如果不覆盖的话
						//不覆盖默认是追加
						map.put(nextEle, prop.getProperty(nextEle)+","+map.get(nextEle));
						continue;
					}else{//覆盖，map中已经有了，不做任何操作，直接跳过
						continue;
					}
				}else{
					map.put(nextEle, prop.getProperty(nextEle));
				}
			}
				prop.putAll(map);
				out = new FileOutputStream(getClass().getResource("/"+fileName).getFile());
				prop.store(out, "测试");
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				if(in!=null) in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
}
