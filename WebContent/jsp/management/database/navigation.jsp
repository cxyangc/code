<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/resource/cache/baseSource.jsp"></jsp:include>
<style type="text/css">
	.fastInput{
		width:90%;
		height: 20;
	}
	.refresh{
		float: left;
		vertical-align: bottom;
	}
</style>
<script type="text/javascript">
	$(function(){
		  $.ajax({
			     url:"<%=request.getContextPath()%>/allObjectsAction_selectAllObjects",
					data : {
						OBJECT_TYPE : 'TABLE',
						OWNER:'EHR'
					},
					dataType:'json',
					success : function(data) {
						var count = 0;
						$.each(data,function(k,v){
							var liHTML = "<li><a href='javascript:void(0);' onclick='showTableDetail(this)'>"+data[k].OBJECT_NAME+"</a></li>";
							$("#subel0").append(liHTML);
							count++;
						});
						document.getElementById("bdo").innerHTML='('+count+')';
					},
					cache : false,
					//async:false,//同步
					error : function(data) {
						alert('error');
					}
				});
	});
	
	function fast_filter(value){
		var oTarget = document.getElementById("subel0");
		if(!oTarget || !document.getElementById('fast_filter')) return false;
		if(value!=document.getElementById('fast_filter').value) return false;
		document.getElementById('fast_filter').disabled=true;
		for(var iCh in oTarget.childNodes){
			var oCh = oTarget.childNodes.item(iCh);
			if(!oCh) continue;
			if(oCh.nodeName=="LI"){
				if(value=="") oCh.style.display="";
				else{
					var i=0;
					for(var iA in oCh.childNodes){
						var oA = oCh.childNodes.item(iA);
						if(!oA) continue;

						if(oA.nodeName=="A"){
							if(i==0) i = 1;
							else{
								if(oA.innerHTML.indexOf(value)==-1) oCh.style.display="none";
								else oCh.style.display="";
							}
						}
					}
				}
			}
		}
		document.getElementById('fast_filter').disabled=false;
	//	$('#fast_filter').attr('focus','focus');
	}
	/**
	* 刷新数据查询结果
	*/
	var refreshResults = function(){
		 $.ajax({
		     url:"<%=request.getContextPath() %>/allObjectsAction_clearAllCache",
		     success:function(data){
		    	 location.reload();
		     },
		     cache: false,
		     error:function(data){alert('系统异常!');}
		    });
		
	};
	
	/**
	* 获取table的详细信息
	*/
	var showTableDetail =  function(obj){

		var form = $("<form>");//定义一个form表单
		form.attr("style", "display:none");
		form.attr("target", "frame_content");
		form.attr("method", "post");
		form.attr("action","<%=request.getContextPath() %>/allObjectsAction_selectTableByTableName_tableDetail");

		var input1 = $("<input>");
		input1.attr("type", "hidden");
		input1.attr("name", "tableName");
		input1.attr("value", obj.innerHTML);
		$("body").append(form);//将表单放置在web中
		form.append(input1);
		form.submit();//表单提交
		
		// 最后控制数据访问的样式
		var childs = obj.parentNode.parentNode.childNodes;
		for (var i = 0; i <childs.length; i++) {
			childs[i].className = 'link';
		}
		obj.parentNode.className = 'visited';
		
		
	};
</script>
</head>
<body bgcolor="#E0E0E0" style="margin-left:10px;">
	<p>
	<a href="db_structure.jsp?db=${param.db }" target="frame_content">
	<span>${param.db }</span>
	</a>
	<bdo dir="ltr" id="bdo">BDO</bdo>
	</p>
	<span id="NavFilter">
		<input type="text" class="fastInput" name="fast_filter" id="fast_filter" title="快速搜索" onkeyup="setTimeout(function(word){ return function(){ fast_filter(word);}}(this.value),1000);" onfocus="this.select();">
		<img src="<%=request.getContextPath() %>/resource/images/database/refresh.png" width="20" height="20" onclick="refreshResults()" title="刷新"></span>
	<ol id="subel0">
	</ol>
</body>
</html>