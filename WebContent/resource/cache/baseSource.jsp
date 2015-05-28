<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String global_ctxPath = request.getContextPath();
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery/jquery-1.7.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/alert/divPanel.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/style/default/css/default.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/style/default/css/style.css" />
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
	img{
		cursor: pointer;
	}
</style>
<script type="text/javascript">
	var global_ctxPath = '<%=request.getContextPath()%>';
</script>
</head>
<body>
</body>
</html>