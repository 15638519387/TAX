//******************** info  listUI.jsp开始****************************
//全选、全反选
function doSelectAll() {
	// jquery 1.6 前
	// $("input[name=selectedRow]").attr("checked",
	// $("#selAll").is(":checked"));
	// prop jquery 1.6+建议使用
	$("input[name=selectedRow]").prop("checked", $("#selectAll").is(":checked"));
}
//新增
	function doAdd(){
		document.forms[0].action = "addUI.jsp";
		document.forms[0].submit();
	}
	//编辑
	function doEdit(id){
		//获取当前项目的名称（路径）
		var contextPath = "/" + window.location.pathname.split("/")[1];
		document.forms[0].action = contextPath+"/info/selectSingleById?id="+id;
		document.forms[0].submit();
	}
	//删除
	function doDelete(id){
		var r = confirm("确定删除吗?")
		if (r) {
			//获取当前项目的名称（路径）
			var contextPath = "/" + window.location.pathname.split("/")[1];
		    window.location.href = contextPath+"/info/delete?id=" + id;
		}else{
			return false;
		}
	}
	
	function doUpdateState(that){
		//state:当前状态。停用要改为发布；发布要改为停用
		var id = $(that).attr("info_id");
		var state = $(that).attr("state");
		var contextPath = "/" + window.location.pathname.split("/")[1];
//		window.location.href = contextPath+"/info/updateState?id="+id+"&state="+state;
		$.get(contextPath+"/info/updateState?id="+id+"&state="+state,function(data,status){
			if (data=="1") {
				if ($(that).html()=="发布") {
					//如果本来是停用状态，现在要改为发布状态
					$(that).html("停用").attr("state","1");
					//还要把它前面的单元格中的内容改变
					$(that).parent().prev('td').html("发布");
				}else{
					//如果本来是发布状态，那么想在要改为停用状态
					$(that).html("发布").attr("state","0");
					$(that).parent().prev('td').html("停用");
				}
			}else{
				alert("服务器开小差了，请稍后再试。。。");
			}
		});
	}
	//批量删除
	function doDeleteAll(){
		var checkeds = $("input[name=selectedRow]:checked");
		if (checkeds.length == 0) {
			alert("请先选择要删除的信息");
			return;
		}
		var r = confirm("确定批量删除吗?")
		if (r) {
			var ids="";
			$("input[name=selectedRow]:checked").each(function(){
				ids += $(this).val()+",";
			});
			ids=ids.substr(0,ids.length-1);
			var contextPath = "/" + window.location.pathname.split("/")[1];
			window.location.href = contextPath+"/info/deleteAll?ids="+ids;
		}else{
			return false;
		}
	}
	
	
	
