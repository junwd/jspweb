<%@ page contentType="text/html; pageEncoding=UTF-8" import="java.sql.*"%>
<jsp:useBean id="db" class="dbBean.DBcon" scope="session" />
<%
    request.setCharacterEncoding("utf-8");
    String additem=request.getParameter("additem");
    
    if (additem!= null) 
    {
        String sql= "insert into vote(item,count) values('" + additem + "'," + 0 + ")";
        db.executeUpdate(sql);
        db.close();
    }
%>
<jsp:forward page="manage.jsp" />