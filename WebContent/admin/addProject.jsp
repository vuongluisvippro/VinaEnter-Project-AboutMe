<%@page import="bean.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">

	<div class="module">
		 <h2><span>Thêm mới dự án</span></h2>		
		 <div class="module-body">
			<form action="<%=request.getContextPath()%>/admin/them-moi-du-an?type=them" method = "post" enctype="multipart/form-data">
				<p>
					<label>Tên dự án</label>
					<input type="text" name="name" value="" class="input-medium" />
				</p>
				<p>
					<label>Link</label>
					<input type="text" name="link" value="" class="input-medium" />
				</p>
				<p>
					<label>Hình ảnh</label>
					<img src="" alt ="" width="150px" height="150px">
					<input type="file"  name="picture" value="" />
				</p>
				<p>
					<label>Mô tả</label>
					<textarea name="preview_text" rows="7" cols="90" class="input-medium"></textarea>
				</p>
				<fieldset>
					<input class="submit-green" name="capnhat" type="submit" value="Thêm" /> 
				</fieldset>
			</form>
		 </div> <!-- End .module-body -->
	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 