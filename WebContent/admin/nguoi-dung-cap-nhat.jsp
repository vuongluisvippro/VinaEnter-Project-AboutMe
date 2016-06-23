<%@page import="bean.MessageBundle"%>
<%@page import="bean.User"%>
<%@page import="bean.Category"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">

	<div class="module">
	<%
		User user = new User();
		user = (User)request.getAttribute("item");
	%>
		 <div class="modul()e-body">
		 	<%
		 	 MessageBundle messageBundle = new MessageBundle();
			 if(request.getAttribute("messageBundle")!=null){
				 messageBundle = (MessageBundle)request.getAttribute("messageBundle");
			 }	 
		 	%>
			<form action="<%=request.getContextPath()%>/admin/cap-nhat-nguoi-dung?cid=<%=user.getId_user()%>" method="post">
				<p>
					<label>Username</label>
					<input type="text" name="username" value="<%=user.getUsername()%>" class="input-medium" disabled/>
				</p>
				<p>
					<label>Password</label>
					<input type="text" name="password" value="" class="input-medium" />
				</p>
				<p>
					<label>Fullname</label>
					<input type="text" name="fullname" value="<%=user.getFullname()%>" class="input-medium" />
				</p>
				<%
					if(messageBundle.getName()!=null){
						out.print(messageBundle.getName());
					}
				%>
				<fieldset>
					<input class="submit-green" name="capnhat" type="submit" value="Cập nhật" /> 
				</fieldset>
			</form>
		 </div> <!-- End .module-body -->
	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 