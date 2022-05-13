<%@ page language="java" import="java.util.*,bean.*" pageEncoding="UTF-8"%>
<jsp:useBean id = "dao" class = "bean.TitleDaoImpl"  scope = "request"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>浏览图书</title>
    
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
  <center>
   <h1>浏览图书</h1>
   <table align ="center" bgcolor = lightgrey>
	<tr><th>ISBN</th><th>书名</th><th>版本</th><th>发布时间</th><th>价格</th></tr>
	<% List list = dao.getTitles();
		Title titles = null;
		for(int i = 0;i<list.size();i++)
		{
			titles = (Title)list.get(i);
	%> 
			 <tr bgcolor = cyan> 
			 
			 <td><a href ="./ToViewTitle?isbn = <%=titles.getIsbn()%>"title = "图书详情"><%=titles.getIsbn() %></a></td>
			 <td><%=titles.getTitle() %></td> 
			 <td><%=titles.getEditionNumber() %></td>
			 <td><%=titles.getCopyright() %></td>
			 <td><%=titles.getPrice() %></td>
			 
			 </tr>
	 <%
	 }
	  %>
   </table>
    
  </center>
  </body>
</html>
