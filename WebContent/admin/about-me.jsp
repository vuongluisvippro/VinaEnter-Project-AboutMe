<%@page import="bean.Me"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">
	<div class="module">
		 <h2><span>Cập nhật thông tin giới thiệu</span></h2>		
		 <div class="module-body">
		 <%
		 	Me me = new Me();
		 	if(request.getAttribute("item")!=null){
		 		me = (Me)request.getAttribute("item");
		 	}
		 	if("edit1".equals((String)request.getAttribute("msg"))){
		 		out.print("<p style=\"color: green\"><strong>Cập nhật thành công</strong></p>");
		 	}else if("edit0".equals((String)request.getAttribute("msg"))){
		 		out.print("<p style=\"color: red\"><strong>Cập nhật thất bại</strong></p>");
		 	}
		 %>
			<form action="<%=request.getContextPath()%>/admin/gioi-thieu" method = "post">
				<p>
					<label>Tiêu đề</label>
					<input type="text" name="name" value="<%=me.getName()%>" class="input-medium" />
				</p>
				<p>
					<label>Chi tiết</label>
					<textarea  class="ckeditor" name="detail_text" rows="7" cols="90" class="input-long"><%=me.getDetail_text()%></textarea>
				</p>
				<fieldset>
					<input class="submit-green" name="capnhat" type="submit" value="Cập Nhật" /> 
				</fieldset>
			</form>
		 </div> <!-- End .module-body -->
	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 