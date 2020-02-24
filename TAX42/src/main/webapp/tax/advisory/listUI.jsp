
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>



<script type="text/javascript" src="../../js/jquery/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../../js/hxjzg.js"></script>
<link href="../../css/skin1.css" rel="stylesheet" type="text/css" />
<title>纳税咨询管理</title>
<script type="text/javascript" src="../../js/datepicker/WdatePicker.js"></script>
<script>
	var contextPath = "/" + window.location.pathname.split("/")[1];
	$(function() {
		doSearch(null);
	});
	

	function doSearch(obj) {
		var con_title= $("#complain_compTitle").val();
	 	var con_startTime= $("#startTime").val();
	 	var con_endTime= $("#endTime").val();
	 	var state= $("#complain_state").val();
	 	
	 	var url="${pageContext.request.contextPath}/consult/query?"+"con_title="+con_title+
	 			"&con_startTime="+con_startTime+
	 			"&con_endTime="+con_endTime+
		 			"&state="+state;
	 			if(obj != null){
	 				var pageIndex=$("#pageIndex").text();
		 			if(obj=='up'){
		 				if(pageIndex==1){
		 					return;
		 				}
		 				pageIndex = parseInt(pageIndex)-1;
		 				url+="&pageIndex="+pageIndex;
		 			}
		 			if(obj=="dwon"){
		 				if(pageIndex==$("#pages").text()){
		 					return;
		 				}
		 				pageIndex=parseInt(pageIndex)+1;
		 				url+="&pageIndex="+pageIndex;
		 			}
	 				if(obj=="ti"){
	 					if($("#tz").val()<1 || $("#tz").val()>$("#pages").text()){
	 						return;
	 					}
	 					url+="&pageIndex="+$("#tz").val();
	 				}
	 			}else{
	 				url+="&pageIndex="+1;
	 			}
	 			$.get(url,function(data, status) {
	 				$("#tblData tr:not(:first)").remove();
	 				$.each(data.list,function(index, val) {
	 					var content = "";
	 					content += '<tr>'
	 							+ '<td hidden=hidden>'
	 							+ val.consult_id
	 							+ '</td>' + '<td>'
	 							+ val.con_title
	 							+ '</td>' + '<td>'
	 							+ val.con_dept
	 							+ '</td>' + '<td>'
	 							+ val.con_name
	 							+ '</td>' + '<td>'
	 							+ new Date(val.con_time).toLocaleString("chinese",{hour12:false})
	 							+ '</td>';
	 					if (val.state == 0) {
	 						content += '<td>待处理</td>';
	 					} else if (val.state == 1) {
	 						content += '<td>已受理</td>';
	 					} else {
	 						content += '<td>不处理</td>';
	 					}
	 					if (val.state == 0) {
	 						content += '<td>'
	 								+ '<a href=${pageContext.request.contextPath}/consult/queryid/'+val.consult_id+'>'
	 								+ '受理</a>'
	 								+ '</td>' + '</tr>';
	 					} else if (val.state == 1) {
	 						content += '<td>'
	 								+ '<a>已受理</a>'
	 								+ '</td>' + '</tr>';
	 					}
	 					$("#tblData").append(content);
	 				});
	 				$("#total").text(data.total);
	 				$("#pageIndex").text(data.pageNum);
	 				$("#pages").text(data.pages);
	 				
	 		
	 			});
	}
</script>
</head>
<body class="rightBody">
	<form name="form1"
		action="${pageContext.request.contextPath}/consult/query"
		method="post">
		<div class="p_d_1">
			<div class="p_d_1_1">
				<div class="content_info">
					<div class="c_crumbs">
						<div>
							<b></b><strong>纳税咨询管理</strong>
						</div>
					</div>
					<div class="search_art">
						<ul>
						<li>咨询标题：<input type="text" name="con_title" value=""
							id="complain_compTitle" class="s_text" style="width: 160px;" />
						</li>
						<li>咨询时间：<input type="text" name="startTime" value=""
							readonly="readonly" id="startTime" class="s_text"
							style="width: 160px;"
							onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd HH:mm'});" />
							- <input type="text" name="endTime" value="" readonly="readonly"
							id="endTime" class="s_text" style="width: 160px;"
							onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd HH:mm'});" />
						</li>
						<li>状态：<select name="state" id="complain_state">
								<option value="">全部</option>
								<option value="0">待处理</option>
								<option value="1">已处理</option>
								<option value="2">已失效</option>
						</select>
						</li>
						<li>
							<input type=button class="s_button" value="搜 索" id="btnSearch" onclick="doSearch()"/>
						</li>
						</ul>
					</div>

					<div class="t_list" style="margin: 0px; border: 0px none;">
						<table name="qht" width="100%" border="0" id="tblData">
							<tr class="t_tit">
								<td hidden="hidden"></td>
								<td align="center">咨询标题</td>
								<td width="120" align="center">资讯人单位</td>
								<td width="120" align="center">咨询人</td>
								<td width="140" align="center">咨询时间</td>
								<td width="100" align="center">状态</td>
								<td width="100" align="center">操作</td>
							</tr>
						</table>
					</div>
				</div>



				<div class="c_pate" style="margin-top: 5px;">
					<table width="100%" class="pageDown" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td align="right">总共<span id="total"></span>条记录，
							当前第<span id="pageIndex"></span> 页
							，共<span id="pages"></span> 页&nbsp;&nbsp; 
							<a href="#" id="up" onclick="doSearch('up')">上一页</a>&nbsp;&nbsp; 
							<a href="#" id="dwon" onclick="doSearch('dwon')">下一页</a>
							到&nbsp; <input type="text" style="width: 30px;"value="1" id="tz" onblur="doSearch('ti')"/> &nbsp;&nbsp;
							</td>
						</tr>
					</table>
				</div>


			</div>
	</form>

</body>
</html>