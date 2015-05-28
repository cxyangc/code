<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.pagination{
		width: 100%;
		border: 0;
		cellspacing:0;
		cellPadding:0;
		background-color: #E1F3FD;
		color: black;
	}
	td{
		border-right-width:0px;
		border-bottom-width:0px;
	}
	table.pagination tr:hover{
		background:#E1F3FD;
    	color:   #000000;
	}
</style>
<input type="hidden" name="currentPageNum" id="currentPageNum" value="1">
<table class="pagination">
	<tr valign="middle" height="40px">
	 	<td width="45%" nowrap="nowrap">&nbsp;</td>
	 	<td width="3%" nowrap="nowrap" >第${paginationMap.currentPageNum+1}页</td>
	 	<td width="3%" nowrap="nowrap" >
	 	(共${paginationMap.getCountPage}页)</td>
	 	<td width="3%" nowrap="nowrap" >(计${paginationMap.sysCountSum}条)</td>
	 	<td width="5%" nowrap="nowrap" ><a href="javascript:void(0)" onclick="jumpPage(${paginationMap.getCountPage},1)">返回首页</a></td>
	 	<td width="5%" nowrap="nowrap" ><a href="javascript:void(0)" onclick="jumpPage(${paginationMap.getCountPage},${paginationMap.currentPageNum})">上一页</a></td>
	 	<td width="5%" nowrap="nowrap" ><a href="javascript:void(0)" onclick="jumpPage(${paginationMap.getCountPage},${paginationMap.currentPageNum+2})">下一页</a></td>
	 	<td width="5%" nowrap="nowrap" ><a href="javascript:void(0)" onclick="jumpPage(${paginationMap.getCountPage},${paginationMap.getCountPage})">返回尾页</a></td>
	 	<td width="10%" nowrap="nowrap" >跳转到
	 	<input type="text" name="textJumpPage" id="textJumpPage" value="${paginationMap.currentPageNum+1}"
	 	onkeyup='this.value=this.value.replace(/[^\d]/g,"")' style="width:40px;" autocomplete="off">
	 	&nbsp;<input type="button" value="go" onclick="jumpPage(${paginationMap.getCountPage},document.getElementById('textJumpPage').value)"
	 	style="cursor:pointer">
	 	</td>
	 	<td width="20%" nowrap="nowrap"> 每页显示：
	 	<select name="recordNum" id="recordNum" onchange="jumpPage(${paginationMap.getCountPage},1)">
	 		<option value="10">10</option>
	 		<option value="20">20</option>
	 		<option value="50">50</option>
	 		<option value="100">100</option>
	 		<option value="9999">全部</option>
	 	</select></td>
	</tr>
</table>
<table class="pagination" style="display:none">
	<tr>
		<td>没有查询到数据</td>
	</tr>
</table>
<table class="pagination" style="display:none">
	<tr>
		<td>没有初始化分页数据</td>
	</tr>
</table>
<script>
	document.getElementById("recordNum").value='${paginationMap.recordNum}';
	var jumpPage=function(countPage,jumpPageNum){
		if(jumpPageNum > countPage || jumpPageNum <=0){
			alerts("跳转超出范围");
			document.getElementById("textJumpPage").value="${paginationMap.currentPageNum+1}";
			return;
		}
		document.getElementById("textJumpPage").value=jumpPageNum;
		goPage();
	}
</script>