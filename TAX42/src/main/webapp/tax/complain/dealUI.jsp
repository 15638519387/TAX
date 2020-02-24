<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	
</style>
<script type="text/javascript" src="../../js/jquery/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="../../js/hxjzg.js"></script>
<link href="../../css/skin1.css" rel="stylesheet" type="text/css" />
<title>投诉受理管理</title>
</head>
<body class="rightBody">‫
	<form id="form" name="form"
		action="${pageContext.request.contextPath }/complainReply/insert"
		method="post" enctype="multipart/form-data">
		<div class="p_d_1">
			<div class="p_d_1_1">
				<div class="content_info">
					<div class="c_crumbs">
						<div>
							<b></b><strong>投诉受理管理</strong>&nbsp;-&nbsp;投诉受理
						</div>
					</div>
					<div class="tableH2">
						投诉详细信息
						<c:if test="${singleComplain_isDeal=='受理' }">
							<span style="color: red;">(待受理)</span>
						</c:if>
						<c:if test="${singleComplain_isDeal=='查看' }">
							<span style="color: red;">(已受理)</span>
						</c:if>
					</div>
					<table id="baseInfo" width="100%" align="center" class="list"
						border="0" cellpadding="0" cellspacing="0">

						<!-- ******************投诉人信息********************* -->

						<tr>
							<td colspan="2" align="center">投诉人信息<input type="hidden"
								name="comp_id" value="${singleComplain_list['comp_id']}" /><input type="hidden"
								id="isDeal" value="${singleComplain_isDeal }" /></td>
						</tr>
						<tr>
							<td class="tdBg" width="250px">是否匿名投诉：</td>
							<!--注意mysql中的bit对应的是java当中的boolean类型。所以这里取出来的值是true和false -->
							<c:if test="${singleComplain_list['is_NM']==true}">
								<td>是</td>
							</c:if>
							<c:if test="${singleComplain_list['is_NM']==false}">
								<td>否</td>
							</c:if>
						</tr>
						<tr>
							<td class="tdBg">投诉人单位：</td>
							<c:if test="${singleComplain_list['is_NM']==true}">
								<td>XXX</td>
							</c:if>
							<c:if test="${singleComplain_list['is_NM']==false}">
								<td>${singleComplain_list['comp_company'] }</td>
							</c:if>
						</tr>
						<tr>
							<td class="tdBg">投诉人姓名：</td>
							<c:if test="${singleComplain_list['is_NM']==true}">
								<td>XXX</td>
							</c:if>
							<c:if test="${singleComplain_list['is_NM']==false}">
								<td>${singleComplain_list['comp_name'] }</td>
							</c:if>
						</tr>
						<tr>
							<td class="tdBg">投诉人手机：</td>
							<c:if test="${singleComplain_list['is_NM']==true}">
								<td>XXX</td>
							</c:if>
							<c:if test="${singleComplain_list['is_NM']==false}">
								<td>${singleComplain_list['comp_mobile'] }</td>
							</c:if>
						</tr>

						<!-- ***************************投诉信息********************* -->

						<tr>
							<td colspan="2" align="center">投诉信息</td>
						</tr>
						<tr>
							<td class="tdBg">投诉时间：</td>
							<td>${singleComplain_list['comp_time'] }</td>
						</tr>
						<tr>
							<td class="tdBg">被投诉部门：</td>
							<td>${singleComplain_list['to_comp_dept'] }</td>
						</tr>
						<tr>
							<td class="tdBg">被投诉人：</td>
							<td>${singleComplain_list['to_comp_name'] }</td>
						</tr>
						<tr>
							<td class="tdBg">投诉标题：</td>
							<td>${singleComplain_list['comp_title'] }</td>
						</tr>
						<tr>
							<td class="tdBg">投诉内容：</td>
							<!-- 不去解析  内容是什么就显示什么 -->
							<td><p>
								${singleComplain_list['comp_content'] }
								</p></td>
						</tr>

						<!-- ***************************受理信息********************* -->

						<tr>
							<td colspan="2" align="center">受理信息</td>
						</tr>
						<tr>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td colspan="2" align="center">受理操作</td>
						</tr>
						<tr>
							<td class="tdBg">回复部门：</td>
						<c:if test="${ !empty singleComplain_list['reply_dept']}">
								<td>${singleComplain_list['reply_dept'] }<input type="hidden" name="reply_dept" value="${singleComplain_list['reply_dept'] }"
								id="reply_replyDept" /></td>
								</tr>
								<tr>
									<td class="tdBg">回复人：</td>
									<td>${singleComplain_list['replyer'] }<input type="hidden" name="replyer" value="${singleComplain_list['replyer'] }"
										id="reply_replyer" /></td>
								</tr>
						</c:if>
						<c:if test="${ empty singleComplain_list['reply_dept']}">
							<td>${user_map.dept }<input type="hidden" name="reply_dept" value="${user_map.dept }"
								id="reply_replyDept" /></td>
							</tr>
						<tr>
							<td class="tdBg">回复人：</td>
							<td>${user_map.name }<input type="hidden" name="replyer" value="${user_map.name }"
								id="reply_replyer" /></td>
						</c:if>
						</tr>

						<tr>
							<td class="tdBg" width="200px">回复内容：</td>
							<td>
								<c:if test="${singleComplain_isDeal=='查看' }">
									<textarea name="reply_content" cols="90" rows="8" readonly="readonly"
										id="reply_replyContent">${singleComplain_list['reply_content'] }</textarea>
								</c:if>
								<c:if test="${singleComplain_isDeal=='受理' }">
									<textarea name="reply_content" cols="90" rows="8" 
										id="reply_replyContent">${singleComplain_list['reply_content'] }</textarea>
								</c:if>
							</td>
						</tr>
					</table>

					<div class="tc mt20">
						<c:if test="${singleComplain_isDeal=='查看' }">
							<input type="submit" class="btnB2" value="保存"  disabled="disabled"/>
						</c:if>
						<c:if test="${singleComplain_isDeal=='受理' }">
							<input type="submit" class="btnB2" value="保存" />
						</c:if>
						&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
							onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</html>