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
public class ControllerAdminEditCat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminEditCat() {
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
		/**
		 * Viết phương thức get data from form and insert database
		 */
		int id = 0;
		MessageBundle messageBundle = new MessageBundle();
		boolean cont = true;
		if(!LibraryPermission.isLogin(request, response)){
			return;
		}
		if(request.getParameter("cid")!=null){
			id = Integer.parseInt(request.getParameter("cid"));
			request.setAttribute("item", new ModelCategory().getItem(id));
		}
		if(request.getParameter("capnhat")!=null){
			String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
			if(new ValidateCat().checkNameVer(name,id)){
				messageBundle.setExist("<b style=\"color: red\"><strong>Danh mục tồn tại trong hệ thống</strong></b>");
				cont = false;
			}
			if(new ValidateCat().validateName(name)){
				messageBundle.setName("<b style=\"color: red\"><strong>Tên danh mục không chứa ký tự đặc biệt</strong></b>");
				cont = false;
			}
			if(cont){
				if(new ModelCategory().editItem(new Category(id,name)) > 0){
					response.sendRedirect(request.getContextPath()+"/admin/danh-muc?msg=edit1");
				}else{
					response.sendRedirect(request.getContextPath()+"/admin/danh-muc?msg=edit0");
				}
			}else{
				request.setAttribute("messageBundle", messageBundle);
				RequestDispatcher rd = request.getRequestDispatcher("/admin/danh-muc-cap-nhat.jsp");
				rd.forward(request, response);
			}
		}else{
			RequestDispatcher rdd = request.getRequestDispatcher("/admin/danh-muc-cap-nhat.jsp");
			rdd.forward(request, response);
		}
	}
}
