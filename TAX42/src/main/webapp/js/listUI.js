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
        		var startTime = $("#startTime").val();
        		var endTime = $("#endTime").val();
        		var sub_state = $("#sub_state").val();
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
        		var url=contextPath + "/service/selectByCondition?pageIndex="+pageIndex +"&pageSize="+pageSize+"&service_id="+service_id+"&startTime="+startTime+"&endTime="+endTime+"&sub_state="+sub_state;
        		getData(url);
    		});
    		
    		$("#btnSearch").click(function(){
    			var pageIndex=1;
    			var pageSize=2;
    			var service_id = $("#service_id").val();
        		var startTime = $("#startTime").val();
        		var endTime = $("#endTime").val();
        		var sub_state = $("#sub_state").val();
        		var url=contextPath + "/service/selectByCondition?pageIndex="+pageIndex +"&pageSize="+pageSize+"&service_id="+service_id+"&startTime="+startTime+"&endTime="+endTime+"&sub_state="+sub_state;
        		getData(url);
    		});
    		
    		$("#sub_state").change(function(){
    			$("#btnSearch").click();
    		});
    			
    		
    	});
    	function initPage(){
    		var pageIndex=1;
    		var pageSize=2;
    		var url=contextPath + "/service/selectByCondition?pageIndex="+pageIndex +"&pageSize="+pageSize;
    		getData(url);
    	}
    	
    	
    	function getData(url) {
			$.get(url, function(data, status) {
				if(status == "success") {
				
					//首先移除   除了第一行以外的    所有数据
					$("#tblService tr:not(:first)").remove();
					$.each(data, function(k, v) {
						
						var content = "";
						if(k == 0) {
							$("#currentPage").html(v.currentPage);
							$("#totalPage").html(v.totalPage);
							$("#totalRecord").html(v.totalRecord);
						} else {
							content += '<tr bgcolor="f8f8f8">' +
								'<td align="center">' + v.service_id + '</td>' +
								'<td align="center">' + v.matter + '</td>' +
								'<td align="center">' + v.sub_place + '</td>' +
								'<td align="center">' + v.sub_time + '</td>' +
								'<td align="center">' + v.subscriber + '</td>';
							if(v.sub_state == "2") {
								content += '<td align="center">未处理</td>';
								content += '<td align="center"> <a href="'+contextPath+'/Sub/queryAll?id='+v.service_id+'&no='+v.matter+'">处理</a></td>';
							} else {
								content += '<td align="center">已处理</td>';
								content += '<td></td>';
							}
							content += '</tr>';
							$("#tblService").append(content);
						}

					});
					$("#txtGoPage").val("");
				}
			});
		}
