<%@page import="bean.MessageBundle"%>
<%@page import="bean.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">

	<div class="module">
	<%
		Category cat = new Category();
		cat = (Category)request.getAttribute("item");
	%>
		 <div class="modul()e-body">
		 <p style="color:red">
		 	<%
			 MessageBundle messageBundle = new MessageBundle();
			 if(request.getAttribute("messageBundle")!=null){
				 messageBundle = (MessageBundle)request.getAttribute("messageBundle");
			 }	 
			 if(messageBundle.getName()!=null){
					out.print(messageBundle.getName());
				}else if(messageBundle.getExist()!=null){
					out.print(messageBundle.getExist());
			 }
		 	%>
		 </p>
			<form action="<%=request.getContextPath()%>/admin/cap-nhat-danh-muc?cid=<%=cat.getId_cat()%>" method="post" id="frmxcat">
				<p>
					<label>Tên danh mục</label>
					<input type="text" name="ten" value="<%=cat.getName()%>" class="input-medium" />
				</p>
				<fieldset>
					<input class="submit-green" name="capnhat" type="submit" value="Sữa" /> 
				</fieldset>
			</form>
		 </div> <!-- End .module-body -->

	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 