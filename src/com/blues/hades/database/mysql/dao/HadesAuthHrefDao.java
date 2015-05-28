package com.blues.hades.database.mysql.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface HadesAuthHrefDao {

	List<Map<String, Object>> selectHrefInfo(String userId);

}
