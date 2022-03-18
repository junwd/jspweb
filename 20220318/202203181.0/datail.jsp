<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
  <head>
    <title>detail.jsp</title>
  </head>  
  <body>
  <form action="table.jsp" method="post">
    <%   //对于中文参数，要重新解码编码。
         String xh=request.getParameter("xh"); //获得请求参数 
           //byte[] bytes=xh.getBytes("ISO-8859-1");//用ISO-8859-1分解成字节数组  
           //xh=new String(bytes,"utf-8");//将字节数组重新解码成字符串 
    %>
          学号为 <font size=4 color="red"><%=xh%></font> 同学的详细信息如下<br>
          <img src=images/12.jpg width=100 height=100>    
          <input type=submit value="返回">
          </form>
  </body>
</html>