<%@ page contentType="text/html; charset = utf-8" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ include file="checkadmin.jsp"%>
<jsp:useBean id="db" class="dbBean.DBcon" scope="session" />
<center>
	<h2>系统维护</h2>
	<table border bordercolor="#0099FF">
		<tr>
			<th colspan="3" bgcolor='#CCEEEE'>删除投票选项</th>
			<% ResultSet rs = db.executeQuery("select * from vote");
                    int i = 1;
                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + i + "</td>");
                        out.println("<td>" + rs.getString("item") + "</td>");
                        out.println("<td align='center'><a href='delete.jsp?delid=" + rs.getString("id")
                                + "'>刪除</a></td>");
                        i++;
                    }
                    rs.close();
                    db.close();
                %>
		
		<tr>
			<th colspan="3" bgcolor='#CCEEEE'>添加投票选项</th>
		<tr>
			<td colspan="3">
				<form method="post" action="add.jsp">
					内容<input type="text" name="additem" size="30"> <input
						type="submit" value="提交"> <input type="reset" value="重置">
				</form>
			</td>
		<tr>
			<td colspen="3" align="center" bgoolor='#CCFEE'><a
				href="vote.jsp">返回投票页面</a></td>
	</table>
</center>