package com.blues.hades.database.oracle.dao;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.blues.hades.ibatis.IbatisBaseDAO;

public class AllObjectsDaoImpl extends IbatisBaseDAO implements AllObjectsDao{
	final Logger log = Logger.getLogger(AllObjectsDaoImpl.class);
	@SuppressWarnings("unchecked")
	@Override
	public List<Map<String, Object>> selectAllObjects(Map map) {
		log.debug("selectAllObjects"+map);
		return (List<Map<String, Object>>)this.getSqlMapClientTemplate().queryForList("allObjectsDao.selectAllObjects", map);
	}

	@Override
	public void clearAllCache() {
		log.debug("clearAllCache");
		this.getSqlMapClientTemplate().queryForList("allObjectsDao.clear_all_model_cache");
		
	}

	@Override
	public List<Map<String, Object>> selectColumnsByTableName(Map map) {
		log.debug("selectColumnsByTableName"+map);
		return (List<Map<String, Object>>)this.getSqlMapClientTemplate().queryForList("allObjectsDao.selectColumnsByTableName", map);
	}

	@Override
	public List<Map<String, Object>> selectTableByTableName(Map map) {
		log.debug("selectTableByTableName"+map);
		int skip=0,max=0;
		try{
			skip = (int) map.get("skip");
			max = (int) map.get("max");
		}catch(Exception e){
			
		}
		List<Map<String, Object>> list = (List<Map<String, Object>>)this.getSqlMapClientTemplate().queryForList("allObjectsDao.selectTableByTableName", map,skip,max);
		log.debug("selectTableByTableName:result£º"+list);
		return list;
	}

}
