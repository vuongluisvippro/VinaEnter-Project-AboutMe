<%@page import="bean.New"%>
<%@page import="bean.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ModelNew"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">

	<div class="module">
		 <h2><span>Cập nhật tin tức</span></h2>		
		 <%
		 	New item = new New();
		 	item = (New)request.getAttribute("itemNew");
		 %>
		 <div class="module-body">
			<form action="<%=request.getContextPath()%>/admin/cap-nhat-tin-tuc?type=capnhat&cid=<%=item.getId_new()%>" method="post" enctype="multipart/form-data">
				<p>
					<label>Tên tin</label>
					<input type="text" name="name" value="<%=item.getName()%>" class="input-medium" />
				</p>
				<p>
					<label>Danh mục tin</label>
					<select  name="namecat" class="input-short">
					<%
						ArrayList<Category> alCat = (ArrayList<Category>)request.getAttribute("alCat");
						for(Category cat : alCat){
							if(item.getId_cat() == cat.getId_cat()){
								%><option value="<%=cat.getId_cat()%>" selected><%=cat.getName()%></option><%
							}else{
								%><option value="<%=cat.getId_cat()%>"><%=cat.getName()%></option> <%
							}
						}
					%>
					</select>
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
				<p>
					<label>Chi tiết</label>
					<textarea  class="ckeditor" name="detail_text" rows="7" cols="90" class="input-long"><%=item.getDetail_text()%></textarea>
				</p>
				<fieldset>
					<input class="submit-green" name="them" type="submit" value="Cập nhật" /> 
				</fieldset>
			</form>
		 </div> <!-- End .module-body -->
	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 