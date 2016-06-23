<%@page import="bean.MessageBundle"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/templates/admin/inc/header.jsp" %>
<!-- Form elements -->    
<div class="grid_12">
	<div class="module">
		 <h2><span>Thêm mới câu nói</span></h2>
		 <%
			 MessageBundle messageBundle = new MessageBundle();
			 if(request.getAttribute("messageBundle")!=null){
				 messageBundle = (MessageBundle)request.getAttribute("messageBundle");
			 }	 
		 %>
		 <div class="modul()e-body">
			<form action="<%=request.getContextPath()%>/admin/them-moi-cau-noi" method="post" id="frmsay">
			<%
				if(messageBundle.getExist()!=null){
					out.print(messageBundle.getExist());
				}
		 	%>
				<p>
					<label>Nội dung</label>
					<input type="text" name="content" value="" class="input-medium" />
				</p>
				<p>
					<label>Tác giả</label>
					<input type="text" name="author" value="" class="input-medium" />
				</p>
				<fieldset>
					<input class="submit-green" name="them" type="submit" value="Thêm" /> 
				</fieldset>
			</form>
			<script type="text/javascript">
	        	$(document).ready(function(){
	        		$('#frmsay').validate({
	        			rules:{
	        					content:{
	        						required:true,
	        					}
	        				},
	        			messages:{
	        					content:{
	        						required:"<p style = 'color:red'>Nội dung không bỏ trống!</p>"
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