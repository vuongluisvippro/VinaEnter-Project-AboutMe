<%@page import="bean.MessageBundle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">
	<div class="module">
		 <h2><span>Thêm danh mục</span></h2>
		 <p style="color:red; font-style:bold">
		 <%
			 MessageBundle messageBundle = new MessageBundle();
			 if(request.getAttribute("messageBundle")!=null){
				 messageBundle = (MessageBundle)request.getAttribute("messageBundle");
			 }	 
		 %>
		 </p>
		 <div class="modul()e-body">
		 	<%
				if(messageBundle.getName()!=null){
					out.print(messageBundle.getName());
				}else if(messageBundle.getExist()!=null){
					out.print(messageBundle.getExist());
				}
		 	%>
			<form action="<%=request.getContextPath()%>/admin/them-moi-danh-muc" method="post" id="frmcat">
				<p>
					<label>Tên danh mục</label>
					<input type="text" name="name" value="" class="input-medium" />
				</p>
				<fieldset>
					<input class="submit-green" name="them" type="submit" value="Thêm" /> 
				</fieldset>
			</form>
			<script type="text/javascript">
	        	$(document).ready(function(){
	        		$('#frmcat').validate({
	        			rules:{
	        					name:{
	        						required:true,
	        						minlength:2,
	        						maxlength:255
	        					}
	        				},
	        			messages:{
	        					name:{
	        						required:"<p style = 'color:red'>Tên danh mục không bỏ trống!</p>",
	        					}
	        				}
	        		});
	        	});
        	</script>
		 </div> <!-- End .module-body -->
		
	</div>  <!-- End .module -->
	<div style="clear:both;"></div>
</div> <!-- End .grid_12 -->
<%@include file="/templates/admin/inc/footer.jsp" %> 