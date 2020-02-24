<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
   <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>  
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>   
    <title>服务预约管理</title>
    <link href="../../css/skin1.css" rel="stylesheet" type="text/css" />
    <script src="../../js/jquery/jquery-3.1.1.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="../../js/hxjzg.js"></script>
    <script src="../../js/listUI.js" type="text/javascript"></script>
  
</head>
<body class="rightBody">
<form name="form1" action="" method="post">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
                <div class="c_crumbs"><div><b></b><strong>服务预约管理</strong></div> </div>
                <div class="search_art">
                    <ul><li>
                       	预约编号：<input type="text" id="service_id"/> 
                    </li>
                    <li>
                       	预约时间：<input type="date" id="startTime" />
                              - 
                             <input type="date" id="endTime"/>
                    </li>
                    <li>
                       	状态：
                           <select name="item.dealDept" id="sub_state">
                          <option value="">全部</option>
                          <option value="1">预约失败</option>
                          <option value="0">预约成功</option>
                   
                          </select>
                    </li>
                    <li><input type="button" class="s_button" value="搜 索"  id="btnSearch"/></li>
                    <li style="float:right"></li>
                    </ul>
                </div>

                <div class="t_list" style="margin:0px; border:0px none;">
                    <table width="100%" border="0" id="tblService">
                        <tr class="t_tit">
                            <td align="center">预约编号</td>
                            <td width="120" align="center">预约事项</td>
                            <td width="120" align="center">预约地点</td>
                            <td width="140" align="center">预约时间</td>
                            <td width="100" align="center">预约人姓名</td>
                            <td width="100" align="center">状态</td>
							<td width="100" align="center">操作</td>
                        </tr>                      
                       
                        <c:forEach items="${sub_service }" var="a" varStatus="b">
                  		<tr bgcolor="f8f8f8">
                        <td align="center" >${a.rowno }<input type="hidden" class="bian${a.service_id }" value="${a.rowno } "/> </td>
                        <td align="center" ><input type="hidden" class="${a.service_id }" value="${a.matter }"/> ${a.matter_name } </td>
                        <td align="center">${a.sub_place }</td>
                        <td align="center">${a.sub_time }</td>
                        <td align="center">${a.subscriber }</td>
                        <td align="center">
	                        <c:choose>
		                          <c:when test="${a.sub_state == '2' }">未处理</c:when>                                  
		                          <c:otherwise>已处理</c:otherwise>                                  
	                        </c:choose>  
                        </td>
                        <td align="center">
                        	<c:if test="${a.sub_state == '2' }">
                       		   <a href="#" id="${a.service_id }" class="chuli">处理</a>
                            </c:if> 
                        </td>
                         </tr>
                    </c:forEach>
                      
                    </table>
                </div>
            </div>

        <div class="c_pate" style="margin-top: 5px;">
		<table width="100%" class="pageDown" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td align="right">
                 	总共 <span id="totalRecord">1</span> 条记录，当前第 <span id="currentPage">1</span> 页，共 <span id="totalPage">1</span> 页 &nbsp;&nbsp;
                            <a href="javasrcipt:void(0)" id="btnPrePage">上一页</a>&nbsp;&nbsp;<a href="javasrcipt:void(0)" id="btnNextPage">下一页</a>
					到&nbsp;<input id="txtGoPage" type="text" style="width: 30px;" min="1"
					max="" value="1" />&nbsp;<input id="btnGo" type="button" value="Go"/>
			    </td>
			</tr>
		</table>	
        </div>

        </div>
    </div>
</form>

</body>
</html>