<%@ page language="java" import="java.util.*,bean.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'detail.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  这是待做的详细信息页面
<%--    <% Title titles = (Title) session.getAttribute("titles"); %>
   <table style="TEXT-ALIGN: center" cellSpacing="0" cellPadding="0" width="590" border="0">
	<tr height="100">
		<td colspan="3"><h2><%=titles.getTitle()%></h2>	</td>
	</tr>
	<tr>
		<td rowspan="5">
		<img style="border: thin solid black" width="80" height="120"
			src="images/<%=titles.getImageFile()/*titles.getImageFile()*/%>"
			alt="<%=titles.getImageFile()%>" />
		</td>
		<td class="bold" align="left">鍥句功缂栧彿锛?/td>
    	<td align="left"><%=titles.getIsbn()%></td>
	</tr>
    <tr align="left">
		<td class="bold" align="left">浠锋牸锛?/td>
		<td align="left"><%=titles.getPrice()%></td>
	</tr>
	<tr align="left">
		<td class="bold">鐗堟湰鍙凤細</td>
		<td><%=titles.getEditionNumber()%></td>
	</tr>
	<tr align="left">
		<td class="bold">鐗堟潈锛?/td>
		<td><%=titles.getCopyright()%></td>
	</tr>
	<tr align="left">
		<td>
		<form method="post" action="./AddTitlesToCart"><p>
			<input type="submit" value="鏀惧叆璐墿杞? /></p>
		</form></td>
		<td>
		<form method="get" action="viewCart.jsp"><p>
			<input type="submit" value="鏌ョ湅璐墿杞? /></p>
		</form></td>
	</tr>
	</table>

  </body> --%>
</html>
