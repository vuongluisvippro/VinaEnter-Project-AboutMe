<%@page import="bean.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">

	<div class="module">
		 <h2><span>Cập nhật tin tức</span></h2>		
		 <%
		 	Project item = new Project();
		 	if(request.getAttribute("item")!=null){
		 		item = (Project)request.getAttribute("item");
		 	}
		 %>
		 <div class="module-body">
			<form action="<%=request.getContextPath()%>/admin/cap-nhat-du-an?submit=capnhat&cid=<%=item.getId_project()%>" method = "post" enctype="multipart/form-data">
				<p>
					<label>Tên dự án</label>
					<input type="text" name="name" value="<%=item.getName()%>" class="input-medium" />
				</p>
				<p>
					<label>Link</label>
					<input type="text" name="link" value="<%=item.getName()%>" class="input-medium" />
				</p>
				<p>
					<label>Hình ảnh</label>
					<img src="<%=request.getContextPath()%>/files/<%=item.getPicture()%>" alt ="" width="150px" height="150px">
					<input type="file"  name="picture" value="" />
				</p>
				<p>
					<label>Mô tả</label>
					<textarea name="preview_text" rows="7" cols="90" class="input-medium"><%=item.getPreview_text()%></textarea>
				</p>
				<fieldset>
					<input class="submit-green" name="capnhat" type="submit" value="Cập nhật" /> 
				</fieldset>
			</form>
		 </div> <!-- End .module-body -->
	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 