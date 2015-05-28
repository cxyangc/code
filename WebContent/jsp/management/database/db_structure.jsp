<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/resource/cache/base.jsp"></jsp:include>
<style type="text/css">

	.active li{
		float: left;
		list-style: none;
		vertical-align: center;
	}
	.odd tr{
		background:#E5E5E5;
	}
	.even{
		text-align: left;
	}
</style>
<script type="text/javascript">

	$(function(){ 
		  $.ajax({
			     url:"<%=request.getContextPath()%>/allObjectsAction_selectAllObjects",
						data : {
							OBJECT_TYPE : 'TABLE',
							OWNER : 'EHR'
						},
						dataType : 'json',
						success : function(data) {
							var count = 0;
							$.each(data, function(k, v) {
								var tr = "<tr><td><input type='checkbox'></td><td><a href='javascript:void(0)' onclick='showTableDetail(this)'>" 
										+data[k].OBJECT_NAME+ "</a></td><td>"
										+"操作"+"</td><td>"
										+data[k].DATA_OBJECT_ID+"</td><td>"
										+data[k].CREATED+"</td><td>"
										+data[k].LAST_DDL_TIME+"</td><td>"
										+data[k].TIMESTAMP+"</td></tr>";
								$("#mainTable").append(tr);
								count++;
							});
						},
						cache : false,
						error : function(data) {
							alert('error');
						}
					});
		});
	var checkAll = function(obj){
		
		alerts(getOs());
		$('#mainTable input[type="checkbox"]').each(function () {
			$(this).attr('checked',obj.checked);
		});
	};
	/**
	* 查询固定TABLE的详细信息
	*/
	var showTableDetail = function(obj){
		   var form=$("<form>");//定义一个form表单
		   form.attr("style","display:none");
		   form.attr("target","frame_content");
		   form.attr("method","post");
		   form.attr("action","<%=request.getContextPath() %>/allObjectsAction_selectTableByTableName_tableDetail");
		   var input1=$("<input>");
		   input1.attr("type","hidden");
		   input1.attr("name","tableName");
		   input1.attr("value",obj.innerHTML);
		   $("body").append(form);//将表单放置在web中
		   form.append(input1);
		   form.submit();//表单提交
	}
</script>
</head>
<body>
	<div id="serviceInfo">
		<a href="db_structure.jsp?db=${param.db }" target="frame_content">
			<span>${param.db }</span>
		</a>
	</div>
	<div id="topmenucontainer">
		<ul id="topmenu" class="active">
			<li><a href="db_structure.jsp?db=${param.db }">结构</a></li>
			<li style="margin-left:5px;"><a href="db_structure.jsp?db=${param.db }">SQL</a></li>
		</ul>
	</div>
	<br>
	<div>
		<table id="mainTable" style="float:left">
			<thead>
				<tr>
					<th><input type="checkbox" value="13" onclick="checkAll(this)"></th>
					<th><a href="javascript:void(0)">表</a></th>
					<th><a href="javascript:void(0)">操作</a></th>
					<th><a href="javascript:void(0)">记录数</a></th>
					<th><a href="javascript:void(0)">创建时间</a></th>
					<th><a href="javascript:void(0)">最后修改时间</a></th>
					<th><a href="javascript:void(0)">TIMESTAMP</a></th>
					<th><a href="javascript:void(0)">多余</a></th>
					<th colspan="6">操作</th>
				</tr>
			</thead>
			<tbody>
				<tr class="odd">
					<td>3</td>
					<td>3</td>
					<td>3</td>
					<td>4</td>
					<td>3</td>
					<td>3</td>
					<td>2</td>
					<td>2</td>
					<td>2</td>
					<td>2</td>
					<td>2</td>
					<td>2</td>
				</tr>
			</tbody>
			<tbody></tbody>
		</table>
	</div>
</body>
</html>