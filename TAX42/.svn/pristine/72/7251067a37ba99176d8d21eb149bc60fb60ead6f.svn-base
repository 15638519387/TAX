<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="../../js/jquery/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../../js/hxjzg.js"></script>
<link href="../../css/skin1.css" rel="stylesheet" type="text/css" />
<title>信息发布管理</title>
<script type="text/javascript" src="../../js/my_info.js"></script>
<script type="text/javascript">
	//异步发布信息,信息的id及将要改成的信息状态
	function doPublic(infoId, state) {
		//1、更新信息状态
		$.ajax({
			url : "../../info/info_publicInfo.action",
			data : {
				"info.infoId" : infoId,
				"info.state" : state
			},
			type : "post",
			success : function(msg) {
				//2、更新状态栏、操作栏的显示值
				if ("更新状态成功" == msg) {
					if (state == 1) {//说明信息状态已经被改成 发布，状态栏显示 发布，操作栏显示 停用
						$("#show_" + infoId).html("发布");
						$("#oper_" + infoId).html(
								'<a href="javascript:doPublic(\'' + infoId
										+ '\',0)">停用</a>');
					} else {
						$("#show_" + infoId).html("停用");
						$("#oper_" + infoId).html(
								'<a href="javascript:doPublic(\'' + infoId
										+ '\',1)">发布</a>');
					}
				} else {
					alert("更新信息状态失败！");
				}
			},
			error : function() {
				alert("更新信息状态失败！");
			}
		});
	}
	var list_url = "listUI.html";
	//搜索
	function doSearch() {
		//重置页号
		$("#pageNo").val(1);
		document.forms[0].action = list_url;
		document.forms[0].submit();
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
							<b></b><strong>信息发布管理</strong>
						</div>
					</div>
					<div class="search_art">
						<ul>
							<li>信息标题：<input type="text" name="info.title" value=""
								id="infoTitle" class="s_text" style="width: 160px;" />
							</li>
							<li><input type="button" class="s_button" value="搜 索"
								onclick="doSearch()" /></li>
							<li style="float: right;"><input type="button" value="新增"
								class="s_button" onclick="doAdd()" />&nbsp; <input
								type="button" value="删除" class="s_button"
								onclick="doDeleteAll()" />&nbsp;</li>
						</ul>
					</div>

					<div class="t_list" style="margin: 0px; border: 0px none;">
						<table style="width: 100%" border="1">
							<tr class="t_tit">
								<td width="30" align="center"><input type="checkbox"
									id="selAll" onclick="doSelectAll()" /></td>
								<td align="center">信息标题</td>
								<td width="120" align="center">信息分类</td>
								<td width="120" align="center">创建人</td>
								<td width="140" align="center">创建时间</td>
								<td width="80" align="center">状态</td>
								<td width="120" align="center">操作</td>
							</tr>
							<c:forEach items="${list }" var="map" varStatus="status">
								<c:if test="${status.count % 2 !=0 }">
									<tr bgcolor="f8f8f8">
								</c:if>
								<c:if test="${status.count % 2 ==0 }">
									<tr>
								</c:if>

								<td align="center"><input type="checkbox"
									name="selectedRow" value="" /></td>
								<td align="center">${map['title'] }</td>
								<td align="center">${map['type'] }</td>
								<td align="center">${map['creator'] }</td>
								<td align="center">${map['create_time'] }</td>
								<td id="" align="center">
									<c:if test="${map['state'] ==0}">停用</c:if>
									<c:if test="${map['state'] ==1}">发布</c:if>
								</td>
								<td align="center"><span id=""> <!-- 可以发布 --> <a
										href="#">发布</a>

								</span> <a href="#">编辑</a> <a href="#">删除</a></td>
								</tr>
							</c:forEach>


						</table>
					</div>
				</div>
				<div class="c_pate" style="margin-top: 5px;">
					<table width="100%" class="pageDown" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<td align="right">总共1条记录，当前第 1 页，共 1 页 &nbsp;&nbsp; <a
								href="#">上一页</a>&nbsp;&nbsp;<a href="#">下一页</a> 到&nbsp;<input
								type="text" style="width: 30px;"
								onkeypress="if(event.keyCode == 13){doGoPage(this.value);}"
								min="1" max="" value="1" /> &nbsp;&nbsp;
							</td>
						</tr>
					</table>
				</div>

			</div>
		</div>

	</form>

</body>
</html>