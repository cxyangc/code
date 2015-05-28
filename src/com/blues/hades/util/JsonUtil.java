package com.blues.hades.util;

import java.util.Iterator;
import java.util.List;
import java.util.Map;



/** 
 * @Description: ��Listת��Ϊjson����
 * @author ������
 * @version V1.0
 * @Date 2015-4-3-����12:49:47 Administrator
 */
public class JsonUtil {
	/**
	 * ת���Ϊjson
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
			// �����һ���ַ�����ȡ
			json = new StringBuffer(json.substring(0, json.length()-1));
			json.append("},");
		}
		json = new StringBuffer(json.substring(0, json.length()-1));
		json.append("}");//����������˾Ͳ���Ҫ������Ӷ����ˡ�
		return json.toString();
	}
}
