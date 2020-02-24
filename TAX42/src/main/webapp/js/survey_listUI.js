//处理服务调查，启用或停用  
//id:要修改的调查信息的id，state：当前该信息的状态

//获取当前项目的名称（路径）
//var contextPath = "/" + window.location.pathname.split("/")[1];
function doDeal(id,state){
	window.location.href=contextPath+"/survey/updateState?id="+id+"&state="+state;
}

function doDelete(id){
	var b=confirm("确定要删除吗？");
	if (b) {
		window.location.href=contextPath+"/survey/delete?id="+id;
	}
	else{
		return false;
	}
}

function doEdit(id){
	window.location.href=contextPath+"/survey/edit?id="+id;
}