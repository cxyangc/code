package com.blues.hades.database.oracle.dao;

import java.util.List;
import java.util.Map;

public interface AllObjectsDao {
	/**
	 * ���ݲ���ȡallObjects�е�����
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> selectAllObjects(Map map);
	/**
	 * ������л���
	 */
	void clearAllCache();
	/**
	 * ����TABLE ��ѯtable��������
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> selectColumnsByTableName(Map map);
	/**
	 * ����TABLE��ѯtable����������
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> selectTableByTableName(Map map);

}
