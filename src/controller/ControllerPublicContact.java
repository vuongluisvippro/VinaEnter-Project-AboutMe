package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Contact;
import model.ModelAdvs;
import model.ModelCategory;
import model.ModelContact;
import model.ModelSay;

/**
 * Servlet implementation class ControllerPublicContact
 */
@SuppressWarnings("all")
public class ControllerPublicContact extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerPublicContact() {
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
		if(request.getParameter("send")!=null){
			// Validate
			String fullname = new String(request.getParameter("fullname").getBytes("ISO-8859-1"),"UTF-8");
			String email = new String(request.getParameter("email").getBytes("ISO-8859-1"),"UTF-8");
			String address = new String(request.getParameter("address").getBytes("ISO-8859-1"),"UTF-8");
			int phone = Integer.parseInt(new String(request.getParameter("phone").getBytes("ISO-8859-1"),"UTF-8"));
			String content = new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
			if(new ModelContact().addContact(new Contact(fullname, email, address, phone, content)) > 0){
				response.sendRedirect(request.getContextPath()+"/lien-he?msg=add1");
			}else{
				response.sendRedirect(request.getContextPath()+"/lien-he?msg=add0");
			}
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("/contact.jsp");
			rd.forward(request, response);
		}
	}

}
