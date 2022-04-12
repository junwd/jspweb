<%@ page contentType="text/html; charset=utf-8" import="java.sql.*"%>
<jsp:useBean id="db" class="dbBean.DBcon" scope="session" />
<html>
<body>
	<center>
		<h2>
			您最喜爱阅读的图书是：
			<h2>
				<form method="post" action="updatecount.jsp">
					<table border bordercolor="#0066FF" bgcolor="#CCFFFF">
						<%
                            ResultSet rs = db.executeQuery("select * from vote");
                            while (rs.next()) {
                                out.println("<tr>");
                                out.println("<td><input type='radio'name='id'value='" + rs.getString("id") + "'>");
                                out.println(rs.getString("item"));
                                out.println("</td></tr>");
                            }
                            rs.close();
                            db.close();
                            session.setMaxInactiveInterval(-1);
                        %>
						<tr>
							<td align="center"><input type="submit" value="投票"></td>
						</tr>
						</tr>
						<td align="center"><a href="info.jsp">但看投票</a></td>
						</tr>
					</table>
				</form>
				<p>
					<a href="manage.jsp">投票系统维护</a>
	</center>
</body>
</html>