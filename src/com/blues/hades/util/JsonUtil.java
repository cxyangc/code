package com.blues.hades.util;

import java.util.Iterator;
import java.util.List;
import java.util.Map;



/** 
 * @Description: 将List转变为json类型
 * @author 蔡新阳
 * @version V1.0
 * @Date 2015-4-3-下午12:49:47 Administrator
 */
public class JsonUtil {
	/**
	 * 转变成为json
	 */
	public static String convertToJSON(List<Map<String, Object>> list){
		if(null==list || list.size()==0) return "{}";
		int num = 0;
		StringBuffer json = new StringBuffer("{");
		Iterator<Map<String,Object>> it = list.iterator();
		while(it.hasNext()){
			json.append("\"").append(num++).append("\":{");
			Map<String,Object> map = it.next();
			for(Map.Entry<String,Object> entry: map.entrySet()){
				json.append("\"").append(entry.getKey()).append("\":\"").append(entry.getValue()).append("\",");
			}
			// 将最后一个字符串截取
			json = new StringBuffer(json.substring(0, json.length()-1));
			json.append("},");
		}
		json = new StringBuffer(json.substring(0, json.length()-1));
		json.append("}");//在这里结束了就不需要进行添加逗号了。
		return json.toString();
	}
}
