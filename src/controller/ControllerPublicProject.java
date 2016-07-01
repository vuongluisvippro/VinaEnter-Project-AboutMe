package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Contact;
import library.LibraryConstant;
import library.LibraryPagination;
import model.ModelAdvs;
import model.ModelCategory;
import model.ModelContact;
import model.ModelProject;
import model.ModelSay;

/**
 * Servlet implementation class ControllerPublicContact
 */
@SuppressWarnings("all")
public class ControllerPublicProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static int sotrang;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerPublicProject() {
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
		request.setAttribute("alSay", new ModelSay().getList());
		request.setAttribute("alAdvs", new ModelAdvs().getList());
		// Bước 1: Tính tổng số trang
		sotrang = new LibraryPagination().getNumberPage(new ModelProject().getSum());
		request.setAttribute("sotrang", sotrang);
		// Bước 2: Xác định trang hiện tại
		int current_page = new LibraryPagination().getCurrentPage(request.getParameter("page"));
		if(request.getParameter("prev")!=null){
			if(Integer.parseInt(request.getParameter("prev"))>1){
				current_page = Integer.parseInt(request.getParameter("prev")) - 1;
			}
		}
		if(request.getParameter("next")!=null){
			if(Integer.parseInt(request.getParameter("next")) < sotrang){
				current_page = Integer.parseInt(request.getParameter("next")) + 1;
			}
		}
		request.setAttribute("current_page", current_page);
		// Bước 3: Tính vị trí offset
		int offset = new LibraryPagination().getOffset(current_page);
		request.setAttribute("alProject",new ModelProject().getListForPagination(offset,LibraryConstant.ROW_COUNT));
		RequestDispatcher rd = request.getRequestDispatcher("/projects.jsp");
		rd.forward(request, response);
	}
}
