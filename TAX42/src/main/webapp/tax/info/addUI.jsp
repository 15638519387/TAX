<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	//实例化UE
	window.UEDITOR_HOME_URL = "../../js/ueditor/";
	var ue = UE.getEditor('editor');
</script>
<script type="text/javascript">
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
	});
</script>

</head>
<body class="rightBody">
	<form id="form" name="form" action="${pageContext.request.contextPath }/info/insert" method="post"
		enctype="multipart/form-data">
		<div class="p_d_1">
			<div class="p_d_1_1">
				<div class="content_info">
					<div class="c_crumbs">
						<div>
							<b></b><strong>信息发布管理</strong>&nbsp;-&nbsp;新增信息
						</div>
					</div>
					<div class="tableH2">新增信息</div>
					<table id="baseInfo" width="100%" align="center" class="list"
						border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td class="tdBg" width="200px">信息分类：</td>
							<td><select name="type" id="info_type">
									<option value="tzgg">通知公告</option>
									<option value="zcsd">政策速递</option>
									<option value="nszd">纳税指导</option>
							</select></td>
							<td class="tdBg" width="200px">来源：</td>
							<td><input type="text" name="source" value=""
								id="info_source" /></td>
						</tr>
						<tr>
							<td class="tdBg" width="200px">信息标题：</td>
							<td colspan="3"><input type="text" name="title"
								value="" id="info_title" style="width: 90%" /></td>
						</tr>
						<tr>
							<td class="tdBg" width="200px">信息内容：</td>
							<td colspan="3"><textarea name="content" cols=""
									rows="" id="editor" style="width: 90%; height: 160px;"></textarea></td>
						</tr>
						<tr>
							<td class="tdBg" width="200px">备注：</td>
							<td colspan="3"><textarea name="memo" cols="90"
									rows="3" id="info_memo"></textarea></td>
						</tr>
						<tr>
							<td class="tdBg" width="200px">创建人：</td>
							<td><input type="text" name="creator" value="${user_map.name }"
								id="info_creator" />
							</td>
							<td class="tdBg" width="200px">创建时间：</td>
							<td><input type="text" name="create_time" value=""
								readonly="readonly" id="info_createTime" />
								<input type="hidden" name="state" value="1"/></td>
						</tr>
					</table>

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