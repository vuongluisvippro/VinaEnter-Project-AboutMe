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

import bean.Project;
import library.LibraryPermission;
import model.ModelProject;

/**
 * Servlet implementation class ControllerPublicIndex
 */
@SuppressWarnings("all")
public class ControllerAdminAddProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminAddProject() {
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
		if("load".equals(request.getParameter("type"))){ ;
			RequestDispatcher rd = request.getRequestDispatcher("/admin/du-an-them-moi.jsp");
			rd.forward(request, response);
		}else{
			/**
			 * @author Nguyễn Văn Vương
			 */
			ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
			List<FileItem> fileItems = null;
			try {
				fileItems = upload.parseRequest(request);
			} catch (FileUploadException e) {
				System.out.println(e.getMessage());
			}
			String name = "";
			String link = "";
			String picture = "";
			String picture_new = "";
			String preview_text = "";
			for(FileItem fileItem : fileItems){
				if(fileItem.isFormField()){
					// File common
					String fieldName = fileItem.getFieldName();
					String fieldValue = new String(fileItem.getString().getBytes("ISO-8859-1"),"UTF-8");
					switch(fieldName){
						case "name":
							name = fieldValue;
							break;
						case "link":
							link = fieldValue;
							break;
						case "preview_text":
							preview_text = fieldValue;
							break;
						default:
							break;
					}
				}else{
					// File special
					if(!fileItem.getName().isEmpty()){
						/**
						 * Nếu file trường upload ảnh khác null thì tiến hành upload ảnh và đưa vào trong hệ
						 * thống.
						 * XULYNGHIEPVU: Nếu như file ảnh đưa vào chuyển đổi tên tránh trùng với tên khác trong
						 * hệ thống.
						 */
						picture = fileItem.getName();
						picture_new = FilenameUtils.getBaseName(picture)+"-"+System.nanoTime()+"."+FilenameUtils.getExtension(picture);
						String filePath = request.getServletContext().getRealPath("")+File.separator+"files"+File.separator+picture_new;
						File file = new File(filePath);
						try {
							fileItem.write(file);
						} catch (Exception e) {
							System.out.println(e.getMessage());
						}
					}
				}
			}
			Project item = new Project(name, preview_text, picture_new, link);
			if(new ModelProject().addItem(item) > 0){
				response.sendRedirect(request.getContextPath()+"/admin/du-an?msg=add1");
			}else{
				response.sendRedirect(request.getContextPath()+"/admin/du-an?msg=add0");
			}
		}
	}
}
