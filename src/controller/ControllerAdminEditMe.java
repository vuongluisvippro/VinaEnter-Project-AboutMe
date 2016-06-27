package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Me;
import library.LibraryPermission;
import model.ModelMe;

/**
 * Servlet implementation class ControllerAdminEditMe
 */
@SuppressWarnings("all")
public class ControllerAdminEditMe extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminEditMe() {
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
		request.setAttribute("item", new ModelMe().getItem());
		if(request.getParameter("capnhat")!=null){
			int  id_aboutme = new ModelMe().getItem().getId_aboutme();
			String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
			String detail_text = new String(request.getParameter("detail_text").getBytes("ISO-8859-1"),"UTF-8");
			Me item = new Me(id_aboutme, name, detail_text);
			if(new ModelMe().editItem(item) > 0){
				request.setAttribute("item", new ModelMe().getItem());
				request.setAttribute("msg", "edit1");
			}else{
				request.setAttribute("msg", "edit0");
			}
		}
		RequestDispatcher rd = request.getRequestDispatcher("/admin/about-me.jsp");
		rd.forward(request, response);
	}
}
