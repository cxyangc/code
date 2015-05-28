package com.blues.hades.database.oracle.service;

import java.util.List;
import java.util.Map;

public interface AllObjectsService {
	/**
	 * 根据固定参数取allObjects中的内容
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> selectAllObjects(Map map);
	/**
	 * 清空所有缓存
	 */
	void clearAllCache();
	/**
	 * 根据TABLE_NAME查询该table的所有列
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> selectColumnsByTableName(Map map);
	/**
	 * 根据TABLENAME查询table的内容
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> selectTableByTableName(Map map);

}
