<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>我要投诉</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery/jquery-3.1.1.min.js"></script>
<link href="../css/home.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/hxjzg.js"></script>
<link href="../css/skin1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

	$(function(){
		$("#to_comp_dept").change();
	})
	function loadPerson(that){
		var dept = $(that).val();
		var url="${pageContext.request.contextPath}/complain/loadPerson?dept="+dept;
		$.get(url,function(data,status){
			if (status=="success") {
				$("#to_comp_name").empty();
				$.each(data,function(k,v){
					$("#to_comp_name").append('<option value="'+v.name+'">'+v.name+'</option>');
				});
			}
		});
	}
</script>
</head>
<body align="center">
	<!-- 头部{ -->
	<table width="1222" border="0" align="center" cellpadding="0"
		cellspacing="0" background="../images/home/top_bg.png" class="top">
		<tr>
			<td width="32" height="106">&nbsp;</td>
			<td width="418" height="106" align="left" valign="middle"><img
				class="zxx_test_png" src="../images/home/ind01.png" width="470"
				height="90" alt="" /></td>
			<td width="211">&nbsp;</td>
			<td width="328"><object id="FlashID"
					classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="450"
					height="86">
					<param name="movie" value="../images/home/flash.swf" />
					<param name="quality" value="high" />
					<param name="wmode" value="transparent" />
					<param name="swfversion" value="6.0.65.0" />
					<!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
					<param name="expressinstall" value="Scripts/expressInstall.swf" />
					<!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
					<!--[if !IE]>-->
					<object type="application/x-shockwave-flash"
						data="../images/home/flash.swf" width="380" height="86">
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
									alt="获取 Adobe Flash Player" width="112" height="33" /> </a>
							</p>
						</div>
						<!--[if !IE]>-->
					</object>
					<!--<![endif]-->
				</object></td>
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
						<td align="right"><a><b></b><font color="red">欢迎您:张三&nbsp;</font></a>
						</td>
						<td align="center"><img src="../images/home/help.png"
							width="12" height="17" /></td>
						<td align="left"><a href="javascript:void(0);">帮助</a></td>
						<td align="center"><img src="../images/home/exit.png"
							width="14" height="14" /></td>
						<td align="left" valign="middle"><a href="../loginUI.html">退出</a></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<!-- }头部 -->
	<!-- 导航{ -->
	<div class="menu">
		<ul class="clearfix">
			<li class="hover"><a href="home.html">工作主页</a></li>
			<li><a href="../tax/frame.html">纳税服务</a></li>
		</ul>
	</div>
	<!-- }导航 -->
	<div class="detail">
		<div class="detail_center">
			<form id="form" name="form"
				action="${pageContext.request.contextPath}/complain/insert"
				method="post" enctype="multipart/form-data">
				<div class="p_d_1">
					<div class="p_d_1_1">
						<div class="content_info">
							<div class="c_crumbs">
								<div>
									<b></b><strong>我要投诉</strong>
								</div>
							</div>
							<table id="baseInfo" width="100%" align="center" class="list"
								border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td class="tdBg" width="200px">被投诉部门：</td>
									<td><select name="to_comp_dept" id="to_comp_dept" onchange="loadPerson(this)">
<!-- 											<option value="">全部</option> -->
											<option value="部门A">部门A</option>
											<option value="部门B">部门B</option>
											<option value="部门C">部门C</option>
									</select></td>
								</tr>
								<tr>
									<td class="tdBg" width="200px">被投诉人：</td>
									<td colspan="3">
										<select name="to_comp_name" id="to_comp_name">
											
										</select></td>
								</tr>
								<tr>
									<td class="tdBg" width="200px">标题：</td>
									<td colspan="3"><textarea name="comp_title" cols="90"
											rows="3" id="info_comp_title"></textarea></td>
								</tr>
								<tr>
									<td class="tdBg" width="200px">投诉详情：</td>
									<td colspan="3"><textarea name="comp_content" cols=""
											rows="" id="editor" style="width: 90%; height: 160px;"></textarea></td>
								</tr>

								<tr>
									<td class="tdBg" width="200px">是否匿名投诉：</td>
									<td><label for="user_state1">是</label> <input type="radio"
										name="is_NM" id="user_state1" checked="checked" value="1" /><label
										for="user_state0">否</label> <input type="radio" name="is_NM"
										id="user_state0" value="0" /></td>
								</tr>
									<!-- 这是投诉信息状态，默认是未受理（0） -->
									<input type="hidden" name="state" value="0" />
							</table>
							<div class="tc mt20">
								<input type="submit" class="btnB2" value="提交" /> <input
									type="button" onclick="javascript:history.go(-1)" class="btnB2"
									value="返回" />
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- 尾部{ -->
	<div class="foot">版权所有©国税局 2017年</div>
	<!-- }尾部 -->
</body>
</html>