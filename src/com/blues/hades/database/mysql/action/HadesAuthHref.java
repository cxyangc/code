package com.blues.hades.database.mysql.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.blues.hades.database.mysql.service.HadesAuthHrefService;
import com.blues.hades.util.JsonUtil;
import com.opensymphony.xwork2.ActionSupport;
/**
 * mysql中获取首页页面的地址url的工具类
 * @author admin
 *
 */
public class HadesAuthHref extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public HadesAuthHrefService service;
	public HadesAuthHrefService getService() {
		return service;
	}
	public void setService(HadesAuthHrefService service) {
		this.service = service;
	}
	public void selectHrefInfo() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String userId = request.getParameter("userId");
		List<Map<String,Object>> result = null;
		try{
			result = service.selectHrefInfo(userId);
		}catch(Exception e){
			e.printStackTrace();
		}
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().write(JsonUtil.convertToJSON(result));
	}
}
