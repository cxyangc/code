<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>index.jsp</title>
<jsp:include page="/resource/cache/base.jsp"></jsp:include>
<script type="text/javascript">
	var contextPath = '<%=request.getContextPath()%>';

	$(function(){ 
		$.ajax({
		     url:"<%=request.getContextPath() %>/HadesAuthHref_selectHrefInfo_3",
		     type:"post",
		     data:{userId:2},
		     dataType: 'json',
			 success : function(data) {
						$.each(data, function(k, v) {
							//$.each(data[k], function(key, value) {
								var trHTML = "<tr><td align='center'>"+data[k].href_seq+"</td><td><a href='"+contextPath+data[k].href_url+"'>"+data[k].href_name+"</a></td><td>"+data[k].create_date+"</td></tr>";
								$('#table_main').append(trHTML);
							//});
						});
					},
					cache : false,
					error : function(data) {
						alert('error');
					}
				});
	});
</script>
<style type="text/css">
	.thead{
		background-color: #E0E0E0;
	}
	.td{
		width:75px;
	}
	.td1{
		width:100px;
	}	
	.td2{
		width:200px;
	}
	.td3{
		width:300px;
	}
	a {font-size:14px}   
	a:link {color: blue; text-decoration:none;} /*未访问：蓝色、无下划线*/  
	a:active:{color: red; } /*激活：红色*/   
	a:visited {color:purple;text-decoration:none;} /*已访问：purple、无下划线*/  
	a:hover{color: red; text-decoration:none;} /*鼠标移近：红色、下划线*/
</style>
</head>
<body>
	<div>
		<span class="thead">网站导航，点击一下链接直接进入相应路径</span>
		<br>
		<br>
		
		<table border="1" cellpadding="0" cellspacing="0" id="table_main">
			<thead class="thead">
				<tr>
					<td class="td">序号</td>
					<td class="td3">描述</td>
					<td class="td1">创建日期</td>
				</tr>
			</thead>
			<tr>
			</tr>
		</table>
	</div>
</body>
</html>