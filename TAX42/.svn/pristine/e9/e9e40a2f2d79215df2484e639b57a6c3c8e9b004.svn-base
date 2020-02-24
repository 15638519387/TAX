//******************** listUI.jsp开始****************************
//全选、全反选
function doSelectAll() {
	// jquery 1.6 前
	// $("input[name=selectedRow]").attr("checked",
	// $("#selAll").is(":checked"));
	// prop jquery 1.6+建议使用
	$("input[name=selectedRow]").prop("checked", $("#selAll").is(":checked"));
}
// 新增
function doAdd() {
	document.forms[0].action = "addUI.jsp";
	document.forms[0].submit();
}
// 编辑
function doEdit(id) {
	document.forms[0].action = "http://localhost:8080/TAX4/user/editUI/"+ id;
	document.forms[0].submit();
}
// 删除
function doDelete(id) {
	var r = confirm("确定删除吗?")
	if (r) {
		document.forms[0].action = "http://localhost:8080/TAX4/user/del/"+ id;
		document.forms[0].submit();
	} else {
		return false;
	}
}
// 批量删除
function doDeleteAll() {
	var r = confirm("确定批量删除吗?")
	if (r) {
		document.forms[0].action = "http://localhost:8080/TAX4/user/dels";
		document.forms[0].submit();
	} else {
		return false;
	}
}
//模糊条件查询 , 分页 ， 开始加载数据
function doSearch(obj){
	
	var name = $("#userName").val();
	var pageNum = 1 ;
	
	if(obj!=null ){
		pageNum = $("#pageNum").text();
		if("up" == obj){
			if(pageNum == 1){
				return ;
			}
			pageNum = parseInt(pageNum) -1 ;
		}
		if("down" == obj){
			if(pageNum == $("#pages").text()){
				return ;
			}
			pageNum = parseInt(pageNum) + 1 ;
		}
		if("tiao" == obj){
			if($("#do").val() > $("#pages").text() || $("#do").val() < 1){
				return ;
			}
			pageNum = $("#do").val();
		}
	}
	
	$.ajax({
		 url: "http://localhost:8080/TAX4/user/listUI",
        type: "post",
        dataType: "json",
        data:{"userName" : name , "pageNum": pageNum},
        success:function(data){
        	$(".table").empty();
	       	$.each(data.list,function(i,v){
	       		 var content="";
	       		 content += "<tr bgcolor='f8f8f8'>" +
	                        "<td align='center'><input type='checkbox' name='selectedRow' value='" + v.id + "' /></td>" +
	                        "<td align='center'>" + v.name + "</td>" +
	                        "<td align='center'>" + v.account + "</td>" +
	                        "<td align='center'>" + v.dept + "</td>" ;
	                    if (v.gender == "1") {
	                   	 content += "<td align='center'>男</td>";
	                    } else {
	                   	 content += "<td align='center'>女</td>";
	                    }
	                    content += "<td align='center'>" + v.email + "</td>" +
	                    "<td align='center'>" +
	                    "<a href='javascript:doEdit(" + v.id + ")'>编辑</a>" +
	                    "<a href='javascript:doDelete(" + v.id + ")'>删除</a>" +
	                    "</td>" +
	                    "</tr>";
	       		 $(".table").append(content);
	       	 });
	       	var total = data.total ;
			var pageNum = data.pageNum ;
			var pages = data.pages ;
			
			$("#total").text(total);
			$("#pageNum").text(pageNum);
			$("#pages").text(pages);
        },
        error:function(){
        }
	});
}
// 导出用户列表
function doExportExcel() {
	var r = confirm("确定导出用户列表吗?")
	if (r) {
		document.forms[0].action = "http://localhost:8080/TAX4/user/export";
		document.forms[0].submit();
	}else{
		return false;
	}
}
// 导入
function doImportExcel() {
	
	var formData = new FormData(document.forms[0]);
		
		$.ajax({
			type:"post",
			url:"http://localhost:8080/TAX4/user/import",
			data:formData,
			async:true,
			contentType:false,// 使用enctype的形式提交
			processData: false,
			success:function(data){
				if(data){
					alert("导入成功");
					doSearch(null);
				} else {
					alert("导入失败");
				}
			}
		});
}



