package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ModelAdvs;
import model.ModelNew;
import model.ModelSay;

/**
 * Servlet implementation class ControllerPublicDetailNew
 */
public class ControllerPublicDetailNew extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerPublicDetailNew() {
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
		int id = 0;
		if(request.getParameter("cid")!=null){
			id = Integer.parseInt(request.getParameter("cid"));
		}
		request.setAttribute("alSay", new ModelSay().getList());
		request.setAttribute("alAdvs", new ModelAdvs().getList());
		request.setAttribute("itemNew", new ModelNew().getItem(id));
		RequestDispatcher rd = request.getRequestDispatcher("/news_detail.jsp");
		rd.forward(request, response);
	}
}
