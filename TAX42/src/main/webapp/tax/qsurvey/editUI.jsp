<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../../js/jquery/jquery-3.1.1.min.js"></script>
<link href="../../css/skin1.css" rel="stylesheet" type="text/css" />
<title>服务调查管理</title>
<style>
.style {
	white-space: nowrap;
}
</style>
<script type="text/javascript">
	$(function(){
		//////给三个date类型的input赋值
		var starttime='${singleSurvey.ss_starttime }';
		var starttimes = starttime.split(" ");
		var endtime='${singleSurvey.ss_endtime }';
		var endtimes=endtime.split(" ");
		var applytime='${singleSurvey.ss_applytime}';
		var applytimes=applytime.split(" ");
		$("#survey_starttime").attr("value",starttimes[0]);
		$("#survey_endtime").attr("value",endtimes[0]);
		$("#survey_time").attr("value",applytimes[0]);
	});
	
	
	
	//获取当前项目的名称（路径）
	var contextPath = "/" + window.location.pathname.split("/")[1];
	
	var cnt = 0;
	var cnt1 = 0;
	function addDiv() {
		cnt = eval(cnt + 1);
		var div = "<div style='width:500px;height:auto;' id="+cnt+"></div>";
		$("#add1").append(div);
		var seq = "<td><input type='text' name='seq' value=" + cnt
				+ " style='width:20%' class ='style' readonly></td>";
		var title = "<td><input type='text' name='title' value='123' class ='style'></td>";
		var select = "<td><select class ='style'><option value='1'>单选</option><option value='2'>多选</option></select></td>";
		var addSelect = "<td><input type='button' name='addSelect' value='增加选项' id='addSelect' onclick='fun1(this)' class='btnB4'/></td>";
		var cla = $(document.getElementById(cnt));
		cla.append(seq);
		cla.append(title);
		cla.append(select);
		cla.append(addSelect);
		cla.append("<tr>");

	}

	function fun1(aaa) {
		cnt1 = eval(cnt1 + 1);
		var div2 = "<div style='width:100px;height:30px;white-space:nowrap' id=i"+cnt1+"></div>";
		var cla = $(aaa).parent().parent();
		cla.append(div2);
		cnt2 = "i" + cnt1;
		var cla1 = $(document.getElementById(cnt2));
		var content = "<tr><td><input type='text' name='content' value=''/></td><td><input type='button' name='addSelect' value='删除' id='addSelect' onclick='fun2(this)' class='btnB4'/></td></tr>";
		var butt = "";
		cla1.append(content);
	}

	function fun2(that) {
		$(that).parent().parent().parent().remove();
	}
	
	$(function(){
		$("#btnSave").click(function(){
			var jsonArray=getJsonArray();
			var jsonData = JSON.stringify(jsonArray);
			$("#txtJsonData").val(jsonData);
			document.forms[0].action=contextPath+"/survey/update";
			document.forms[0].submit();
		});
		
	});
		
		function getJsonArray(){
			//创建json数组，用于向后台发送数据
			var jsonArray=[];
			//获取到所有的问题（大的div）
			var $questions = $("#add1 > div");
			//遍历每个div
			$questions.each(function(k,v){
				var jsonStr={};
				//1.获取题号
				var question_no = $(v).children("td:first").children("input").val();
				jsonStr.question_no = question_no;
				//2.获取题目
				var question_title = $(v).children("td:eq(1)").children("input").val();
				jsonStr.question_title = question_title;
				//3.获取问题类型：1单选；2多选
				var question_type = $(v).children("td:eq(2)").children("select").val();
				jsonStr.question_type = question_type;
				//4.获取问题的答案。也是div
				var $answers = $(v).children("div");
				//由于答案数量不确定，所以需要遍历
				var question_answer = [];
				$answers.each(function(k,v){
					var answer = $(v).children("tr").children("td:first").children("input").val();
					question_answer.push(answer);
				});
				jsonStr.qustion_answer=question_answer;
				jsonArray.push(jsonStr);
			});
			
			//最后再获取，上面的服务调查信息
			var formData={};
			//获取到该服务调查的id，也传到后台去
			var survey_id='${singleSurvey.ss_id}';
			
			var survey_title = $("#survey_title").val();
			var survey_starttime = $("#survey_starttime").val();
			var survey_endtime = $("#survey_endtime").val();
			var survey_state = $("input[name=survey_state]:checked").val();
			var survey_dept=$("#survey_dept").val();
			var survey_person=$("#survey_person").val();
			var survey_time=$("#survey_time").val();
			formData.survey_id = survey_id;
			formData.survey_title = survey_title;
			formData.survey_starttime = survey_starttime;
			formData.survey_endtime = survey_endtime;
			formData.survey_state = survey_state;
			formData.survey_dept = survey_dept;
			formData.survey_person = survey_person;
			formData.survey_time = survey_time;
			jsonArray.push(formData);
			return jsonArray;
		}
		
		
		$(function() {
			//调查问卷的id
			var id = '${singleSurvey.ss_id}';
			var url = contextPath + "/survey/selectQuestion?id=" + id;
			//控制答案的div的id
			var j=0;
			$.get(url, function(data, status) {
				if(status == "success") {
					//data:该调查问卷下的所有问题
					$.each(data, function(k, v) {
						//每遍历一次，让题号++
						cnt++;
							//一个完整的问题的div
							var div = "<div style='width:500px;height:auto;' id=" + k + "></div>";
							$("#add1").append(div);
							//拼接问题
							var question = "";
							question += '<td><input type="text" name="seq" value="' + (k + 1) + '" style="width:20%" class="style" readonly=""></td>' +
								'<td><input type="text" name="title" value="' + v.sq_title + '" class="style"></td>' +
								'<td>';
							if(v.ss_type == 1) {
								question += '<select class="style" name="ss_type">' +
									'<option value="1" selected="selected">单选</option>' +
									'<option value="2">多选</option>' +
									'</select>';
							} else {
								question += '<select class="style" name="ss_type">' +
									'<option value="1">单选</option>' +
									'<option value="2" selected="selected">多选</option>' +
									'</select>';
							}
							question += '</td>' +
								'<td><input type="button" name="addSelect" value="增加选项" id="addSelect" onclick="fun1(this)" class="btnB4">' +
								'</td>';

							$("#" + k).append(question);
							//答案是json串的形式
							var jsonObj = JSON.parse(v.ss_choice);
						
							//拼接答案
							for(var key in jsonObj){
								var answerDiv="";
								var answer="";
								answerDiv='<div style="width:100px;height:30px;white-space:nowrap" id="answer'+j+'"></div>';
								$("#" + k).append(answerDiv);
								answer = '<tr><td><input type="text" name="content" value="'+jsonObj[key]+'"></td>'
								+'<td><input type="button" name="addSelect" value="删除" id="addSelect" onclick="fun2(this)" class="btnB4"></td>';
								+'</tr>';
								$("#answer" + j).append(answer);
								j++;
							}
						});
				}				
			});
		});
		

</script>
</head>
<body class="rightBody">
	<form action="" method="post">
		<input type="text" id="txtJsonData" name="txtJsonData" value=""/>
		<div class="p_d_1">
			<div class="p_d_1_1">
				<div class="content_info">
					<div class="c_crumbs">
						<div>
							<b></b><strong>服务调查</strong>&nbsp;-&nbsp;新增/编辑服务调查
						</div>
					</div>
					<div class="tableH2">新增/编服务调查</div>
					<table id="baseInfo" width="100%" align="center" class="list"
						border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td class="tdBg" width="200px">调查标题</td>
							<td colspan="3"><input id="survey_title" value="${singleSurvey.ss_title }" type="text"
								style="width: 90%" /></td>
						</tr>
						<tr>
							<td class="tdBg" width="200px">开始时间</td>
							<td><input type="date" id="survey_starttime" value="${singleSurvey.ss_starttime }"/></td>
							<td class="tdBg" width="200px">结束时间</td>
							<td><input type="date" id="survey_endtime" value="${singleSurvey.ss_endtime }"/></td>
						</tr>
						<tr>
							<td class="tdBg" width="200px">是否有效</td>
							<td>
								<c:if test="${singleSurvey.ss_state==1 }">
									<input type="radio" name="survey_state" value="1" checked="checked"/>有效 
									<input type="radio" name="survey_state" value="0" />无效</td>
								</c:if>
								<c:if test="${singleSurvey.ss_state==0 }">
									<input type="radio" name="survey_state" value="1" />有效 
									<input type="radio" name="survey_state" value="0" checked="checked"/>无效</td>
								</c:if>
							<td class="tdBg" width="200px">申请部门</td>
							<td><select id="survey_dept">
									<c:if test="${singleSurvey.ss_dept==1 }">
										<option value="1" selected="selected">部门A</option>
										<option value="2">部门B</option>
										<option value="3">部门C</option>
									</c:if>
									<c:if test="${singleSurvey.ss_dept==2 }">
										<option value="1" >部门A</option>
										<option value="2" selected="selected">部门B</option>
										<option value="3">部门C</option>
									</c:if>
									<c:if test="${singleSurvey.ss_dept==3 }">
										<option value="1" >部门A</option>
										<option value="2">部门B</option>
										<option value="3" selected="selected">部门C</option>
									</c:if>
								</select>
							</td>
						</tr>

						<tr>
							<td class="tdBg" width="200px" >申请人</td>
							<td><input  value="${singleSurvey.ss_applyer }" type="text" id="survey_person"/></td>
							<td class="tdBg" width="200px">申请时间</td>
							<td><input type="date" id="survey_time" value="${singleSurvey.ss_applytime }"/></td>
						</tr>
						</tr>
					</table>
					<input type="button" onclick="addDiv()" class="btnB8"
						value="新增问卷调查题目" />
					<div id="add1" style='height: auto;'>

							
					</div>
					</div>
					<div class="tc mt20">
						<input type="button" class="btnB2" id="btnSave" value="保存" />
						&nbsp;&nbsp;&nbsp;&nbsp; <input type="button"
							onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
					</div>



				</div>
			</div>
		</div>
	</form>
</body>
</html>