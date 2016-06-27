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
import model.ModelNew;
import model.ModelProject;

/**
 * Servlet implementation class ControllerAdminIndexNeww
 */
@SuppressWarnings("all")
public class ControllerAdminIndexProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminIndexProject() {
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
		if(!LibraryPermission.isLogin(request, response)){
			return;
		}
		/**
		 * Phân trang
		 */
		// Bước 1: Tính tổng số trang
		request.setAttribute("sotrang", new LibraryPagination().getNumberPage(new ModelProject().getSum()));
		// Bước 2: Xác định trang hiện tại
		int current_page = new LibraryPagination().getCurrentPage(request.getParameter("page"));
		request.setAttribute("current_page", current_page);
		// Bước 3: Tính vị trí offset
		int offset = new LibraryPagination().getOffset(current_page);
		request.setAttribute("alProject",new ModelProject().getListForPagination(offset,LibraryConstant.ROW_COUNT));
		RequestDispatcher rd = request.getRequestDispatcher("/admin/du-an.jsp");
		rd.forward(request, response);
	}
}
