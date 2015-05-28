package com.blues.hades.database.mysql.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface HadesAuthHrefService {

	List<Map<String, Object>> selectHrefInfo(String userId);

}
