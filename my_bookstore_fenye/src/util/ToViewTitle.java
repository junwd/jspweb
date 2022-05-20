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
		Title titles=titleDao.findByIsbn(isbn);  //����ISBN�Ų���ͼ��
		HttpSession session=request.getSession();  //��ȡ��ǰ�Ự��session����
		session.setAttribute("titles",titles); //��ͼ�����titles������session������,����������Ϊtitles
		//ת����ʾ��ϸ��Ϣҳ��
		request.getRequestDispatcher("detail.jsp").forward(request, response);
		//ת����ʾ��ϸ��Ϣҳ��,detail_el.jspҳ�������EL���ʽ��
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
