package com.blues.hades.database.oracle.dao;

import java.util.List;
import java.util.Map;

public interface AllObjectsDao {
	/**
	 * 根据参数取allObjects中的内容
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> selectAllObjects(Map map);
	/**
	 * 清空所有缓存
	 */
	void clearAllCache();
	/**
	 * 根据TABLE 查询table的所有列
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> selectColumnsByTableName(Map map);
	/**
	 * 根据TABLE查询table的数据内容
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> selectTableByTableName(Map map);

}
