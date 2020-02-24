////******************** listUI.jsp开始****************************
//全选、全反选
function doSelectAll() {

	$("input[name=selectedRow]").prop("checked", $("#selAll").is(":checked"));
}
// 新增/编辑
function doAdd() {

	document.forms[0].action = "/TAX4/Sub/queryDept/1?id=0";
	document.forms[0].submit();
}
//
//
//
//
//
//$(function(){
//$("a[class='bianji']").click(function(){
//	var b=$(this).attr("id");
//	var a=b.substring(1);
//	document.forms[0].action = "/TAX4/Sub/queryDept/0?id="+a;
//	document.forms[0].submit();
//});
//
//$("#sousuo").click(function(){
//	var bh=$("#bianhao").val();
//	var name=$("#name").val();
//	var a=$("#selector").val();
//
//		if(bh!=""||name!=""||a!=""){
//			location.href="/TAX4/Sub/queryMatterByLike?number="+bh+"&name="+name+"&dept="+a;
//		}
//
//});
//
//
//$("a[class='jump']").click(function(){
//	
//	var biaoshi=$(this).attr("name");
//	location.href="/TAX4/Sub/queryMatterByLike?pag="+biaoshi;
//});
//
//$("#teding").keydown(function(v) {
//	var kc = v.keyCode;
//	var a=$(this).val();
//	if(kc == '13'){
//	location.href="/TAX4/Sub/queryMatterByLike?pag="+a;
//	}
//});
//});
//
//
//
//
//
//
//
//
//// 编辑
//function doEdit(id) {
//	document.forms[0].action = "editUI.html"
//	document.forms[0].submit();
//}
////停用
//function doting(id){
//	var a=id.substring(1);
//	
//	var r = confirm("确定停用吗?")
//	if (r) {
//		document.forms[0].action = "/TAX4/Sub/tq?quan="+ a+"&gai="+1;
//		document.forms[0].submit();
//	} else {
//		return false;
//	}
//}
////启用
//function doqi(id){
//	var a=id.substring(1);
//	var r = confirm("确定启用吗?")
//	if (r) {
//		document.forms[0].action = "/TAX4/Sub/tq?quan="+ a+"&gai="+0;
//		document.forms[0].submit();
//	} else {
//		return false;
//	}
//}
//// 删除
//function doDelete(id) {
//	var r = confirm("确定删除吗?")
//	if (r) {
//		document.forms[0].action = "/TAX4/Sub/delAll?quan="+ id;
//		document.forms[0].submit();
//	} else {
//		return false;
//	}
//}
// 批量删除
function doDeleteAll() {
	var r = confirm("确定批量删除吗?")
	if (r) {
		var a = "";
		var quan = document.getElementsByName("selectedRow");
		for(var i = 0; i < quan.length; i++){
			if(quan[i].checked){
				a = a + quan[i].value + ";";
				
			}
		}
		document.forms[0].action = "/TAX4/Sub/delAll?quan="+a;
		document.forms[0].submit();
	} else {
		return false;
	}
}
//
//
//
////模糊条件查询
//function doSearch(){
//	document.forms[0].action = "${basePath}user/user_listUI.action";
//	document.forms[0].submit();
//}
//// 导出用户列表
//function doExportExcel() {
//	var r = confirm("确定导出用户列表吗?")
//	if (r) {
//	   window.open("${basePath}user/user_exportExcel.action");
//	}else{
//		return false;
//	}
//}
//// 导入
//function doImportExcel() {
//	document.forms[0].action = "${basePath}user/user_importExcel.action";
//	document.forms[0].submit();
//}
//
//
//// **************************listUI.jsp结束******************************
//
////**************************addUI.jsp 与 editUI.jsp 的表单验证的js***********
////验证表单数据  提交表单
//function myClick(){
//	var name = $("#name");
//	if(name.val() == "" || name.val()==null){
//		document.getElementById("msgName").innerHTML="用户名不能为空！";
//		$("#name").focus();
//		return false;
//	}
//	var password = $("#password");
//	if(password.val() == ""){
//		document.getElementById("msgPwd").innerHTML="密码不能为空！";
//		$("#password").focus();
//		return;
//	}
//	//帐号校验
//	doVerify();
//	
//	if(vResult){
//		//提交表单
//		document.forms[0].submit();
//	}
//}








/*******************************************/

//获取当前项目的名称（路径）
var contextPath = "/" + window.location.pathname.split("/")[1];	
$(function(){
		initPage();
		
		$("#btnPrePage,#btnNextPage,#btnGo").click(function(){
		
			//获取点击按钮的id属性
			var btnWhich = $(this).attr("id");
			
			//获取搜索条件
			var pageIndex = $("#currentPage").html();
			var totalPage =$('#totalPage').html();
    		var pageSize = 2;
    		var service_id = $("#service_id").val();
    		var Sub_name = $("#Sub_name").val();
    		var sub_state = $("#selector").val();
    		//判断点击的是那一页
			if(btnWhich=="btnPrePage"){
				pageIndex--;
			}else if(btnWhich=="btnNextPage"){
				pageIndex++;
			}else{
				pageIndex = $("#txtGoPage").val();
			}
			if (pageIndex > Number(totalPage)) {
				pageIndex = (Number)(totalPage);
			}else if(pageIndex < 1){
				pageIndex = 1;
			}
    		var url=contextPath + "/Sub/queryMatterByLike?pageIndex="+pageIndex +"&pageSize="+pageSize+"&service_id="+service_id+"&Sub_name="+Sub_name+"&sub_state="+sub_state;
    		getData(url);
		});
		
		$("#btnSearch").click(function(){
			var pageIndex=1;
			var pageSize=2;
			var service_id = $("#service_id").val();
    		var Sub_name = $("#Sub_name").val();
    		var sub_state = $("#selector").val();
    		var url=contextPath + "/Sub/queryMatterByLike?pageIndex="+pageIndex +"&pageSize="+pageSize+"&number="+service_id+"&name="+Sub_name+"&dept="+sub_state;
    		getData(url);
		});
		
		$("#sub_state").change(function(){
			$("#btnSearch").click();
		});
			
		
	});
	function initPage(){
		var pageIndex=1;
		var pageSize=2;
		var url=contextPath + "/Sub/queryMatterByLike?pageIndex="+pageIndex +"&pageSize="+pageSize;
		getData(url);
	}
	
	
	function getData(url) {
		$.get(url, function(data, status) {
			$("#tbl tr:not(:first)").remove();
			$.each(data,function(k,v){
				var content="";
				if (k==0) {//取页码
					$("#currentPage").html(v.currentPage);
					$("#totalPage").html(v.totalPage);
					$("#totalRecord").html(v.totalRecord);
				}else{//拼数据
					content += '<tr><td align="center"><input type="checkbox" name="selectedRow" value="'+v.matter_id +'"/></td>' +
					'<td align="center">' + v.matter_no + '<s:property value=""/></td>' +
					'<td align="center">' + v.matter_name + '</td>' +
					'<td align="center">' + v.matter_dept + '</td>' +
					'<td align="center">' + v.matter_user + '</td>' +
					'<td align="center">' +v.matter_time+ '</td>';	
				if(v.matter_state == "0") {
					content += '<td align="center">有效</td>';
					content += '<td align="center"> <a href="'+contextPath+'/Sub/tq?quan='+ v.matter_id+'&gai=1">停用</a>'+
					 ' <a href="'+contextPath+'/Sub/queryDept/0?id='+v.matter_id+'">编辑</a>'+
					' <a href="'+contextPath+'/Sub/delAll?quan='+v.matter_id+'">删除</a></td>';
				} else {
					content += '<td align="center">无效</td>';
					content += '<td align="center"> <a href="'+contextPath+'/Sub/tq?quan='+ v.matter_id+'&gai=0">启用</a>'+
					 ' <a href="'+contextPath+'/Sub/queryDept/0?id='+v.matter_id+'">编辑</a>'+
					' <a href="'+contextPath+'/Sub/delAll?quan='+v.matter_id+'">删除</a></td>';
				}
				content += '</tr>';
				$("#tbl").append(content);
			}

		});
		$("#txtGoPage").val("");
		
		
	});
}
	