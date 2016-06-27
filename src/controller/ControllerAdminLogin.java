package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.MessageBundle;
import bean.User;
import library.LibraryPermission;
import model.ModelUser;

/**
 * Servlet implementation class ControllerPublicIndex
 */
@SuppressWarnings("all")
public class ControllerAdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminLogin() {
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
		ModelUser mUser = new ModelUser();
		MessageBundle messageBundle = new MessageBundle();
		if(request.getParameter("submit")!=null){
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			User objUser = mUser.getUser(username,password);
			if(objUser!=null){
				HttpSession session = request.getSession();
				session.setAttribute("objUser", objUser);
				response.sendRedirect(request.getContextPath()+"/admin");
				return;
			}else{
				messageBundle.setExist("<p style=\"color: red\"><strong>Sai tên đăng nhập hoặc mật khẩu. Vui lòng thử lại</strong></p>");
				request.setAttribute("messageBundle", messageBundle);
				RequestDispatcher rd = request.getRequestDispatcher("/admin/login.jsp");
				rd.forward(request, response);
				/** Đảm bảo dừng tại đó không chạy tiếp nhé **/
				return;
			}
		}
		RequestDispatcher rd = request.getRequestDispatcher("/admin/login.jsp");
		rd.forward(request, response);
	}
}
