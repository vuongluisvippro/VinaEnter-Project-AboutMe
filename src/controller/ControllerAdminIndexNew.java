	package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import library.LibraryConstant;
import library.LibraryPagination;
import library.LibraryPermission;
import model.ModelCategory;
import model.ModelNew;

/**
 * Servlet implementation class ControllerAdminIndexNeww
 */
@SuppressWarnings("all")
public class ControllerAdminIndexNew extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminIndexNew() {
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
		if(!LibraryPermission.isLogin(request, response)){
			return;
		}
		if(request.getParameter("showall")!=null){
			cont = true;
		}
		if(request.getParameter("search")!=null){
			String searchName = new String(request.getParameter("searchName").getBytes("ISO-8859-1"),"UTF-8");
			String searchDM = new String(request.getParameter("searchDM").getBytes("ISO-8859-1"),"UTF-8");
			String searchActive = new String(request.getParameter("searchActive").getBytes("ISO-8859-1"),"UTF-8");
			request.setAttribute("listSearch", new ModelNew().getListSearch(searchName,searchDM,searchActive));
			request.setAttribute("alCat", new ModelCategory().getList());
			RequestDispatcher rd = request.getRequestDispatcher("/admin/tin-tuc.jsp");
			rd.forward(request, response);
		}
		if(cont){
			// tính số trang
			request.setAttribute("sotrang", new LibraryPagination().getNumberPage(new ModelNew().getSum()));
			// lấy trang hiện tại
			int current_page = new LibraryPagination().getCurrentPage(request.getParameter("page"));
			request.setAttribute("current_page", current_page);
			// tính offset 
			int offset = new LibraryPagination().getOffset(current_page);
			request.setAttribute("alNew",new ModelNew().getListForPagination(offset,LibraryConstant.ROW_COUNT));
			request.setAttribute("alCat", new ModelCategory().getList());
			RequestDispatcher rd = request.getRequestDispatcher("/admin/tin-tuc.jsp");
			rd.forward(request, response);
		}
	}
}
