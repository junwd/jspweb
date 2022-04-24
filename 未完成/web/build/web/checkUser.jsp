<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=utf-8" %>
<jsp:useBean id="db" class="bean.DBcon" scope = "request"/>
<html>
    <head>
        <title>登录验证页面［checkUser.jsp］</title>
    </head>
    <body>
        <%
            request.setCharacterEncoding("GBK");
            String name = request.getParameter("loginName");
            String password = request.getParameter("password");
        %>
        你输入的用户名是：< %＝name % ><br><br>
        <%
            Connection con = db.getConnction();
            Statement stmt = con.createStatement();
            String sql = "select * from userinfo";
            sql += "where loginname='" + name + "' and password= '" + password + "'";
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                session.setAttribute("userName", name);
                response.sendRedirect("main.jsp");
            } else {
                out.print("无此用户或密码有误，登录失败！<br><br>");
                out.print("<a href='index.html'>重新登陆<//a>");
            }
        %>
    </body>
</html>