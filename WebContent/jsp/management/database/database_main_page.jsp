<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="robots" content="noindex,nofollow" />
<title>数据库查询</title>
<script type="text/javascript">
	var frame_content = 0;
	var frame_navigation = 0;
	function getFrames() {
	    frame_content = window.frames[1];
	    frame_navigation = window.frames[0];
	}
	var onloadCnt = 0;
	var onLoadHandler = window.onload;
	window.onload = function() {
	    if (onloadCnt == 0) {
	        if (typeof(onLoadHandler) == "function") {
	            onLoadHandler();
	        }
	        if (typeof(getFrames) != 'undefined' && typeof(getFrames) == 'function') {
	            getFrames();
	        }
	        onloadCnt++;
	    }
	};
</script>
</head>
<frameset rows="47,*,35">
	<frame src="<%=request.getContextPath()%>/jsp/management/database/top_vista.jsp" frameborder="0" noresize="noresize">
	<frameset cols="400,*" rows="*"  id="mainFrameset" framespacing="5" bordercolor="#008000">
		<frame id="frame_navigation" src="navigation.jsp?db=EHR"  name="frame_navigation" frameborder="0">
		<frame id="frame_content" src="db_structure.jsp?db=EHR"  name="frame_content" frameborder="0"> 
		<noframes>
			<body>
	          		 更适合在支持&lt;b&gt;框架&lt;/b&gt;的浏览器中使用。&lt;/p&gt;
			</body>
		</noframes>
	</frameset>
	<frame src="<%=request.getContextPath()%>/jsp/management/database/bottom.jsp" frameborder="0" noresize="noresize">
</frameset>
</html>