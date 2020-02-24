<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
   <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>  
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>预约服务事项管理</title>
 <script type="text/javascript" src="../../js/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="../../js/hxjzg.js"></script>
    <link href="../../css/skin1.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../js/my_sub_user.js"></script>
</head>
<body class="rightBody">
<form name="form1" action="" method="post">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
                <div class="c_crumbs"><div><b></b><strong>预约事项</strong></div> </div>
                <div class="search_art">
                <ul>
                    <li>
                        事项编号：<input type="text" id="service_id" />
                    </li>
					<li>
                        事项名称：<input type="text" id="Sub_name"/>
                    </li>
					<li>
                        处理部门：
                         
                          <select name="item.dealDept" id="selector">
                          <option value="">全部</option>
                          <option value="部门A">部门A</option>
                          <option value="部门B">部门B</option>
                          <option value="部门C">部门C</option>
                          </select>
                      
                    </li>
                    <li><input type="button" class="s_button" value="搜 索"  id="btnSearch"/></li>
                    <li style="float:right;">
                        <input type="button" value="新增" class="s_button" onclick="doAdd(1)"/>&nbsp;
                        
                        <input type="button" value="删除" class="s_button" onclick="doDeleteAll()"/>&nbsp;
                    </li>
                    </ul>
                </div>

                <div class="t_list" style="margin:0px; border:0px none;">
     <table width="100%" border="0" id="tbl">
                        <tr class="t_tit">
                            <td width="30" align="center"><input type="checkbox" id="selAll" onclick="doSelectAll()" /></td>
                            <td align="center">事项编号</td>
                            <td width="120" align="center">事项名称</td>
                            <td width="120" align="center">发布部门</td>
                            <td width="140" align="center">发布人</td>
							<td width="140" align="center">发布时间</td>
                            <td width="80" align="center">状态</td>
                            <td width="120" align="center">操作</td>
                        </tr>
              <c:forEach items="${sub_matter}" var="a" varStatus="b">
                   <tr bgcolor="f8f8f8">
                        
                        
           				 <td align="center"><input type="checkbox" name="selectedRow" value='${a.matter_id }'/></td>
                       
                         <td align="center">${a.matter_no }</td>
                         <td align="center">${a.matter_name }</td>
                         <td align="center">${a.matter_dept }</td>
                         <td align="center">${a.matter_user }</td>
                         <td align="center">${a.matter_time }</td>
                         <td align="center"><c:choose>
		                          <c:when test="${a.matter_state == '0' }">有效</c:when>
		                         <c:otherwise>无效</c:otherwise>
                          </c:choose> </td>
   
                      
           				 <td> <c:choose>
		                         <c:when test="${a.matter_state == '0' }"><a href="#" onclick="doting(this.id)" id="t${a.matter_id }" > 停用</a></c:when>
		                         <c:otherwise><a href="#" onclick="doqi(this.id)" id="q${a.matter_id }" > 启用</a></c:otherwise>
                         </c:choose>  <a href="#" class="bianji"  id="b${a.matter_id }">编辑</a>  <a href="#" onclick="doDelete(this.id)" id="${a.matter_id }">删除</a>  </td>
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