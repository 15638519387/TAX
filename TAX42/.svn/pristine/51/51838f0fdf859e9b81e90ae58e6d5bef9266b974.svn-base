//******************** ROLE  listUI.jsp开始****************************
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
	document.forms[0].action = "http://localhost:8080/TAX4/tax/role/addUI.jsp";
	document.forms[0].submit();
}
// 编辑
function doEdit(id) {
	document.forms[0].action = "http://localhost:8080/TAX4/role/edit/"+id;
	document.forms[0].submit();
}
// 删除
function doDelete(id) {
	var r = confirm("确定删除吗?")
	if (r) {
		document.forms[0].action = "http://localhost:8080/TAX4/role/del/"+ id;
		document.forms[0].submit();
	} else {
		return false;
	}
}
// 批量删除
function doDeleteAll() {
	var r = confirm("确定批量删除吗?")
	if (r) {
		document.forms[0].action = "http://localhost:8080/TAX4/role/delAll";
		document.forms[0].submit();
	} else {
		return false;
	}
}
// 模糊查询 , 分页 ， 开始加载数据
function doSearch(obj) {
	var name = $("#roleName").val();
	var pageNum = 1 ;
	
	if(obj!=null){
		pageNum = $("#pageNum").text();
		if("up" == obj){
			if(pageNum == 1){
				return ;
			}
			pageNum = parseInt(pageNum) - 1 ;
		}
		if("down" == obj){
			if(pageNum == $("#pages").text()){
				return ;
			}
		    pageNum = parseInt(pageNum) + 1 ;
		}
		if("tiao" == obj){
			if($("#do").val() > $("#pages").text() || $("#do").val() < 1){
				return;
			}
		    pageNum =$("#do").val();
		}
	}
	
	$.ajax({
		url:"http://localhost:8080/TAX4/role/listUI",
		type:"post",
		data:{"roleName":name ,"pageNum":pageNum},
		dataType:"json",
		success:function(data){
			$(".table").empty();
			$.each(data.list,function(i,v){
				var con = "" ;
				con+="<tr bgcolor='f8f8f8' >"+
                "<td align='center'><input type='checkbox' name='selectedRow' value='"+v.role_id+"'/></td>"+
                "<td align='center'>"+v.name+"</td>"+
                "<td align='center'>"+v.code+"</td>";
                
                if(v.state == "1"){
                	con+="<td align='center'>有效</td>";
                }else{
                	con+="<td align='center'>无效</td>";
                }
                
                con+="<td align='center'>"+
                    "<a href='javascript:doEdit("+v.role_id+")'>编辑</a>"+
                    "<a href='javascript:doDelete("+v.role_id+")'>删除</a>"+
                "</td>"+
            "</tr>";
                $(".table").append(con);
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


