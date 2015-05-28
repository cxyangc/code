<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>导航栏</title>

<script type="text/javascript" src="<%=request.getContextPath()%>/resource/script/framemenu.js"></script>
<script type="text/javascript" src="ajax.js"></script>
<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/js/modalDiv.js"></script>

<%
	String global_ctxPath = request.getContextPath();
%>
<script type="text/javascript">
var global_ctxPath = '<%=global_ctxPath%>';

function page(){
 	window.open("<%=request.getContextPath()%>/question/inquestion.html",'',"width=824,height=490");
 	//window.showModalDialog("http://www.baidu.com/","","dialogWidth=500px;dialogHeight=300px");
}
function gotoSSHR(){
	window.open("<%=request.getContextPath()%>/jsp/sshr/loginSshr.jsp",'',"");
}

function closeWin(){
	window.open("","_self");
	top.opener=null;
	top.close();
}



function emailPage(){
	
}
function mainPage(){
	ajax('<%=request.getContextPath()%>/eHR.managerUser.action.ManagerUserAction.do?method=isHighManager',function(o){
		if(!o.errStatus){
			if(o.responseText=="true"){
				//parent.document.getElementById('centerFrame').src = '<%=request.getContextPath()%>/jsp/mainpage/tabframe.jsp';
				parent.document.getElementById('centerFrame').src = '<%=request.getContextPath()%>/jsp/home/centerHome.jsp';
				parent.document.getElementById('centerFrame').onreadystatechange = function(){
					if(this.readyState == "complete"){
						parent.splitFrame.document.getElementById('leftPic').className = 'splitLeft';
						parent.middleset.cols='164,6,*';
						parent.document.getElementById('centerFrame').onreadystatechange = null;
					}
				};
			}else{
				parent.document.getElementById('centerFrame').src = '<%=request.getContextPath()%>/jsp/home/centerHome.jsp';
				parent.document.getElementById('centerFrame').onreadystatechange = function(){
					if(this.readyState == "complete"){
						parent.splitFrame.document.getElementById('leftPic').className = 'splitLeft';
						parent.middleset.cols='164,6,*';
						parent.document.getElementById('centerFrame').onreadystatechange = null;
					}
				};
			}
		}else{
			parent.document.getElementById('centerFrame').src = '<%=request.getContextPath()%>/jsp/home/centerHome.jsp';
			parent.document.getElementById('centerFrame').onreadystatechange = function(){
				if(this.readyState == "complete"){
					parent.splitFrame.document.getElementById('leftPic').className = 'splitLeft';
					parent.middleset.cols='164,6,*';
					parent.document.getElementById('centerFrame').onreadystatechange = null;
				}
			};
		}
	},false);
}
</script>
<script type="text/javascript">
var state = true;
function showSub(p_flag){
	if(p_flag=='1'||p_flag=='2'){
		state = false;
	}else{
		state = !state;
	}
	var pic = Ext.get('showHeadPic').dom;
	if(state){
		//显示
		parent.superFrame.rows='107,*,35';
		Ext.get("head").dom.style.display = 'block';
		Ext.get("headShowLink").dom.innerHTML = "隐藏";
		pic.src = "<%=request.getContextPath()%>/resource/style/default/images/arrowRight.png";
	}else{
		//隐藏
		parent.superFrame.rows='28,*,35';
		Ext.get("head").dom.style.display = 'none';
		Ext.get("headShowLink").dom.innerHTML = "展开";
		pic.src = "<%=request.getContextPath()%>/resource/style/default/images/arrowLeft.png";
	}
}
function showWin(){
	var home_mask = window.top;
	home_mask.showWin();
}
function onlineCom(){
	window.open("http://www.portal.unicom.local/link-na044");
}
</script>

<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/resource/extjs/ext2core/ext-base.js"></script>
<script type="text/javascript" language="javascript" src="<%=request.getContextPath()%>/resource/extjs/ext2core/ext-all.js"></script>
</head>
<body>

<div class="head" id="head">	 
  <div class="logo"><img src="<%=request.getContextPath()%>/resource/style/default/images/logo.jpg" />
  </div>
     <div class="headR">
       <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                  	<td id='msgBoxIcon' style="visibility: hidden;" width="20%"><img src="<%=request.getContextPath()%>/resource/style/default/images/ico10.gif" /></td>
                    <td width="20%"><img src="<%=request.getContextPath()%>/resource/style/default/images/ico007.gif" /></td>
                    <td width="20%"><img src="<%=request.getContextPath()%>/resource/style/default/images/ico01.gif" /></td>
                    <td width="20%"><img src="<%=request.getContextPath()%>/resource/style/default/images/ico03.gif" /></td>
                    <td width="20%"><img src="<%=request.getContextPath()%>/resource/style/default/images/ico02.gif" /></td>
                    <td width="20%"><img src="<%=request.getContextPath()%>/resource/style/default/images/ico07.gif" /></td>
                  </tr>
                  <tr>
                  	<td  id='msgBoxTextTD' style="visibility: hidden;"><a id='msgBoxText' href="#" onclick="parent.leftFrame.init('收件箱')">邮件(0)</a></td>
                    <td><a href="#"  onclick="onlineCom()">在线交流</a></td>
                    <td><a href="#" onclick="mainPage()">首页</a></td>
                    <td><a href="<%=request.getContextPath()%>/eHR.employee.action.EmployeePreferencesAction.do?method=findUserByLoginName" target="centerFrame">个人设置</a></td>
                    <td><a href="#" onclick="page()">帮助</a></td>
                    <td><a href="<%=request.getContextPath()%>/jsp/mainpage/exit.jsp" target="_top">退出</a></td>
                  </tr>
       </table>
     </div>
	 
</div>
<div class="notice">
    <div class="welcome"> 欢迎，今天是</div>
    <div id="time" size="2" class="time">
		 <script language="Javascript">
		setInterval("time.innerHTML='<font color=#d71820><b>'+new Date().getYear()+'</b></font>'+'年 '+'<font color=#d71820><b>'+(new Date().getMonth()+1)+'</b></font>'+'月 '+'<font color=#d71820><b>'+new Date().getDate()+'</b></font>'+'日 '+''+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",1000)
				</script>
	 </div>
     <div class="close_open"><a id='headShowLink' href="#" style="color:black;height: 21px;vertical-align: middle;" onclick="showSub()">隐藏</a><img id="showHeadPic" style="vertical-align: middle;filter:Chroma(Color = white);" src="<%=request.getContextPath()%>/resource/style/default/images/arrowRight.png" id="sub_1" onclick="showSub()"  title="显示和隐藏头部"/></div>
</div>

<script type="text/javascript">
function getOs()
{
     var OsObject = "";
    if(navigator.userAgent.indexOf("MSIE")>0) {
         return "MSIE";
    }
    if(isFirefox=navigator.userAgent.indexOf("Firefox")>0){
         return "Firefox";
    }
    if(isSafari=navigator.userAgent.indexOf("Safari")>0) {
         return "Safari";
    } 
    if(isCamino=navigator.userAgent.indexOf("Camino")>0){
         return "Camino";
    }
    if(isMozilla=navigator.userAgent.indexOf("Gecko/")>0){
         return "Gecko";
    }
}
var isIE=getOs();

if (isIE!="MSIE"){
	//alert("请使用IE浏览器");
}

var _runner_timer = null;
function queryMsgThread() {
	try {
		
		Ext.Ajax.request({
			url :'<%=request.getContextPath()%>/hades.ems.action.MessageAction.do?method=searchMessages_receiveUnreadCount',
			method :'POST',
			success:function(response, options){
				var decode = Ext.util.JSON.decode(response.responseText);	
				if (decode.success) {
					
					if (decode.message > 0) {
						document.getElementById('msgBoxText').innerHTML = '邮件('+ decode.message + ')';
						document.getElementById('msgBoxTextTD').style.visibility = 'visible';
						document.getElementById('msgBoxIcon').style.visibility = 'visible';
					} else {
						document.getElementById('msgBoxText').innerHTML = '邮件(0)';
						document.getElementById('msgBoxTextTD').style.visibility = 'hidden';
						document.getElementById('msgBoxIcon').style.visibility = 'hidden';
					}
				}
			}
		});//end for ajax 
	} catch (exp) {
	}
	startNewRunnerThread();
}
//启动新线程
function startNewRunnerThread() {
	clearRunnerThread();
	_runner_timer = window.setTimeout(queryMsgThread, 60000);
}
// 终止线程
function clearRunnerThread() {
	if (_runner_timer) {
		window.clearTimeout(_runner_timer);
		_runner_timer = null;
	}
}
queryMsgThread();
startNewRunnerThread();
</script>
<script> 

function sendDomain(domain){
	Ext.Ajax.request({
		url : global_ctxPath
				+ "/eHR.workflow.action.TaskListAction/saveDomain.do",
		params : {
			domain : domain
		},
		method : 'POST'
	});
}
document.body.onload = function(){
	var ma = document.getElementById('managerUser');
	var check = document.getElementById('managerUserSee');
	var wait = document.getElementById('managerUserWait');
	var code = "managerUserReport";
	var checkCode = "managerUserCheck";
	if(ma){
		Ext.Ajax.request({
			url : global_ctxPath+'/eHR.managerUser.action.ManagerUserAction.do?method=selectCountByBussinessCode',
			params : {code:code},
			method : 'POST',
			success : function(response,options){
				var count = response.responseText;
				if(count=="0"){
					ma.style.display = "none";
				}else{
					ma.style.display = 'block';
					ma.style.top = '15px';
					ma.style.left = (document.body.clientWidth/2-60) + 'px';
				}
			},
			failure : function(response,options){
				Ext.Msg.alert('温馨提示','系统内部有错误');
			}
		});
	}
	if(check){
		Ext.Ajax.request({
			url : global_ctxPath+'/eHR.managerUser.action.ManagerUserAction.do?method=selectCountByBussinessCode',
			params : {code:checkCode},
			method : 'POST',
			success : function(response,options){
				var count = response.responseText;
				if(count=="0"){
					check.style.display = "none";
				}else{
					check.style.display = 'block';
					check.style.top = '15px';
					check.style.left = (document.body.clientWidth/2-60) + 'px';
				}
			},
			failure : function(response,options){
				Ext.Msg.alert('温馨提示','系统内部有错误');
			}
		});
	}
	if(wait){
		wait.style.display = 'block';
		wait.style.top = '3px';
		wait.style.left = (document.body.clientWidth/2-60) + 'px';
	}
};
window.onresize = function(){
	var ma = document.getElementById('managerUser');
	var check = document.getElementById('managerUserSee');
	var wait = document.getElementById('managerUserWait');
	if(ma && ma.style.display!="none"){
		ma.style.top = '15px';
		ma.style.left = (document.body.clientWidth/2-60) + 'px';
	}
	if(check && check.style.display!="none"){
		check.style.top = '15px';
		check.style.left = (document.body.clientWidth/2-60) + 'px';
	}
	if(wait && wait.style.display!="none"){
		wait.style.top = '3px';
		wait.style.left = (document.body.clientWidth/2-60) + 'px';
	}
};
function showManagerReport(state){
	Ext.Ajax.request({
		url : global_ctxPath+'/eHR.managerUser.action.ManagerUserAction.do?method=insertManagerSystemLog',
		params : {state:state},
		method : 'POST',
		callback : function(){
			if(state == 'luru'){
				parent.document.getElementById('centerFrame').src = global_ctxPath+'/jsp/pub/emp_select_tree.jsp?reportReadOnly=false&hideTree=true&isResume=false&historyPanel=true&respId='+respId;
			}else if(state == 'chakan'){
				parent.document.getElementById('centerFrame').src = global_ctxPath+'/jsp/pub/emp_select_tree.jsp?reportReadOnly=true&hideTree=false&isResume=false&historyPanel=true&respId='+respId_see;
			}
		}
	});
}
</script> 

</body>
</html>
 
