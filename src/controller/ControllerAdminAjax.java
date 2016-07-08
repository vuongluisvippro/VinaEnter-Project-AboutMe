package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.New;
import model.ModelNew;

/**
 * Servlet implementation class ControllerAdminAjax
 */
@SuppressWarnings("all")
public class ControllerAdminAjax extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminAjax() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		int id_news = Integer.parseInt(request.getParameter("id_news"));
		int is_active = Integer.parseInt(request.getParameter("is_active"));
		String result = "";
		is_active = (is_active+1)%2;
		New item = new New(id_news,is_active);
		if(is_active == 1){
			new ModelNew().editItemActive(item);
			result += "<a href=\"javascript:void(0)\"  onclick=\"return doActive("+id_news+","+is_active+")\" title=\"\">";
			result += "<img src=\""+request.getContextPath()+"/templates/admin/images/tick-circle.gif\" alt=\"tick\"/>";
			result += "</a>";
		}else{
			new ModelNew().editItemActive(item);
			result += "<a href=\"javascript:void(0)\"  onclick=\"return doActive("+id_news+","+is_active+")\" title=\"\">";
			result += "<img src=\""+request.getContextPath()+"/templates/admin/images/minus-circle.gif\" alt=\"minus\"/>";
			result += "</a>";
		}
		out.print(result);
	}
}
