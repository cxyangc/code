package com.blues.hades.database.mysql.dao;

import java.util.List;
import java.util.Map;



import com.blues.hades.ibatis.IbatisBaseDAO;

public class HadesAuthHrefDaoImpl extends IbatisBaseDAO  implements HadesAuthHrefDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> selectHrefInfo(String userId) {
		Map<String, Object> map = getParamtersMap($("userId",userId),$("userName",""));
		List<Map<String, Object>> list =  (List<Map<String, Object>>)this.getSqlMapClientTemplate().queryForList("hadesAuthHrefDao.selectHrefInfo", map);
		return list;
	}

}
