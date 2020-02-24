<html>
<head>
    <script type="text/javascript" src="../../js/jquery/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="../../js/hxjzg.js"></script>
    <link href="../../css/skin1.css" rel="stylesheet" type="text/css" />
    <title>纳税咨询管理</title>
</head>
<body class="rightBody">
<form id="form" name="form" action="${pageContext.request.contextPath}/consult/iandu" method="post" enctype="multipart/form-data">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>纳税咨询管理</strong>&nbsp;-&nbsp;咨询处理</div></div>
    <div class="tableH2">咨询详细信息<span style="color:red;">(待处理)</span></div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
    	
    	<!-- ******************咨询人信息********************* -->
    	<tr><td colspan="2" align="center">咨询人信息</td></tr>
        <tr>
            <td class="tdBg">咨询人单位：</td>
            <td>${con.con_dept}</td>
            <td hidden="hidden"><input type="text" name="consult_id" value="${con.consult_id}"/></td>
        </tr>
        <tr>
            <td class="tdBg">咨询人姓名：</td>
            <td>${con.con_name}</td>
        </tr>
        <tr>
            <td class="tdBg">咨询人手机：</td>
            <td>${con.con_mobile}</td>
        </tr>
        
        <!-- ***************************咨询信息********************* -->
        
        <tr><td colspan="2" align="center">咨询信息</td></tr>
        <tr>
            <td class="tdBg">咨询时间：</td>
            <td>
            	${con.con_time}
            </td>
        </tr>
        <tr>
            <td class="tdBg">咨询标题：</td>
            <td>${con.con_title}</td>
        </tr>
        <tr>
            <td class="tdBg">咨询内容：</td>
            <td><p>${con.con_content}</p></td>
        </tr>
        
         <!-- ***************************回复信息********************* -->
         
        <tr><td colspan="2" align="center">回复信息</td></tr>
        <tr>
            <td colspan="2">
            </td>
        </tr>
            <td class="tdBg">回复部门：</td>
            <td>
           <!--  <input type="text" name="reply_dept" value="" id="reply_replyDept"/> -->
           		<select name="reply_dept" id="reply_replyDept" style="width: 80px;">
						<option>部门A</option>
						<option>部门B</option>
						<option>部门C</option>
				</select>
            </td>
        </tr>
        <tr>
            <td class="tdBg">回复人：</td>
            <td>
            <input type="text" name="replyer" value="" id="reply_replyer"/>
            </td>
        </tr>

        <tr>
            <td class="tdBg" width="200px">回复内容：</td>
            <td><textarea name="reply_Content" cols="90" rows="8" id="reply_replyContent"></textarea></td>
        </tr>
    </table>
    <input type="hidden" name="complain.compId" value="4028eedd58b54a940158ba73a1730000" id="complain_compId"/>
    <input type="hidden" name="strTitle" value="" id="strTitle"/>
    <input type="hidden" name="strState" value="" id="strState"/>
    <input type="hidden" name="startTime" value="" id="startTime"/>
    <input type="hidden" name="endTime" value="" id="endTime"/>
    <input type="hidden" name="pageNo" value="1" id="pageNo"/>
    <div class="tc mt20">
        <input type="submit" class="btnB2" value="保存" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
    </div>
    </div></div></div>
</form>
</body>
</html>