<%@ page language="java" import="java.util.*" import="java.sql.*" pageEncoding="UTF-8"%>
<jsp:useBean id="db" class="bean.DBcon" scope="request"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>登录验证页面</title>
    
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
  <%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("loginName");
	String password=request.getParameter("password"); 
	String checkcode = request.getParameter("checkcode");
	String piccode = request.getSession().getAttribute("piccode").toString();
    Connection con =db.getConnction();
	Statement stmt = con.createStatement();
	String sql="select * from userinfo";  //对userinfo表的查询
	sql+= " where loginname='"+name+"' and password='"+password+"'";
	ResultSet rs = stmt.executeQuery(sql); 
	
	if (piccode.equals(checkcode)&&rs.next()) 	//验证通过
	{ 
	    session.setAttribute("userName",name); //将用户名保存到session中
        response.sendRedirect("main.jsp");
	 }
	
   else {  //验证未通过
       out.print("验证码错误或无此用户或密码有误，登录失败！<br><br>");
       out.print("<a href='index.jsp'>重新登录</a>");
    } 
%> 
  </body>
</html>
