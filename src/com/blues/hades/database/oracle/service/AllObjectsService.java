package com.blues.hades.database.oracle.service;

import java.util.List;
import java.util.Map;

public interface AllObjectsService {
	/**
	 * ���ݹ̶�����ȡallObjects�е�����
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> selectAllObjects(Map map);
	/**
	 * ������л���
	 */
	void clearAllCache();
	/**
	 * ����TABLE_NAME��ѯ��table��������
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> selectColumnsByTableName(Map map);
	/**
	 * ����TABLENAME��ѯtable������
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> selectTableByTableName(Map map);

}
