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

import bean.Category;
import bean.New;
import library.LibraryPermission;
import model.ModelCategory;
import model.ModelNew;

/**
 * Servlet implementation class ControllerPublicIndex
 */
@SuppressWarnings("all")
public class ControllerAdminEditNew extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControllerAdminEditNew() {
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
		int id = 0;		
		if(!LibraryPermission.isLogin(request, response)){
			return;
		}
		if(request.getParameter("cid")!=null){
			id = Integer.parseInt(request.getParameter("cid"));
			request.setAttribute("itemNew", new ModelNew().getItem(id));
		}
		if("capnhat".equals(request.getParameter("type"))){
			ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
			List<FileItem> fileItems = null;
			try {
				fileItems = upload.parseRequest(request);
			} catch (FileUploadException e) {
				System.out.println(e.getMessage());
			}
			String name = "";
			int id_cat = 0;
			String picture = "";
			String picture_new = "";
			String preview_text = "";
			String detail_text = "";
			for(FileItem fileItem : fileItems){
				if(fileItem.isFormField()){
					// File common
					String fieldName = fileItem.getFieldName();
					String fieldValue = new String(fileItem.getString().getBytes("ISO-8859-1"),"UTF-8");
					switch(fieldName){
						case "name":
							name = fieldValue;
							break;
						case "namecat":
							id_cat = Integer.parseInt(fieldValue);
							break;
						case "preview_text":
							preview_text = fieldValue;
							break;
						case "detail_text":
							detail_text = fieldValue;
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
			New item = new New(id, name, preview_text, detail_text, id_cat, picture_new);
			if(new ModelNew().editItem(item) > 0){
				response.sendRedirect(request.getContextPath()+"/admin/tin-tuc?msg=edit1");
			}else{
				response.sendRedirect(request.getContextPath()+"/admin/tin-tuc?msg=edit0");
			}
		}else{
			request.setAttribute("alCat", new ModelCategory().getList());
			RequestDispatcher rd = request.getRequestDispatcher("/admin/tin-tuc-cap-nhat.jsp");
			rd.forward(request, response);
		}
	}
}
