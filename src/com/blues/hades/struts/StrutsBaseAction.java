package com.blues.hades.struts;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.blues.hades.ibatis.NamedParameter;
import com.opensymphony.xwork2.ActionSupport;

public class StrutsBaseAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected Map<String, Object> getParamtersMap(NamedParameter ... namedParameter){
		Map<String, Object> map = new HashMap<String, Object>();
		for(NamedParameter n: namedParameter){
			map.put(n.getKey(),n.getValue());
		}
		return map;
	}
	protected NamedParameter $(Object key,Object value){
		return new NamedParameter(key.toString(),value);
	}
	protected HttpServletRequest getRequest(){
		return ServletActionContext.getRequest();
	}
	protected HttpServletResponse getResponse(){
		return ServletActionContext.getResponse();
	}
	/**
	 * 分页模型解析处理
	 */
	protected Map<String,Object> paginationMap(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String a = request.getParameter("recordNum");
		Map<String, Object> map = new HashMap<String, Object>();
		int textJumpPage = Integer.parseInt(null == getRequest().getParameter("textJumpPage") || "".equals(getRequest().getParameter("textJumpPage"))? "1":getRequest().getParameter("textJumpPage"));
		int recordNum = Integer.parseInt(null == getRequest().getParameter("recordNum") || "".equals(getRequest().getParameter("recordNum"))? "10":getRequest().getParameter("recordNum"));
		int skip = (textJumpPage-1)*recordNum;
	//	int max = skip + recordNum; 是从skip开始数，最多多少个，这里存放的应该是recordNum
		map = getParamtersMap($("currentPageNum",(textJumpPage-1)),$("textJumpPage",""),
				$("recordNum",recordNum),$("skip",skip),$("max",recordNum));
		return map;
	}
}
