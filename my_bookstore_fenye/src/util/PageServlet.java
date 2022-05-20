package util;

import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.PagerChuli;
/**
 * Servlet implementation class PageServlet
 */

public class PageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*int pageSize = Integer.parseInt(request.getParameter("pageSize"));*/
		int pageSize = 4;
		int pageNUm = Integer.parseInt(request.getParameter("pageNUm"));
		int limitMIn = (int) (pageNUm-1)*pageSize;
		PagerChuli chuli = new PagerChuli();
		chuli.setSql(limitMIn, pageSize, pageNUm);	
		//转发显示详细信息页面
		request.getRequestDispatcher("viewBook.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	@Override
	public void destroy(){
		super.destroy();
	}
	
	@Override
	public void init() throws ServletException{}

}
