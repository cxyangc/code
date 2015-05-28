<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>表详细信息</title>
<jsp:include page="/resource/cache/base.jsp"></jsp:include>
<script type="text/javascript">
	
	var goPage = function(){
		divMask.show();
		setTimeout('alerts("页面跳转中，请稍后。。。")', 1500);
		document.getElementById("form").submit();
	}
	/**
	* 新增几行数据
	*/ 
	var addRow = function(){
		// 先拿到table
		//$("#main_table")
		var mainTable = document.getElementById("main_table");
		var rowCount = mainTable.rows.length; // 得到行数
		var colCount = mainTable.rows[0].cells.length; // 得到列数
		var row = document.getElementById("main_table").insertRow(mainTable.rows.length);
		for(var i = 0; i < colCount; i ++){
			row.insertCell(i).innerHTML='<input type="text" value="" name="cell'+rowCount+'col'+i+'" id="cell'+rowCount+'col'+i+'">';
		}
		// 对序号进行单独处理
		row.cells(0).innerHTML='<input readonly="readonly" class="readonly" title="不可修改" type="text" value="'+(rowCount+${paginationMap.recordNum*paginationMap.currentPageNum})+'" name="cell'+rowCount+'col'+i+'" id="cell'+rowCount+'col'+i+'">';
		document.getElementById("saveButton").style.display="inline";		
	}
	function save(){
		// 进行ajax请求来插入和保存数据
		$.ajax({
     		url:"<%=request.getContextPath()%>/allObjectsAction_insertOrUpdateData",
     		data:$('#form').serialize(),
     		success:function(data){
				alerts('保存成功',goPage);
      		},
     		cache: false,
     		error:function(xhr, type, exception){alert(exception+"\r"+xhr.responseText);}
      		//xhr.responseText
    	});
	}
</script>
</head>
<body>
	<form id="form" action="<%=request.getContextPath() %>/allObjectsAction_selectTableByTableName_tableDetail">
	<input type="hidden" name="tableName" value="${param.tableName }">
	<ul>
		<li style="float: left"><a href="javascript:void(0)" onclick="addRow()">查找</a></li>
		<li style="float: left;margin-left:5px;"><a href="javascript:void(0)" onclick="addRow()">新增</a></li>
		<li style="float: left;margin-left:5px;"><a href="javascript:void(0)">修改</a></li>
	</ul>
	<table id="main_table" border="1" cellpadding="0" cellspacing="0" width="98%">
		 	<tr>
		 		<th width="85px;">
		 			序号
		 		</th>
		 		<c:forEach items="${columns}" var="item">
		 			<th width="150">
		 				${item}
		 			</th>
		 		</c:forEach>
		 	</tr>
		<tbody>
			<c:forEach items="${list}" var="list1" varStatus="status">
				<tr>
					<td>${status.index+1+(paginationMap.currentPageNum*paginationMap.recordNum) }
					</td>
		 			<c:forEach items="${columns}" var="list2">
			 			<td width="150">
			 				${list1[list2]}
			 			</td>
		 			</c:forEach>
				</tr>
		 	</c:forEach>
		</tbody>
	</table>
	<input id="saveButton" type="button" value="保存" onclick="save()" style="display:none">
	<jsp:include page="/resource/cache/pagination.jsp"></jsp:include>
	</form>
</body>
</html>