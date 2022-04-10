<%@ page contentType="text/html;charset=utf-8" import="java.sql.*" %>
<jsp:useBean id="db" class="dbBean.DBcon" scope="session"/>
<%
    String delid = request.getParameter("delid");
    if (delid!= null) {
        db.executeUpdate("delete from vote where id =" + delid);
        db.close();
    }
%>
<jsp:forward page="manage.jsp"/>
