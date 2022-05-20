package util;
import bean.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ToViewTitle extends HttpServlet {
	public ToViewTitle() {
		super();
	}
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		String isbn=request.getParameter("isbn");
		TitleDao titleDao=new TitleDaoImpl();
		Title titles=titleDao.findByIsbn(isbn);  //根据ISBN号查找图书
		HttpSession session=request.getSession();  //获取当前会话的session对象
		session.setAttribute("titles",titles); //将图书对象titles保存在session对象中,保存属性名为titles
		//转发显示详细信息页面
		request.getRequestDispatcher("detail.jsp").forward(request, response);
		//转发显示详细信息页面,detail_el.jsp页面采用了EL表达式。
		//request.getRequestDispatcher("detail_el.jsp").forward(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);
	}
	public void init() throws ServletException {
		// Put your code here
	}
}
