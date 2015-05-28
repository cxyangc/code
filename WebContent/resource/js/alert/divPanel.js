/**
 * 用于显示提示框
 */
var divPanel ={
		show:function(text,func){
			this.hidden();
			var msgw,msgh,bordercolor;  
			msgw=350;//提示窗口的宽度  
			msgh=150;//提示窗口的高度  
			titleheight=25 //提示窗口标题高度  
			bordercolor="#336699";//提示窗口的边框颜色  
			titlecolor="#99CCFF";//提示窗口的标题颜色
			var sWidth,sHeight; 
			//获取当前窗口尺寸  
			sWidth = document.body.offsetWidth;  
			sHeight = document.body.offsetHeight; 
			//背景div  --此处很失效，所以不打算使用它
			/***
			var bgObj=document.createElement("div");
			bgObj.setAttribute('id','alertbgDiv');
			bgObj.style.position="absolute";  
			bgObj.style.top="0";  
			bgObj.style.background="#E8E8E8";  
			bgObj.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75";  
			bgObj.style.opacity="0.6";  
			bgObj.style.left="0";  
			bgObj.style.width = sWidth + "px";  
			bgObj.style.height = sHeight + "px";  
			bgObj.style.zIndex = "10000";  
			document.body.appendChild(bgObj);  
			*/
			//创建提示窗口的div  
			var msgObj = document.createElement("div")  
			msgObj.setAttribute("id","divPanel.alertmsgDiv");  
			msgObj.setAttribute("align","center");  
			msgObj.style.background="white";  
			msgObj.style.border="1px solid " + bordercolor;  
			msgObj.style.position = "absolute";  
			msgObj.style.left = document.documentElement.scrollLeft+(document.documentElement.clientWidth/2)-(msgw/2)+"px"; 
			msgObj.style.font="12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif";
			//窗口距离左侧和顶端的距离   
		//	msgObj.style.marginLeft = "-225px";  
			 //窗口被卷去的高+（屏幕可用工作区高/2）-150 
			msgObj.style.top = document.documentElement.scrollTop+(document.documentElement.clientHeight/2)-(msgh/2)+"px";  
			msgObj.style.width = msgw + "px";  
			msgObj.style.height = msgh + "px";  
			msgObj.style.textAlign = "center";  
			msgObj.style.lineHeight ="25px";  
			msgObj.style.zIndex = "10001";  
			document.body.appendChild(msgObj);  

			//关闭panel按钮
			var img =document.createElement("img");
			img.src=global_ctxPath+'/resource/images/close_image.png';
			img.onclick=function(){divPanel.hidden(func);};
			img.alt="关闭";
			img.width="18";
			img.height="18";
			img.style.cursor="pointer";
			img.style.margin="0px 0px 0px 276px";
			//img.style.float="right";

			//提示信息标题  
			var title=document.createElement("h4");  
			title.setAttribute("id","divPanel.alertmsgTitle");  
			title.setAttribute("align","left");  
			title.style.margin="0";  
			title.style.padding="3px"; 
			title.style.background = bordercolor;  
			title.style.filter="progid:DXImageTransform.Microsoft.Alpha(startX=20, startY=20, finishX=100, finishY=100,style=1,opacity=75,finishOpacity=100);";  
			title.style.opacity="0.75";  
			title.style.border="1px solid " + bordercolor;  
			title.style.height="22px";  
			title.style.font="12px Verdana, Geneva, Arial, Helvetica, sans-serif";  
			title.style.color="white";  
			title.innerHTML="<span style='width:330px'>温馨提示</span>";  
			
			
			//这里控制title的拖拽功能
			title.style.cursor="move";
			title.onmousedown=function(){
				startDrag(this,"divPanel.alertmsgDiv");
			};
			title.onmouseup=function(){
				stopDrag(this,"divPanel.alertmsgDiv");
			};
			title.onmousemove=function(){
				drag(this,"divPanel.alertmsgDiv");
			};
			
			
			title.appendChild(img);
			msgObj.appendChild(title);
			


			//提示信息  
			var txt = document.createElement("p");  
			txt.setAttribute("id","msgTxt");  
			txt.style.margin="16px 5px 0 5px";  
			txt.innerHTML = text;  
			txt.style.fontSize="18px";
			msgObj.appendChild(txt); 


			//创建确定按钮
			var button = document.createElement("input");
			button.setAttribute("type","button");
			button.setAttribute("value","确定");
			button.style.margin="16px 16px 0";
			button.style.float="right";
			button.style.cursor="pointer";
			button.onclick=function(){
				divPanel.hidden(func);
			};
			msgObj.appendChild(button); 

			// 重新设置DIV的高度；这里是根据显示内容来设置DIV的高度
			// 先得到button的高度
			var button_top = button.offsetTop;//174
			var title_top = msgObj.offsetTop;//366
			msgObj.style.height = (button_top+40) + "px";  

		},
		hidden:function(func){
			//document.body.removeChild(document.getElementById("alertbgDiv"));  
			var alertmsgTitle = document.getElementById("divPanel.alertmsgTitle");
			var alertmsgDiv = document.getElementById("divPanel.alertmsgDiv");
			if(alertmsgDiv){
				if(alertmsgTitle){
					document.getElementById("divPanel.alertmsgDiv").removeChild(alertmsgTitle); 
				}
				document.body.removeChild(document.getElementById("divPanel.alertmsgDiv")); 
			}
			if(func){
				func();
			}
			

		}

	}
  
	window.document.onkeydown=function(e){
		evt = e || event;
		if(evt.keyCode){
			if(evt.keyCode==27){
				divPanel.hidden();
			}
		}
	}
	//判断浏览器类型
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
		return navigator.userAgent;
	}
	
	var moveable = false;
	var x0,y0,x1,y1;
	var hover='orange',normal='slategray';//color;
	//拖动;
	function drag(obj,divID)
	{	 
		if(moveable)
		{	
			var divObj= document.getElementById(divID);
			var win = divObj;
			var sha = win.nextSibling;
			if(getOs()=='Firefox'){
				event=arguments.callee.caller.arguments[0] || window.event; 
			}
			win.style.left = x1 + event.clientX - x0+"px";
			win.style.top  = y1 + event.clientY - y0+"px";
		}
	 
	}
	//开始拖动;
	function startDrag(obj,divID){
		var divObj= document.getElementById(divID);
		if(getOs()=='Firefox'){
			event=arguments.callee.caller.arguments[0] || window.event; 
		}
		if(event.button==checkLeftMouse())//这里需要判断浏览器的版本ie9+才是0，其他的ie都是1
		{
			//锁定标题栏;
			obj.setCapture();
			//定义对象;
			var win = divObj;//obj.parentNode;
			var sha = win.nextSibling;
			//记录鼠标和层位置;
			x0 = event.clientX;
			y0 = event.clientY;
			x1 = parseInt(win.style.left);
			y1 = parseInt(win.style.top);

			//记录颜色;
			normal = obj.style.backgroundColor;
			//改变风格;
			obj.style.backgroundColor = hover;
			win.style.borderColor = hover;
			obj.nextSibling.style.color = hover;
			moveable = true;
		}

	}
	//停止拖动;
	function stopDrag(obj,divID)
	{
		var divObj= document.getElementById(divID);
		if(moveable)
		{
			var win = divObj;
			var sha = win.nextSibling;
			var msg = obj.nextSibling;
			win.style.borderColor     = normal;
			obj.style.backgroundColor = normal;
			msg.style.color           = normal;
			obj.releaseCapture();
			moveable = false;
		}
	}
	/**
	* 检测按下的是哪一个键，然后返回相应的数据
	*/
	function checkLeftMouse(){
		if(navigator.userAgent.indexOf("MSIE")>0){ 
			//ie9 : Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0) 
			//ie8 : Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0)
			//ie7 : Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.3; Tablet PC 2.0; .NET4.0E; .NET4.0C) 
			//Mozi: Mozilla/5.0 (Windows NT 6.1; rv:20.0) Gecko/20100101 Firefox/20.0
			//goog: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.22 (KHTML, like Gecko) Chrome/25.0.1364.172 Safari/537.22
			//oper: Opera/9.80  (Windows NT 6.1; Edition IBIS) Presto/2.12.388 Version/12.14
			//appl: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/534.57.2 (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2
		    if(navigator.userAgent.indexOf("MSIE 6.0")>0){   
		      return 1;  
		    }   
		    if(navigator.userAgent.indexOf("MSIE 7.0")>0){  
		      return 1;
		    }
		    if(navigator.userAgent.indexOf("MSIE 8.0")>0){  //后来添加，因为下一句话不一定准确，这里是保险期间，做8.0；下面没有做过9.0的测试
			      return 1;
			}
		    if(navigator.userAgent.indexOf("MSIE 9.0")>0 && !window.innerWidth){//这里是重点，你懂的
		      return 1; //这个是ie8
		    }   
		    if(navigator.userAgent.indexOf("MSIE 9.0")>0){  
		      return 0;  
		    }else{
		    	return 0;
		    }
		  }else{// 其他浏览器都是0
		    return 0;
		  }
	}
	/**
	* 重写alert
	*/
	var alerts= function(msg,func){
		divPanel.show(msg,func);
	}
	/**
	* 新建divmask
	*/ 
	var divMask = {
		show:function(text){
			this.hidden();// 如果有该层的话先关闭该层
			var msgw,msgh,bordercolor;  
			msgw=350;//提示窗口的宽度  
			msgh=150;//提示窗口的高度  
			titleheight=25 //提示窗口标题高度  
			bordercolor="#336699";//提示窗口的边框颜色  
			// 创建笼罩曾的DIV
			var wholeDiv = document.createElement("div");
			wholeDiv.id="divMask.wholeDiv";
			wholeDiv.style.backgroundColor = "#F0F0F0";
			wholeDiv.style.zIndex = 1000;
			wholeDiv.style.top = 0;
			wholeDiv.style.bottom = 0;
			wholeDiv.style.left = 0;
			wholeDiv.style.right = 0;
			wholeDiv.style.position = 'fixed'; // 与top等相对应
			wholeDiv.style.opacity = '0.5';
			wholeDiv.style.filter = 'Alpha(opacity=50)';
			wholeDiv.width='100%';
			wholeDiv.height='100%';
			
			
			

			
			//添加到BODY中
			document.body.appendChild(wholeDiv);
			
		},
		hidden:function(){
			var hiddenMain = document.getElementById('divMask.wholeDiv');
			if(hiddenMain){
				document.body.removeChild(hiddenMain);
			}
		}
	}