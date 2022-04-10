<%@ page contentType="text/html; charset=utf-8" import="java.sql.*"%>
<jsp:useBean id="db" class="dbBean.DBcon" scope="session"/>
<% //更新投票项计数
    String id = request.getParameter("id");
    ResultSet rs = db.executeQuery("select * from vote where id=" + id);
    int num = 0;
    if (rs.next()) num = rs.getInt("count");
    num++;
    db.executeUpdate("update vote set count=" + num + "where id=" + id);
    rs.close();
db.close();
%>
<jsp:forward page="info.jsp"/>