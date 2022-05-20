<%@ page language="java" import="java.util.*,bean.*" pageEncoding="UTF-8"%>
<jsp:useBean id = "dao" class = "bean.TitleDaoImpl"  scope = "request"/>
<jsp:useBean id = "Pager" class = "bean.PagerChuli"  scope = "request"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    
    <title>浏览图书</title>
    
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
  <center>
   <h1>浏览图书</h1>
   <table align ="center" bgcolor = lightgrey>
	<tr><th>ISBN</th><th>书名</th><th>版本</th><th>发布时间</th><th>价格</th></tr>
	<% List list = dao.getTitles();
		Title titles = null;
		for(int i = 0;i<list.size();i++)
		{
			titles = (Title)list.get(i);
	%> 
			 <tr bgcolor = cyan> 
			 
			 <td><a href ="./ToViewTitle?isbn = <%=titles.getIsbn()%>"title = "图书详情"><%=titles.getIsbn() %></a></td>
			 <td><%=titles.getTitle() %></td> 
			 <td><%=titles.getEditionNumber() %></td>
			 <td><%=titles.getCopyright() %></td>
			 <td><%=titles.getPrice() %></td>
			 
			 </tr>
	 <%
	 }
	  %>
	  </table>
	 <form action ="./PageServlet" action="post" method = "post" name = "tiaozhuanNum">	
	  <table>
	  <%
	   Pager pager = new Pager();
	   pager = Pager.getPager();%>
	  <tr>
	  <td>共<%=pager.getTotolPage() %>页</td>
	  <td>每页显示<%=pager.getPageSize() %>条数据</td>
	  <td >当前是第<%=pager.getCurrentPage() %>页</td></tr>
   </table>
   <p>跳转到第<input type = text name = pageNUm size = "5">页
	  <input type = button  value = "跳转" onclick = "RegisterSubmit()"></p>
    </form>
      
  </center>
  </body>
  
  <script language = "javascript" type="text/javascript">
    function RegisterSubmit(){
       with(document.tiaozhuanNum){
			var pageNum = pageNUm.value;
			if(pageNum<=0||pageNum><%=pager.getTotolPage() %>)alert("请正确填写跳转的页码")
			else submit();
			}			
		}
	</script>
		
</html>
