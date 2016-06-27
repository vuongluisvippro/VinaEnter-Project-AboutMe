package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.MessageBundle;
import bean.Say;
import library.LibraryPermission;
import model.ModelSay;
import utils.ValidateSay;

/**
 * Servlet implementation class ControllerPublicIndex
 */
@SuppressWarnings("all")
public class ControllerAdminAddSay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminAddSay() {
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
		boolean cont = true;
		MessageBundle messageBundle = new MessageBundle();
		if(!LibraryPermission.isLogin(request, response)){
			return;
		}
		if(request.getParameter("them")!=null){
			String content = new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
			String author = new String(request.getParameter("author").getBytes("ISO-8859-1"),"UTF-8");
			if(new ValidateSay().checkName(content)){
				messageBundle.setExist("<b style=\"color: red\"><strong>Nội dung đã tồn tại trong hệ thống</strong></b>");
				cont = false;
			}
			if(cont){
				if(author.isEmpty()){
					author = "- Khuyết Danh";
				}
				if(new ModelSay().addItem(new Say(content, author)) > 0){
					response.sendRedirect(request.getContextPath()+"/admin/cau-noi?msg=add1");
				}else{
					response.sendRedirect(request.getContextPath()+"/admin/cau-noi?msg=add0");
				}
			}else{
				request.setAttribute("messageBundle", messageBundle);
				RequestDispatcher rd = request.getRequestDispatcher("/admin/cau-noi-them-moi.jsp");
				rd.forward(request, response);
			}
		}else{
			RequestDispatcher rdd = request.getRequestDispatcher("/admin/cau-noi-them-moi.jsp");
			rdd.forward(request, response);
		}
	}
}
