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
public class ControllerAdminEditSay extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminEditSay() {
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
		boolean cont = true;
		MessageBundle messageBundle = new MessageBundle();
		if(!LibraryPermission.isLogin(request, response)){
			return;
		}
		if(request.getParameter("cid")!=null){
			id = Integer.parseInt(request.getParameter("cid"));
			request.setAttribute("item", new ModelSay().getItem(id));
		}
		if(request.getParameter("capnhat")!=null){
			int id_saying = Integer.parseInt(request.getParameter("cid"));
			String content = new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
			String author = new String(request.getParameter("author").getBytes("ISO-8859-1"),"UTF-8");
			if(new ValidateSay().checkNameVer(content,id_saying)){
				messageBundle.setExist("<b style=\"color: red\"><strong>Nội dung đã trùng trong hệ thống</strong></b>");
				cont = false;
			}
			if(cont){
				if(new ModelSay().editItem(new Say(id_saying, content, author)) > 0){
					response.sendRedirect(request.getContextPath()+"/admin/cau-noi?msg=edit1");
				}else{
					response.sendRedirect(request.getContextPath()+"/admin/cau-noi?msg=edit0");
				}
			}else{
				request.setAttribute("messageBundle", messageBundle);
				request.setAttribute("item", new ModelSay().getItem(id_saying));
				RequestDispatcher rd = request.getRequestDispatcher("/admin/cau-noi-cap-nhat.jsp");
				rd.forward(request, response);
			}
		}else{
			RequestDispatcher rdd = request.getRequestDispatcher("/admin/cau-noi-cap-nhat.jsp");
			rdd.forward(request, response);
		}
	}
}
