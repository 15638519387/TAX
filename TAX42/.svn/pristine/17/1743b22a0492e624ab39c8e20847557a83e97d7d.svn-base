<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="../../js/jquery/jquery-3.1.1.min.js"></script>
<link href="../../css/skin1.css" rel="stylesheet" type="text/css" />
<title>服务调查管理</title>
<script type="text/javascript" src="../../js/survey_listUI.js"></script>
<script type="text/javascript" src="../../js/datepicker/WdatePicker.js"></script>
<script type="text/javascript">
	//获取当前项目的名称（路径）
	var contextPath = "/" + window.location.pathname.split("/")[1];
	
	$(function() {
		initPage();
		//上一页、下一页的单击事件
		$("#btnPrePage,#btnNextPage").click(function() {
			var txt = $(this).html();
			var pageIndex = Number($("#currentPage").html());
			var totalPage = Number($("#totalPage").html());
			var pageSize = 10;
			if(txt == "上一页") {
				pageIndex = pageIndex - 1;
				if(pageIndex < 1) {
					pageIndex = 1;
				}
			} else {
				pageIndex = pageIndex + 1;
				if(pageIndex > totalPage) {
					pageIndex = totalPage;
				}
			}
			var ss_title = $("#ss_title").val();
			var ss_starttime = $("#ss_starttime").val();
			var ss_endtime = $("#ss_endtime").val();
			var ss_state = $("#ss_state").val();
			//拼接要异步请求的路径
			var url = contextPath + "/survey/selectByCondition?pageIndex=" + pageIndex +
				"&pageSize=" + pageSize + "&ss_title=" + ss_title + "&ss_starttime=" + ss_starttime + "&ss_endtime=" + ss_endtime+"&ss_state="+ss_state;
			getData(url);
		});

		//Go按钮的点击事件
		$("#btnGo").click(function() {
			var pageIndex = $("#txtGoPage").val();
			if(pageIndex == "") {
				return;
			}
			var pageSize = 10;
			var totalPage = Number($("#totalPage").html());
			if(pageIndex < 1) {
				pageIndex = 1;
			}
			if(pageIndex > totalPage) {
				pageIndex = totalPage;
			}
			var ss_title = $("#ss_title").val();
			var ss_starttime = $("#ss_starttime").val();
			var ss_endtime = $("#ss_endtime").val();
			var ss_state = $("#ss_state").val();
			//拼接要异步请求的路径
			var url = contextPath + "/survey/selectByCondition?pageIndex=" + pageIndex +
				"&pageSize=" + pageSize + "&ss_title=" + ss_title + "&ss_starttime=" + ss_starttime + "&ss_endtime=" + ss_endtime+"&ss_state="+ss_state;
			getData(url);
		});

		//搜索
		$("#btnSearch").click(initPage);
		
		//Go按钮的点击事件
		$("#btnGo").click(function(){
			var pageIndex=$("#txtGoPage").val();
			if (pageIndex=="") {
				return;
			}
			var pageSize=10;
			var totalPage = Number($("#totalPage").html());
			if (pageIndex < 1) {
				pageIndex = 1;
			}
			if (pageIndex>totalPage) {
				pageIndex=totalPage;
			}
			var ss_title = $("#ss_title").val();
			var ss_starttime = $("#ss_starttime").val();
			var ss_endtime = $("#ss_endtime").val();
			var ss_state = $("#ss_state").val();
			//拼接要异步请求的路径
			var url = contextPath + "/survey/selectByCondition?pageIndex=" + pageIndex +
				"&pageSize=" + pageSize + "&ss_title=" + ss_title + "&ss_starttime=" + ss_starttime + "&ss_endtime=" + ss_endtime+"&ss_state="+ss_state;
			getData(url);
		});
	});

	function initPage() {
		var pageIndex = 1;
		var pageSize = 10;
		var ss_title = $("#ss_title").val();
		var ss_starttime = $("#ss_starttime").val();
		var ss_endtime = $("#ss_endtime").val();
		var ss_state = $("#ss_state").val();
		//拼接要异步请求的路径
		var url = contextPath + "/survey/selectByCondition?pageIndex=" + pageIndex +
			"&pageSize=" + pageSize + "&ss_title=" + ss_title + "&ss_starttime=" + ss_starttime + "&ss_endtime=" + ss_endtime+"&ss_state="+ss_state;
		getData(url);
	}

	function getData(url) {
		$.get(url, function(data, status) {
			if(status == "success") {
				$("#tblSurvy tr:not(:first)").remove();
				$.each(data, function(k, v) {
					if(k == 0) {
						$("#currentPage").html(v.currentPage);
						$("#totalPage").html(v.totalPage);
						$("#totalRecord").html(v.totalRecord);
						return true;
					}
					var content = "";
					content += '<tr bgcolor="f8f8f8">' +
						'<td align="center">' + v.ss_title + '</td>' +
						'<td align="center">' + new Date(v.ss_starttime).toLocaleString("chinese", {
							hour12: false
						}) + '</td>' +
						'<td align="center">' + new Date(v.ss_endtime).toLocaleString("chinese", {
							hour12: false
						}) + '</td>' +
						'<td align="center">' + v.ss_applyer + '</td>';
					if(v.ss_state == 0) {
						content += '<td align="center">无效</td>' +
							'<td align="center"><a href="javascript:void(0);" onclick="doDeal('+v.ss_id+','+v.ss_state+')">启用</a>&nbsp;&nbsp;' +
							'<a href="javascript:void(0);">查看统计</a>&nbsp;&nbsp;<a href="javascript:void(0);" onclick="doEdit('+v.ss_id+')">编辑</a>&nbsp;&nbsp;' +
							'<a href="javascript:void(0);" onclick="doDelete('+v.ss_id+')">删除</a></td>';
					} else {
						content += '<td align="center">有效</td>' +
							'<td align="center"><a href="javascript:void(0);" onclick="doDeal('+v.ss_id+','+v.ss_state+')">停用</a>&nbsp;&nbsp;' +
							'<a href="javascript:void(0);">查看统计</a></td>';
					}
					$("#tblSurvy").append(content);
				});
				$("txtGoPage").val("");
			}
		});
	}
</script>
</head>
<body class="rightBody">
	<form name="form1" action="" method="post">
		<div class="p_d_1">
			<div class="p_d_1_1">
				<div class="content_info">
					<div class="c_crumbs">
						<div>
							<strong>服务调查管理</strong>
						</div>
					</div>
					<div class="search_art">
						<ul>
							<li>标题：<input type="text" name="ss_title" value=""
								id="ss_title" class="s_text" style="width: 160px;" />
							</li>
							<li>开始时间：<input type="text" name="ss_starttime" value=""
								readonly="readonly" id="ss_starttime" class="s_text"
								style="width: 160px;"
								onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd HH:mm'});" />
								- <input type="text" name="ss_endtime" value=""
								readonly="readonly" id="ss_endtime" class="s_text"
								style="width: 160px;"
								onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd HH:mm'});" />
							</li>
							<li>是否有效：<select name="ss_state" id="ss_state">
									<option value="">全部</option>
									<option value="1">有效</option>
									<option value="0">无效</option>
							</select>
							</li>
							<li><input type="button" class="s_button" value="查询"
								id="btnSearch" /></li>
							<li style="float: right;"><input type="button" value="新增"
								class="s_button" onclick="window.location.href='addUI.html'" />&nbsp;
							</li>
						</ul>
					</div>

					<div class="t_list" style="margin: 0px; border: 0px none;">
						<table width="100%" border="0" id="tblSurvy">
							<tr class="t_tit">
								<td align="center">调查标题</td>
								<td width="140" align="center">开始时间</td>
								<td width="140" align="center">结束时间</td>
								<td width="120" align="center">创建人</td>
								<td width="80" align="center">是否有效</td>
								<td width="140" align="center">操作</td>
							</tr>

						</table>
					</div>
				</div>
				<div class="c_pate" style="margin-top: 5px;">
					<table width="100%" class="pageDown" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td align="right">总共 <span id="totalRecord"
								style="color: red;"></span> 条记录，当前第 <span id="currentPage"
								style="color: red;"></span> 页，共 <span id="totalPage"
								style="color: red;"></span> 页 &nbsp;&nbsp; <a id="btnPrePage"
								href="javascript:void(0)">上一页</a>&nbsp;&nbsp;<a id="btnNextPage"
								href="javascript:void(0)">下一页</a> 到&nbsp;<input type="text"
								style="width: 30px;" id="txtGoPage" min="1" max="" value="" />&nbsp;<input
								id="btnGo" type="button" value="Go" /> &nbsp;&nbsp;
							</td>
						</tr>
					</table>
				</div>

			</div>
		</div>




	</form>

</body>
</html>