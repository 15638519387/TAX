<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="../../js/jquery/jquery-3.1.1.min.js"></script>
<link href="../../css/skin1.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/hxjzg.js"></script>
<title>投诉受理管理</title>
<style type="text/css">
</style>
<script type="text/javascript" src="../../js/datepicker/WdatePicker.js"></script>
<script type="text/javascript" src="../../js/Chart.js"></script>
<script type="text/javascript">

	$(function() {
		//搜索
		$("#btnPrePage,#btnNextPage,#btnGo,#btnSearch").click(function() {
			//获取到点击的是哪个按钮
			var whichButton = $(this).attr("id");
			//pageIndex:当前页码     totalPage:总页数	 totalRecord:总记录条数	isDeal:该投诉是否已被受理
			var pageIndex,totalPage,totalRecord,isDeal;
			//如果是点击了搜索
			if (whichButton=='btnSearch') {
				pageIndex=1;
			}else{//点击了上页、下页、跳转
				//获取当前页码
				pageIndex = $("#currentPage").html();
				//点击了上一页
				if ($(this).html()=="上一页") {
					pageIndex--;
				}//点击了下一页
				else if($(this).html()=="下一页"){
					pageIndex++;
				}//点击了Go
				else if($(this).val()=='Go'){
					//如果跳转框没有值，则返回
					if ($('#txtGoPage').val()=='') {
						return false;
					}
					//如果跳转框中有值，则赋给pageIndex
					pageIndex=$('#txtGoPage').val();
				}
				if (pageIndex > Number($("#totalPage").html())) {
					pageIndex = Number($("#totalPage").html());
				}
				if (pageIndex < 1) {
					pageIndex = 1;
				}
			}
			//接收表单数据
			var formData = $("form").serialize();
			var formData = formData + "&pageIndex=" + pageIndex;

			$.get("${pageContext.request.contextPath }/complain/selectByCondition?"+ formData,function(data, status) {
				//清空表格内容
				$("#tblComplain").empty();
				//添加标题
				$("#tblComplain").append('<tr class="t_tit">'
										+ '<td align="center">投诉标题</td>'
										+ '<td width="120" align="center">被投诉部门</td>'
										+ '<td width="120" align="center">被投诉人</td>'
										+ '<td width="140" align="center">投诉时间</td>'
										+ '<td width="100" align="center">受理状态</td>'
										+ '<td width="100" align="center">操作</td>'
										+ '</tr>');
				$.each(data,function(k,v){
					//json中的第一条数据保存了当前页码、总页数、总记录条数
					if (k==0) {
						pageIndex = v.currentPage;
						totalPage = v.totalPage;
						totalRecord = v.totalRecord;
					}else{
						var complain="";
						//判断是否为奇数行，因为k从0开始
						if (k%2==0) {
							complain += '<tr bgcolor="f8f8f8">';
						}else{
							complain += '<tr>';
						}
						complain += '<td align="center">'+v.comp_title+'</td>'+
						'<td align="center">'+v.to_comp_dept+'</td>'+
						'<td align="center">'+v.to_comp_name+'</td>'+
						'<td align="center">'+(new Date(v.comp_time).toLocaleString('chinese',{hour12:false}))+'</td>';
						if (v.state==0) {
							complain += '<td align="center">待受理</td>'+
							'<td align="center"><a name="btnDeal" href="javascript:void(0);" comp_id="'+v.comp_id+'">受理</a></td>';
						}else if(v.state==1){
							complain += '<td align="center">已受理</td>'+
		 					'<td align="center"><a name="btnDeal"'+
		 						'href="javascript:void(0);" class="disabled"'+
		 						'comp_id="'+v.comp_id+'">查看</a></td>';
						}else if(v.state==2){
							complain += '<td align="center">已失效</td>'+
		 					'<td align="center"><a name="btnDeal"'+
		 						'href="javascript:void(0);" class="disabled"'+
		 						'comp_id="'+v.comp_id+'">查看</a></td>';
						}
						complain += '</tr>';
						//向表格添加内容
						$("#tblComplain").append(complain);
					}
				});
				//通过异步创建的元素的绑定事件会失效，需要重新绑定
				//投诉受理
				$('a[name=btnDeal]').click(function() {
					var compId = $(this).attr("comp_id");
					//未受理
					isDeal = $(this).html();
					window.location.href = "${pageContext.request.contextPath}/complain/selectSingle?comp_id="
							+ compId +"&isDeal="+isDeal;
				});
				//查看投诉
				$('a[name=btnLook]').click(function(){
					var compId = $(this).attr("comp_id");
					//已受理或已失效
					isDeal = $(this).html();
					window.location.href = "${pageContext.request.contextPath}/complain/selectSingle?comp_id="
							+ compId +"&isDeal="+isDeal;
				});
				
				$("#currentPage").html(pageIndex);
				$("#totalPage").html(totalPage);
				$("#totalRecord").html(totalRecord);
				$("#txtGoPage").val("");
			});
		});
		
		
		//每页显示条数改变事件
		$("#sePageSize").change(function(){
			//手动调用搜索按钮的点击事件，重新搜索
			$("#btnSearch").click();
		});
		//状态下拉框改变事件
		$("#complain_state").change(function(){
			//手动调用搜索按钮的点击事件，重新搜索
			$("#btnSearch").click();
		});
		//重置搜索条件
		$("#btnReset").click(function(){
			$("#comp_title").val("");
			$("#startTime").val("");
			$("#endTime").val("");
			$("#complain_state")[0].selectedIndex=0;
			$("#sePageSize")[0].selectedIndex=0;
			$("#txtGoPage").val("");
			$("#btnSearch").click();
		});
	});
	
	
	$(function() {
		//投诉受理
		$('a[name=btnDeal]').click(function() {
			var compId = $(this).attr("comp_id");
			isDeal = $(this).html();
			window.location.href = "${pageContext.request.contextPath}/complain/selectSingle?comp_id="
					+ compId +"&isDeal="+isDeal;
		});
		//查看投诉
		$('a[name=btnLook]').click(function(){
			var compId = $(this).attr("comp_id");
			//已受理或已失效
			isDeal = $(this).html();
			window.location.href = "${pageContext.request.contextPath}/complain/selectSingle?comp_id="
					+ compId +"&isDeal="+isDeal;
		});
		
		
		var arrayCalc=[];
		$("#btnCalc").click(function(){
			var url="${pageContext.request.contextPath}/complain/calc";
			$.get(url,function(data,status){
				$.each(data,function(k,v){
					var dept=v.dept;
					var count=v.count;
					var dept_count={};
					dept_count.dept=dept;
					dept_count.count=count;
					arrayCalc.push(dept_count);
				});
				calcPic(arrayCalc);
			});
		});
	});
	
	function calcPic(arrayCalc){
		var x1=arrayCalc[0].dept;
		var x2=arrayCalc[1].dept;
		var x3=arrayCalc[2].dept;
		var y1=arrayCalc[0].count;
		var y2=arrayCalc[1].count;
		var y3=arrayCalc[2].count;
		
		var ctx = document.getElementById("myChart").getContext('2d');
		var myChart = new Chart(ctx, {
			//声明要显示的统计图的类型。 同一套数据是可以用不同的统计图类型显示出来的， 
			//可选的有bar, bubble, doughnut, horizontalBar, line, pie, polarArea, radar, scatter这几种。 
			type: 'line',
			data: {
				//定义了统计图表的一个维度。
				labels: [x1,x2,x3],
				datasets: [{
					label: '部门被投诉次数统计',
					//定义了统计图表的另一个维度。
					data: [y1,y2,y3],
					backgroundColor: [
						'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)'
					],
					borderColor: [
						'rgba(255,99,132,1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)'
					],
					borderWidth: 1
				}]
			},
			options: {
				//responsive: false，意思是使用第二行canvas指定的宽和高来绘制统计图表。 
			    //如果response置为true，意思是响应式布局，会以全屏的方式显示图表。
				responsive: false,
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true
						}
					}]
				}
			}
		});
		
		
		
		/////////////////////////////////////
		var ctx2 = document.getElementById("myChart2").getContext('2d');
		var myChart2 = new Chart(ctx2, {
			type: 'pie',
			data: {
				labels: [x1,x2,x3],
				datasets: [{
					label: '部门被投诉次数统计',
					data: [y1,y2,y3],
					backgroundColor: [
						'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)'
					],
					borderColor: [
						'rgba(255,99,132,1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)'
					],
					borderWidth: 1
				}]
			},
			options: {
				responsive: false,
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true
						}
					}]
				}
			}
		});
		
		////////////////////////////////////
		var ctx3 = document.getElementById("myChart3").getContext('2d');
		var myChart3 = new Chart(ctx3, {
			type: 'bar',
			data: {
				labels: [x1,x2,x3],
				datasets: [{
					label: '部门被投诉次数统计',
					data: [y1,y2,y3],
					backgroundColor: [
						'rgba(255, 99, 132, 0.2)', 'rgba(54, 162, 235, 0.2)', 'rgba(255, 206, 86, 0.2)', 'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)', 'rgba(255, 159, 64, 0.2)'
					],
					borderColor: [
						'rgba(255,99,132,1)', 'rgba(54, 162, 235, 1)', 'rgba(255, 206, 86, 1)', 'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)', 'rgba(255, 159, 64, 1)'
					],
					borderWidth: 1
				}]
			},
			options: {
				responsive: false,
				scales: {
					yAxes: [{
						ticks: {
							beginAtZero: true
						}
					}]
				}
			}
		});
		///////
	}

</script>

</head>
<body class="rightBody">
	<div id="dvCalc" ></div>
	<form name="form1"
		action=""
		method="post">
		<div class="p_d_1">
			<div class="p_d_1_1">
				<div class="content_info">
					<div class="c_crumbs">
						<div>
							<strong>投诉受理管理</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 每页显示&nbsp;<select
								id="sePageSize" name="pageSize">
								<option value="10" selected="selected">10</option>
								<option value="8">8</option>
								<option value="5">5</option>
							</select>条
							<span style="color:red;">可以统计出每个部门被投诉的次数</span>
						</div>
					</div>
					<div class="search_art">
						<ul>
							<li>投诉标题：<input type="text" name="comp_title" value=""
								id="comp_title" class="s_text" style="width: 160px;" />
							</li>
							<li>投诉时间：<input type="text" name="startTime" value=""
								readonly="readonly" id="startTime" class="s_text"
								style="width: 160px;"
								onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd HH:mm'});" />
								- <input type="text" name="endTime" value="" readonly="readonly"
								id="endTime" class="s_text" style="width: 160px;"
								onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd HH:mm'});" />
							</li>
							<li>状态：<select name="state" id="complain_state">
									<option value="" selected="selected">全部</option>
									<option value="0">待受理</option>
									<option value="1">已受理</option>
									<option value="2">已失效</option>
							</select>


							</li>
							<li><input type="button" id="btnSearch" class="s_button"
								value="搜 索" /></li>
							<li><input type="button" id="btnReset" class="s_button" value="重置"/></li>
							<li style="float: right;"><input type="button" value="统计"
								class="s_button" id="btnCalc" />&nbsp;</li>
						</ul>
					</div>

					<div class="t_list" style="margin: 0px; border: 0px none;">
						<table width="100%" border="0" id="tblComplain">
							<tr class="t_tit">
								<td align="center">投诉标题</td>
								<td width="120" align="center">被投诉部门</td>
								<td width="120" align="center">被投诉人</td>
								<td width="140" align="center">投诉时间</td>
								<td width="100" align="center">受理状态</td>
								<td width="100" align="center">操作</td>
							</tr>

							<c:forEach items="${complain_list }" var="map" varStatus="status">
								<c:if test="${status.count%2 != 0 }">
									<tr bgcolor="f8f8f8">
								</c:if>
								<c:if test="${status.count%2 == 0 }">
									<tr>
								</c:if>
								<td align="center">${map["comp_title"] }</td>
								<td align="center">${map["to_comp_dept"] }</td>
								<td align="center">${map["to_comp_name"] }</td>
								<td align="center">${map["comp_time"] }</td>
								<c:if test="${map['state']==0 }">
									<td align="center">待受理</td>
									<td align="center"><a name="btnDeal"
										href="javascript:void(0);" comp_id="${map['comp_id'] }">受理</a></td>
								</c:if>
								<c:if test="${map['state']==1 }">
									<td align="center">已受理</td>
									<td align="center"><a name="btnLook"
										href="javascript:void(0);" class="disabled"
										comp_id="${map['comp_id'] }">查看</a></td>
								</c:if>
								<c:if test="${map['state']==2 }">
									<td align="center">已失效</td>
									<td align="center"><a name="btnLook"
										href="javascript:void(0);" class="disabled"
										comp_id="${map['comp_id'] }">查看</a></td>
								</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>

				<div class="c_pate" style="margin-top: 5px;">
					<table width="100%" class="pageDown" border="0" cellspacing="0"
						id="tblPage" cellpadding="0">
						<tr>
							<td align="right">总共 <span id="totalRecord" style="color: red;">${complain_list_totalRecord }</span> 条记录，当前第 <span
								id="currentPage" style="color: red;">${complain_list_curPage }</span> 页，共
								<span id="totalPage" style="color: red;">${complain_list_totalPage }</span> 页 &nbsp;&nbsp; <a
								href="javascript:void(0);" id="btnPrePage">上一页</a>&nbsp;&nbsp; <a id="btnNextPage"
								href="javascript:void(0);">下一页</a> 到&nbsp;<input
								id="txtGoPage" type="text" style="width: 30px;" min="1" /><input
								id="btnGo" type="button" value="Go" /> &nbsp;&nbsp;
							</td>
						</tr>
					</table>
				</div>
				
<!-- 				这两个canvas结点作为最后绘制出的图表显示的一个容器 -->
			<canvas style="width:300px; height:300px;display:inline"  id="myChart" ></canvas>
			<canvas style="width:300px; height:300px;display:inline"  id="myChart2" ></canvas>
			<canvas style="width:300px; height:300px;display:inline"  id="myChart3" ></canvas>
			</div>
		</div>
	</form>

</body>
</html>