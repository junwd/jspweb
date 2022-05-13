package util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ImageServlet extends HttpServlet{
	
	public ImageServlet(){
		super();
		}
	
	@Override
	public void destroy(){
		super.destroy();
	}
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
	
		response.setContentType("text/html; charset=utf-8");
		//验证码图片的宽高
		int width = 78;
		int height = 20;
		//创建了图片缓冲对象，用于存储生成的验证码图片

		BufferedImage bim = new BufferedImage(78, 20, BufferedImage.TYPE_INT_BGR);

		Graphics g = bim.getGraphics();

		Random  rm = new Random();

		g.setColor(new Color(rm.nextInt(100),205,rm.nextInt(100)));

		g.fillRect(0, 0, width, height);

		StringBuffer sbf = new StringBuffer("");

		for ( int i = 0;i<4;i++){
			g.setColor(Color.black);
			g.setFont(new Font("宋体",Font.BOLD|Font.ITALIC,22));
			
			int n = rm.nextInt(10);

			sbf.append(n);

			g.drawString(""+n, i*15+5, 18);
		}

		HttpSession session = request.getSession(true);
		session.setAttribute("piccode", sbf);
	
		response.setHeader("Prama", "no-cache");
		response.setHeader("Coche-Control", "no-cache");
		response.setDateHeader("Expires", 0);
		response.setContentType("image/jpeg");

		ImageIO.write(bim, "JPG", response.getOutputStream());
		response.getOutputStream().close();
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request,response);		
	}
	@Override
	public void init() throws ServletException{}
	

}
