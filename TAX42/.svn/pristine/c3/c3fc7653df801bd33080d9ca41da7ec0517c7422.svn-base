<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>



<script type="text/javascript" src="../../js/jquery/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../../js/hxjzg.js"></script>
<link href="../../css/skin1.css" rel="stylesheet" type="text/css" />
<title>信息发布管理</title>
<script type="text/javascript" charset="UTF-8"
	src="../../js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="UTF-8"
	src="../../js/ueditor/ueditor.all.min.js">
	
</script>
<script type="text/javascript" charset="UTF-8"
	src="../../js/ueditor/lang/zh-cn/zh-cn.js"></script>

<script>
$(function() {
	var date1 = new Date();
	var time1 = date1.toLocaleString('chinese', {
		hour12 : false
	});
	$('#info_createTime').val(time1);
	setInterval(function() {
		var date = new Date();
		var time = date.toLocaleString('chinese', {
			hour12 : false
		});
		$('#info_createTime').val(time);
	}, 1000);
	
	//转换富文本编辑器中的内容
	var txt=($("#editor").text());
	$("#editor").text($(txt).text());
});
</script>
</head>
<body class="rightBody">
	<form id="form" name="form" action="${pageContext.request.contextPath }/info/update" method="post">
		<div class="p_d_1">
			<div class="p_d_1_1">
				<div class="content_info">
					<div class="c_crumbs">
						<div>
							<b></b><strong>信息发布管理</strong>&nbsp;-&nbsp;修改信息
						</div>
					</div>
					<div class="tableH2">修改信息</div>
					<table id="baseInfo" width="100%" align="center" class="list"
						border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td class="tdBg" width="200px">信息分类：</td>
							<td><select name="type" id="info_type">
								<c:if test="${singleInfo['type']=='tzgg' }">
									<option value="tzgg" selected="selected">通知公告</option>
									<option value="zcsd">政策速递</option>
									<option value="nszd">纳税指导</option>
								</c:if>
								<c:if test="${singleInfo['type']=='zcsd' }">
									<option value="tzgg">通知公告</option>
									<option value="zcsd" selected="selected">政策速递</option>
									<option value="nszd">纳税指导</option>
								</c:if>
								<c:if test="${singleInfo['type']=='nszd' }">
									<option value="tzgg">通知公告</option>
									<option value="zcsd">政策速递</option>
									<option value="nszd" selected="selected">纳税指导</option>
								</c:if>
							</select></td>
							<td class="tdBg" width="200px">来源：</td>
							<td><input type="text" name="source" value="${singleInfo['source']}"
								id="info_source" /></td>
						</tr>
						<tr>
							<td class="tdBg" width="200px">信息标题：</td>
							<td colspan="3"><input type="text" name="title"
								value="${singleInfo['title']}" id="info_title" style="width: 90%" /></td>
						</tr>
						<tr>
							<td class="tdBg" width="200px">信息内容：</td>
							<td colspan="3"><textarea name="content" cols=""
									rows="" id="editor" style="width: 90%; height: 160px;"><pre>${singleInfo['content']}</pre></textarea></td>
						</tr>
						<tr>
							<td class="tdBg" width="200px">备注：</td>
							<td colspan="3"><textarea name="memo" cols="90"
									rows="3" id="info_memo">${singleInfo['memo']}</textarea></td>
						</tr>
						<tr>
							<td class="tdBg" width="200px">创建人：</td>
							<td>${singleInfo['creator']}<input type="hidden" name="creator"
								value="${singleInfo['creator']}" id="info_creator" />
							</td>
							<td class="tdBg" width="200px">创建时间:</td><td><input type="text" readonly="readonly"
								name="create_time" value=""
								id="info_createTime" /></td>
						</tr>
					</table>
					<!-- 默认信息状态为发布 -->
					<input type="hidden" name="info_id"
						value="${singleInfo['info_id']}" id="info_infoId" /> <input
						type="hidden" name="state" value="1" id="info_state" />
					<div class="tc mt20">
						<input type="submit" class="btnB2" value="保存" />
						&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
							onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>