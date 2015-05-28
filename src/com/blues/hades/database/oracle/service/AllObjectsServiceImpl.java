package com.blues.hades.database.oracle.service;

import java.util.List;
import java.util.Map;

import com.blues.hades.database.oracle.dao.AllObjectsDao;

public class AllObjectsServiceImpl implements AllObjectsService{
	public AllObjectsDao dao;

	public AllObjectsDao getDao() {
		return dao;
	}

	public void setDao(AllObjectsDao dao) {
		this.dao = dao;
	}

	@Override
	public List<Map<String, Object>> selectAllObjects(Map map) {
		return dao.selectAllObjects(map);
	}

	@Override
	public void clearAllCache() {
		dao.clearAllCache();
	}

	@Override
	public List<Map<String, Object>> selectColumnsByTableName(Map map) {
		return dao.selectColumnsByTableName(map);
	}

	@Override
	public List<Map<String, Object>> selectTableByTableName(Map map) {
		return dao.selectTableByTableName(map);
	}
}
