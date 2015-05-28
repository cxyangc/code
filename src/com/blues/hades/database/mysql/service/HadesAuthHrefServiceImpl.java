package com.blues.hades.database.mysql.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.blues.hades.database.mysql.dao.HadesAuthHrefDao;

public class HadesAuthHrefServiceImpl implements HadesAuthHrefService {
	public HadesAuthHrefDao dao;

	public HadesAuthHrefDao getDao() {
		return dao;
	}

	public void setDao(HadesAuthHrefDao dao) {
		this.dao = dao;
	}

	@Override
	public List<Map<String, Object>> selectHrefInfo(String userId) {
		return dao.selectHrefInfo(userId);
	}
}
