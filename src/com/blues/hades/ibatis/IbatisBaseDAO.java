package com.blues.hades.ibatis;

import java.util.HashMap;
import java.util.Map;

import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

public class IbatisBaseDAO extends SqlMapClientDaoSupport{
	protected Map<String, Object> getParamtersMap(NamedParameter ... namedParameter){
		Map<String, Object> map = new HashMap<String, Object>();
		for(NamedParameter n: namedParameter){
			map.put(n.getKey(),n.getValue());
		}
		return map;
	}
	protected NamedParameter $(Object key,Object value){
		return new NamedParameter(key.toString(),value);
	}
}
