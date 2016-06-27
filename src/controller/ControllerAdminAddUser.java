package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.MessageBundle;
import bean.User;
import library.LibraryPermission;
import model.ModelUser;
import utils.ValidateCat;
import utils.ValidateUser;

/**
 * Servlet implementation class ControllerPublicIndex
 */
@SuppressWarnings("all")
public class ControllerAdminAddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminAddUser() {
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
			String username = new String(request.getParameter("username").getBytes("ISO-8859-1"),"UTF-8");
			String password = new String(request.getParameter("password").getBytes("ISO-8859-1"),"UTF-8");
			String fullname = new String(request.getParameter("fullname").getBytes("ISO-8859-1"),"UTF-8");
			if(new ValidateUser().checkName(username)){
				messageBundle.setExist("<b style=\"color: red\"><strong>Tên người dùng đã tồn tại trong hệ thống</strong></b>");
				cont = false;
			}
			if(new ValidateCat().validateName(fullname)){
				messageBundle.setName("<b style=\"color: red\"><strong>Tên người dùng không chứa ký tự đặc biệt</strong></b>");
				cont = false;
			}
			if(cont){
				if(new ModelUser().addItem(new User(username,password,fullname)) > 0){
					response.sendRedirect(request.getContextPath()+"/admin/nguoi-dung?msg=add1");
				}else{
					response.sendRedirect(request.getContextPath()+"/admin/nguoi-dung?msg=add0");
				}
			}else{
				request.setAttribute("messageBundle", messageBundle);
				RequestDispatcher rd = request.getRequestDispatcher("/admin/nguoi-dung-them-moi.jsp");
				rd.forward(request, response);
			}
		}else{
			RequestDispatcher rdd = request.getRequestDispatcher("/admin/nguoi-dung-them-moi.jsp");
			rdd.forward(request, response);
		}
	}
}
