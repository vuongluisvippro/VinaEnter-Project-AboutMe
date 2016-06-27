package controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;

import bean.Advs;
import bean.MessageBundle;
import library.LibraryPermission;
import model.ModelAdvs;
import utils.ValidateAdvs;

/**
 * Servlet implementation class ControllerPublicIndex
 */
@SuppressWarnings("all")
public class ControllerAdminAddAdvs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminAddAdvs() {
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
		if("load".equals(request.getParameter("type"))){
			RequestDispatcher rd = request.getRequestDispatcher("/admin/quang-cao-them-moi.jsp");
			rd.forward(request, response);
		}else{
			ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
			List<FileItem> fileItems = null;
			try {
				fileItems = upload.parseRequest(request);
			} catch (FileUploadException e) {
				System.out.println(e.getMessage());
			}
			String name = "";
			String link = "";
			String banner = "";
			String banner_new = "";
			for(FileItem fileItem : fileItems){
				if(fileItem.isFormField()){
					String fieldName = fileItem.getFieldName();
					String fieldValue = new String(fileItem.getString().getBytes("ISO-8859-1"),"UTF-8");
					switch(fieldName){
						case "name":
							name = fieldValue;
							break;
						case "link":
							link = fieldValue;
							break;
						default:
							break;
					}
				}else{
					if(!fileItem.getName().isEmpty()){
						banner = fileItem.getName();
						banner_new = FilenameUtils.getBaseName(banner)+"-"+System.nanoTime()+"."+FilenameUtils.getExtension(banner);
						String filePath = request.getServletContext().getRealPath("")+File.separator+"files"+File.separator+banner_new;
						File file = new File(filePath);
						try {
							fileItem.write(file);
						} catch (Exception e) {
							System.out.println(e.getMessage());
						}
					}
				}
			}
			if(new ValidateAdvs().checkName(name)){
				messageBundle.setExist("<b style=\"color: red\"><strong>Quảng cáo đã tồn tại trong hệ thống</strong></b>");
				cont = false;
			}
			if(cont){
				Advs item = new Advs(name, banner_new, link);
				if(new ModelAdvs().addItem(item) > 0){
					response.sendRedirect(request.getContextPath()+"/admin/quang-cao?msg=add1");
				}else{
					response.sendRedirect(request.getContextPath()+"/admin/quang-cao?msg=add0");
				}
			}else{
				request.setAttribute("messageBundle", messageBundle);
				RequestDispatcher rd = request.getRequestDispatcher("/admin/quang-cao-them-moi.jsp");
				rd.forward(request, response);
			}
		}
	}
}
