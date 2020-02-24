<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
   <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>国税协同办公平台</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="../css/home.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript" src="../js/jquery/jquery-3.1.1.min.js"></script>
  <script type="text/javascript" src="../js/hxjzg.js"></script>
   <script type="text/javascript">
   $(function () {
	   $.ajax({
	       url:"${pageContext.request.contextPath}/consult/myconsult?con_name=${user_map.name}",
	       dataType:"json",
	       dataType:"json",
	       success:function (data) {
	       	var content="";
	       	$.each(data,function (index,val) {
	       		content += '<tr>'+'<td>'+"<a href='${pageContext.request.contextPath}/consult/querycr/"+val.consult_id+"'>"+val.con_title+"</a></td>"+
	               '<td>'+new Date(val.con_time).toLocaleString("chinese",{hour12:false})+'</td>'+
	               
	               '<td hidden=hidden>'+val.consult_id+'</td>';
	               
	               if (val.state==0) {
						content += '<td>待受理</td></tr>';
					}else if (val.state==1) {
						content += '<td>已受理</td></tr>';
					}else{
						content += '<td>不处理</td></tr>';
					}
	           });
	       	$("table[name='aaa']").empty().append(content);
	       },
	       error:function () {
	       }
	   });
	});
	$(function () {
		$.get({
			url:"${pageContext.request.contextPath}/survy/sy",
			dataType:"json",
			success:function(data) {
				console.log(data);
				$("table[name='qhtdc']").empty();
				var content="";
				$.each(data,function(index,sy){
					if (sy.ss_state==1) {
						content += '<tr><td>'+"<a href='${pageContext.request.contextPath}/survy/xx/"+sy.ss_id+"'>"+sy.ss_title+'</a>'+'</td>'+
						'<td>'+new Date(sy.ss_starttime).toLocaleString("chinese",{hour12:false})+'</td>'+
						'<td>'+sy.ss_id+'</td>'+
						'<td>正在进行</td></tr>';
					}else{
						content += '<tr><td>'+"<a>"+sy.ss_title+'</a>'+'</td>'+
						'<td>'+new Date(sy.ss_starttime).toLocaleString("chinese",{hour12:false})+'</td>'+
						'<td>'+sy.ss_id+'</td>'+
						'<td>已停止</td></tr>';
					}
				});
				$("table[name='qhtdc']").append(content);
			},
			error:function(){
			}
		});
	}); 
   
    $(function(){
    	
	$.ajax({
		url:"/TAX4/Sub/queryShowMySub?sub=${user_map.name}",
		dateType:"json",
		success:function(b){
			
			$.each(b,function (i,v) {
				var c=i+1;
				var sh="";
				var st=v.sub_state;
				if(st=='0'){
					sh="成功";
				}else if(st=='1'){
					sh="失败";
				}else if(st=="2"){
					sh="处理中";
				}
				$("#table1").append("<tr id='tr"+i+"'>     </tr>");
				   $("#tr"+i).append( "<td height='23'> <a href='/TAX4/Sub/queryMySubInfo?id="+v.service_id+"&bh="+c+"'>预约 "+c+"</a> </td>");							
				   $("#tr"+i).append("<td width='180px'>"+ sh+"</td>");							
				   $("#tr"+i).append("<td width='180px' >事项"+ v.matter+"</td>");		
				   $("#tr"+i).append("<td width='180px'>"+v.sub_time+"</td>");							
                });
		},
		error:function(){
		}
		
		
	});
	
	
	$("#ss1").change(function(){
		var a= $(this).val();
		$.ajax({
			url:"/TAX4/Sub/queryNumber/"+a,
			dateType:"json",
			success:function(b){
		 $("#show").val(b);				
			},
			error:function(){
			}
		});
	 	
	});
	
	function click(){
	
		var id=$(this).attr("id");
		var bh=$(this).attr("name");
		
		location.href="/TAX4/Sub/queryMySubInfo?id="+id+"&bh="+bh;
	}
    
    
    $(function(){
    	initPage();	
    });
    
    function initPage(){
		var pageIndex = 1;
		var pageSize = 10;
		var comp_name='${user_map.name}'
		//获取当前项目的名称（路径）
		var contextPath = "/" + window.location.pathname.split("/")[1];
		//拼接要异步请求的路径
		var url = contextPath + "/info/select?pageIndex=" + pageIndex
				+ "&pageSize=" + pageSize;
		getData(url);
		
		
		$.get("${pageContext.request.contextPath }/complain/selectByCondition?comp_name="+comp_name,function(data, status) {
			var content = "";
			$.each(data,function(k,v){
				if (k==0) {
					return true;
				}
				content = '<tr><td height="23"><a href="complainDetail.html?id='+v.comp_id+'">'+v.comp_title+'</a></td>';
				
				if (v.state==0) {
					content += '<td width="180px">待受理</td>';
				}else if(v.state==1){
					content += '<td width="180px">已受理</td>';
				}else if(v.state==2){
					content += '<td width="180px">已失效</td>';
				}
				if(v.is_NM==true){
					content +='<td width="180px">匿名投诉</td>';
				}else{
					content +='<td width="180px">非匿名投诉</td>';
				}
				
				content+='<td width="180px">'+new Date(v.comp_time).toLocaleString("chinese",{hour12 : false})+'</td>'+
            '</tr>';
			$("#comTab").append(content);
			});
		});
	}

	function getData(url) {
		$.get(url,function(data, status) {
				if (status == "success") {
					var content = "";
					//处理返回的json数据
					$.each(data,function(k, v) {
						if (k==0) {
							return true;
						}
						content = '<tr><td height="23"><a href="infoDetail.html?id='+v.info_id+'">'+v.title+'</a></td>';
						
						if (v.type == 'tzgg') {
							content += '<td width="150px">通知公告</td>';
						} else if (v.type == 'zcsd') {
							content += '<td width="150px">政策速递</td>';
						} else if (v.type == 'nszd') {
							content += '<td width="150px">纳税指导</td>';
						}
						
						content+= '<td width="150px">'+v.creator+'</td>'+
	                    '<td width="150px">'+new Date(v.create_time).toLocaleString("chinese",{hour12 : false})+'</td>'+
	                '</tr>';
						$("#tblInfo").append(content);
					});
				}
			});
	}
 });
    
    
    </script>
    
    <style type="text/css">
        .cls{
				height: 100%;	
				width:100%;
				overflow: auto;
			}
		.div2{
				height: 90%;	
				width:100%;
				overflow: auto;
			}	
    </style>
</head>

<body align="center">
<!-- 头部{ -->
<table width="1222" border="0" align="center" cellpadding="0"
       cellspacing="0" background="../images/home/top_bg.png" class="top">
    <tr>
        <td width="32" height="106">&nbsp;</td>
        <td width="418" height="106" align="left" valign="middle">
            <img class="zxx_test_png" src="../images/home/ind01.png" width="470" height="90" alt="" />
        </td>
        <td width="211">&nbsp;</td>
        <td width="328">
            <object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="450" height="86">
                <param name="movie" value="../images/home/flash.swf" />
                <param name="quality" value="high" />
                <param name="wmode" value="transparent" />
                <param name="swfversion" value="6.0.65.0" />
                <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
                <param name="expressinstall" value="Scripts/expressInstall.swf" />
                <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
                <!--[if !IE]>-->
                <object type="application/x-shockwave-flash" data="../images/home/flash.swf"
                        width="380" height="86">
                    <!--<![endif]-->
                    <param name="quality" value="high" />
                    <param name="wmode" value="transparent" />
                    <param name="swfversion" value="6.0.65.0" />
                    <param name="expressinstall" value="Scripts/expressInstall.swf" />
                    <!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
                    <div>
                        <h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
                        <p>
                            <a href="http://www.adobe.com/go/getflashplayer"><img
                                    src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif"
                                    alt="获取 Adobe Flash Player" width="112" height="33" />
                            </a>
                        </p>
                    </div>
                    <!--[if !IE]>-->
                </object>
                <!--<![endif]-->
            </object>
        </td>
        <td width="331" align="right" valign="top">
            <table width="350" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="64" height="4"></td>
                    <td width="25" height="5"></td>
                    <td width="120" height="4"></td>
                    <td width="25" height="4"></td>
                    <td width="40" height="4"></td>
                    <td width="25" height="4"></td>
                    <td width="50" height="4"></td>
                </tr>
                <tr>
                    <td align="center"></td>
                    <td align="left"></td>
                    <td align="right">
                        <a><b></b><font color="red">欢迎您:${user_map.name}&nbsp;</font></a>
                    </td>
                    <td align="center"><img src="../images/home/help.png" width="12" height="17"  /></td>
                    <td align="left"><a href="javascript:void(0);">帮助</a></td>
                    <td align="center"><img src="../images/home/exit.png" width="14" height="14"   /></td>
                    <td align="left" valign="middle" ><a href="${pageContext.request.contextPath }/tui">退出</a></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<!-- }头部 -->
<!-- 导航{ -->
<div class="menu">
    <ul class="clearfix">
        <li class="hover"><a href="javascript:void(0);">工作主页</a></li>
        <!-- <li><a href="javascript:void(0);">行政管理</a></li>
        <li><a href="javascript:void(0);">后勤服务</a></li>
        <li><a href="javascript:void(0);">在线学习</a></li> -->
        <li><a href="../tax/frame.jsp">纳税服务</a> </li>
        <!-- <li><a href="javascript:void(0);">我的空间</a></li> -->
    </ul>
</div>
<!-- }导航 -->
<!-- 左{ -->
<div class="content">
    <div class="left">
        <!-- 个人资料{ -->
        <div class="left_grzx1">
            <div class="left_grzxbt">
                <h1>个人资料</h1>
            </div>
            <table width="98%" border="0" align="center">
                <tr>
                    <td width="76" height="100" align="center" valign="middle">
                        <div class="left-tx">
                            
							 
                            	<img src="${user_map.headImg}" width="70" height="70" />
                            
                        </div>
                    </td>
                    <td width="5%"><img src="../images/home/gs10.png" width="4" height="59" alt="" /></td>
                    <td width="60%"><table width="95%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="2" style=" font-weight:bold; color:#3a7daa;"><a href="userDetail.jsp">${user_map.name}</a></td>
                        </tr>
                        <tr>
                            <td colspan="2">所属部门:${user_map.dept}</td>
                        </tr>
                    </table>
                    </td>
                </tr>
            </table>
        </div>
        <!-- }个人资料 -->
    </div>
<!-- }左 -->

    <!-- 右{ -->
    <div class="right">
        <div class="left_grzx1">
            <div class="left_grzxbt">
                <h1>信息列表</h1>
            </div>
            <div  class="cls">
            <table id="tblInfo" width="98%" border="0" align="center">
                
            </table>
            </div>
        </div>
    </div>
    <!-- }右-->
    <div class="clear"></div>
     <div class="layout_center">
        <div class="lc_grzx1">
            <div class="lc_grzxbt">
                <h1>我的投诉</h1>
                <div style="float:right;padding-top:3px;">
                	<a href="complainHome.jsp">我要投诉</a>&nbsp;&nbsp;
                </div>
            </div>
            <div  class="div2">
            <table id="comTab" width="98%" border="0" align="center">
            </table>
            </div>
    
 </div> 
 
<!--  ******************************************************************************************************************* -->
        <div class="lc_grzx1">
            <div class="lc_grzxbt">
                <h1>我的预约</h1>
                <div style="float:right;padding-top:3px;">
                	<a href="reserveHome.jsp">我要预约</a>&nbsp;&nbsp;
                </div>
            </div>
            <table width="98%" border="0" align="center" id="table1">
     

                
            </table>

    </div>  
    
<!--  ******************************************************************************************************************* -->
	
	
	
	
	
	<div class="lc_grzx1">
            <div class="lc_grzxbt">
                <h1>我的咨询</h1>
                <div style="float:right;padding-top:3px;">
                	<a href="advisoryHome.jsp">我要咨询</a>
                </div>
            </div>
            <div  class="div2">
            <table name="aaa" width="98%" border="0" align="center">
            </table>
            </div>
        </div>
		
		<div class="lc_grzx1">
            <div class="lc_grzxbt">
                <h1>问卷调查</h1>
            </div>
            <div  class="div2">
            <table name="qhtdc" width="98%" border="0" align="center">
            </table>
            </div>
        </div>
    </div>
</div>
</div>

        
<!-- 尾部{ -->
<div class="foot">版权所有©国税局 2017年</div>
<!-- }尾部 -->
</body>
</html>