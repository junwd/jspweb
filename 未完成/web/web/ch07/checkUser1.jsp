<%@ page language="java" import = "java.sql.*" contentType="text/html; charset=utf-8" %>
<jsp:useBean id="db" class="bean.DBcon" scope="request" />
<html>
    <head><title>登录验证页面[checkUser.jsp]</title></head> 

    <%
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("user");
        String password = request.getParameter("password");
        String checkcode = request.getParameter("checkcode");
        String piccode = request.getSession().getAttribute("piccode").toString();
    %>

    你输入的验证码是：< % =checkcode %><br>
    由 Servlet 生成的验证码是：< % =piccode %><br><br> 
    你输入的用户名是：< % =username %><br>
    你输入的密码是：< % =password %><br><hr>
    <%
        Connection con = db.getConnction();
        Statement stmt = con.createStatement();
        String sql = "select *from userinfo";
        sql += "where loginname='" + username + "' and password = '" + password + "'";
        ResultSet rs = stmt.executeQuery(sql);
        if (checkcode.equals(piccode) && rs.next()) {
            session.setAttribute("userName", username);
            out.print("<font color=green>恭喜你，通过验证！</font><br><br>");
            out.print("<a href='main.jsp'>转向主页面<//a>");
        } else {
            out.print("<font color==red> 遗憾！验证码错误或无用户或者密码错误，重新登陆</font><br>");
            out.print("<a href='login.jsp'>重新登录<//a>");
        }%>
</html>