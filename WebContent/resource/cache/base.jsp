<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String global_ctxPath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/resource/cache/baseSource.jsp"></jsp:include>
<style type="text/css">
	.buttoncss {
		font-family: "tahoma", "宋体";
		font-size: 9pt;
		color: #003399;
		color: #006699;
		border-bottom: #93bee2 1px solid;
		background-image: url(../images/bluebuttonbg.gif); <!--
		background-color: white; -->
		cursor: pointer;
		font-style: normal;
		width: 60px;
		height: 22px;
	}
	
	body {
		background-image: url(<%=request.getContextPath()%>/resource/images/forenoon_bak3.jpg);
		background-repeat: repeat;
	}
</style>
</head>
<body>
	<div style="height:20px;width: 98%" align="right">
		<a style="margin-bottom:0px;" href="http://<%=request.getLocalAddr() %>:<%=request.getLocalPort() %>/superTools2.0/jsp/management/database/database_main_page.jsp" target="_blank" class="buttoncss">OSHR</a>
		&nbsp;&nbsp;
		<a style="margin-bottom:0px;" href="http://<%=request.getLocalAddr() %>:<%=request.getLocalPort() %>/superTools2.0/jsp/tools/baseInfo/changePassWord/searchBaseInfo.jsp" target="_blank" class="buttoncss">EHR</a>
		&nbsp;&nbsp;
		<a style="margin-bottom:0px;" href="http://<%=request.getLocalAddr() %>:<%=request.getLocalPort() %>/superTools2.0/jsp/tools/baseInfo/changePassWord/searchOrgInfo.jsp" target="_blank" class="buttoncss" title="organization">ORGANIZATION</a>
		&nbsp;&nbsp;
		<a style="margin-bottom:0px;" href="http://<%=request.getLocalAddr() %>:<%=request.getLocalPort() %>/superTools2.0/system/util/changeSql/changeSql.jsp" target="_blank" class="buttoncss">DEBUG</a>
		&nbsp;&nbsp;
		<a style="margin-bottom:0px;" href="<%=request.getContextPath()%>/index.jsp" target="_blank" class="buttoncss">首页</a>
	</div>
</body>
</html>