package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Category;
import bean.MessageBundle;
import library.LibraryPermission;
import model.ModelCategory;
import utils.ValidateCat;

/**
 * Servlet implementation class ControllerPublicIndex
 */
@SuppressWarnings("all")
public class ControllerAdminAddCat extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminAddCat() {
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
			String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8"); 
			if(new ValidateCat().checkName(name)){
				messageBundle.setExist("<b style=\"color: red\"><strong>Danh mục tồn tại trong hệ thống</strong></b>");
				cont = false;
			}
			if(new ValidateCat().validateName(name)){
				messageBundle.setName("<b style=\"color: red\"><strong>Tên danh mục không chứa ký tự đặc biệt</strong></b>");
				cont = false;
			}
			if(cont){
				if(new ModelCategory().addItem(new Category(name)) > 0){
					response.sendRedirect(request.getContextPath()+"/admin/danh-muc?msg=add1");
				}else{
					response.sendRedirect(request.getContextPath()+"/admin/danh-muc?msg=add0");
				}
			}else{
				request.setAttribute("messageBundle", messageBundle);
				RequestDispatcher rd = request.getRequestDispatcher("/admin/danh-muc-them-moi.jsp");
				rd.forward(request, response);
			}
		}else{
			RequestDispatcher rdd = request.getRequestDispatcher("/admin/danh-muc-them-moi.jsp");
			rdd.forward(request, response);
		}
	}
}
