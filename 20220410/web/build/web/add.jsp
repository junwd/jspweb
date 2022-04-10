<%@ page contentType="text/html; charset=utf-8" import="java.sql.*"%>
<jsp:useBean id="db" class="dbBean.DBcon" scope="session" />
<%
    String additem=request.getParameter("additem");
    
    if (additem!= null) 
    {
        String sql= "insert into vote(item,count) values('" + additem + "'," + 0 + ")";
        db.executeUpdate(sql);
        db.close();
    }
%>
<jsp:forward page = "manage.jsp"/>