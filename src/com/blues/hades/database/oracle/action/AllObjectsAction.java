package com.blues.hades.database.oracle.action;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.blues.hades.database.oracle.service.AllObjectsService;
import com.blues.hades.struts.StrutsBaseAction;
import com.blues.hades.util.JsonUtil;
import com.opensymphony.xwork2.ActionSupport;

public class AllObjectsAction extends StrutsBaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public AllObjectsService service;
	public AllObjectsService getService() {
		return service;
	}
	public void setService(AllObjectsService service) {
		this.service = service;
	}
	public void selectAllObjects() throws IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		String OBJECT_TYPE = request.getParameter("OBJECT_TYPE");
		String OWNER = request.getParameter("OWNER");
		Map<String, Object> map = this.getParamtersMap($("OBJECT_TYPE",OBJECT_TYPE),$("OWNER",OWNER));
		try{
			List<Map<String , Object >> list = service.selectAllObjects(map);
			response.getWriter().write(JsonUtil.convertToJSON(list));
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void clearAllCache(){
		service.clearAllCache();
	}
	/**
	 * 根据表名称查询表中的数据
	 */
	public String selectTableByTableName() throws Exception{
		String tableName = getRequest().getParameter("tableName");
		if(null == tableName || "".equals(tableName)){
			return SUCCESS;
		}
		Map<String,Object> paginationMap = paginationMap();
		Map<String,Object> map = this.getParamtersMap($("tableName",tableName),$("skip",paginationMap.get("skip")),$("max",paginationMap.get("max")));
		
		List<Map<String, Object>> columns = service.selectColumnsByTableName(map);
		List<Map<String, Object>> result = service.selectTableByTableName(map);
		map.put("sysCountSum", true);
		map.put("skip", 0);
		List<Map<String, Object>> sysCountSum = service.selectTableByTableName(map);
		paginationMap.put("getCountPage", sysCountSum.size()>0?sysCountSum.get(0).get("CEIL"):1);
		paginationMap.put("sysCountSum", sysCountSum.size()>0?sysCountSum.get(0).get("COUNT"):0);
		getRequest().setAttribute("columns", columns);
		getRequest().setAttribute("list", result);
		getRequest().setAttribute("paginationMap", paginationMap);
		return SUCCESS;
	}
	/**
	 * 插入或更新数据
	 * @throws IOException 
	 */
	public void insertOrUpdateData() throws IOException{
		Map<String,Object> map = getParamtersMap(
				$("tableName",getRequest().getParameter("tableName"))
				); // 得到参数map
		
		for(int i = 0 ;i  < 2; i ++){
			map.put("cell", "cell");
		}
		getResponse().setContentType("text/html;charset=utf-8");
		getResponse().getWriter().write("success");
	}
}
