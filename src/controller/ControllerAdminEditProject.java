package controller;

import java.io.File;
import java.io.IOException;
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
public class ControllerAdminEditProject extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminEditProject() {
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
		int id_project = 0;		
		if(!LibraryPermission.isLogin(request, response)){
			return;
		}
		if(request.getParameter("cid")!=null){
			id_project = Integer.parseInt(request.getParameter("cid"));
			request.setAttribute("item", new ModelProject().getItem(id_project));
		}
		if("capnhat".equals(request.getParameter("submit"))){
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
					if(!fileItem.getName().isEmpty()){
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
			Project item = new Project(id_project, name, preview_text, picture_new, link);
			if(new ModelProject().editItem(item) > 0){
				response.sendRedirect(request.getContextPath()+"/admin/du-an?msg=edit1");
			}else{
				response.sendRedirect(request.getContextPath()+"/admin/du-an?msg=edit0");
			}
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("/admin/du-an-cap-nhat.jsp");
			rd.forward(request, response);
		}
	}
}
